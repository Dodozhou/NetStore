package com.star.estore.web.servlet;

import com.star.estore.domain.Order;
import com.star.estore.domain.OrderItem;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.exception.OrderException;
import com.star.estore.factory.OrderServiceFactory;
import com.star.estore.service.OrderService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by hp on 2016/12/5.
 */
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String method = request.getParameter("method");

        if ("add".equals(method)){
            add(request,response);
        }else if("del".equals(method)){
            del(request,response);
        }else if ("search".equals(method)){
            search(request,response);
        }
    }
    //添加订单操作
    public void add(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        //检查用户是否登录
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.getWriter().write(
                    "请先<a href='" + request.getContextPath()
                            + "/index.jsp'>登录</a>");
            return;
        }
        // 1.将请求参数封装到Order对象中.
        Order order = new Order();
        // 1.1 表单数据
        try {
            BeanUtils.populate(order, request.getParameterMap()); // 只封装了表单数据到javaBean，简单说，只有receiverinfo
            // money两项
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        // 1.2 订单编号 当前用户id
        order.setId(UUID.randomUUID().toString());

        /*User user = (User) request.getSession().getAttribute("user");
        if(user==null){
            response.sendRedirect(request.getContextPath()+"/error/error.jsp");
            return;
        }*/
        order.setUser_id(user.getId());

        // 1.3 将订单项封装到订单中.
        Map<Product, Integer> cart = (Map<Product, Integer>) request
                .getSession().getAttribute("cart"); // 得到购物车
        List<OrderItem> items = new ArrayList<OrderItem>();
        for (Product p : cart.keySet()) {

            OrderItem item = new OrderItem();

            item.setOrder_id(order.getId());
            item.setProduct_id(p.getId());
            item.setBuynum(cart.get(p));

            items.add(item);
        }

        order.setOrderItems(items);

        // 2.调用OrderService中方法，创建订单
        OrderService service = OrderServiceFactory.getInstance();

        try {
            service.add(user, order);
            response.getWriter().write(
                    "下单成功,<a href='" + request.getContextPath()
                            + "/index.jsp'>继续购物</a>，<a href='"
                            + request.getContextPath()
                            + "/order?method=search'>查看订单</a>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void del(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String id = request.getParameter("id"); // 得到要删除的订单的id。

        // 调用OrderService中删除订单操作
        OrderService service = OrderServiceFactory.getInstance();

        try {
            service.delete(id);

            // 在次查询订单
            response.sendRedirect(request.getContextPath()
                    + "/order?method=search");
            return;
        } catch (OrderException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void search(HttpServletRequest request,HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.getWriter().write(
                    "请先<a href='" + request.getContextPath()
                            + "/index.jsp'>登录</a>");
            return;
        }

        // 2.调用OrderService中查询订单操作
        OrderService service = OrderServiceFactory.getInstance();

        try {
            List<Order> orders = service.find(user);

            request.setAttribute("orders", orders);

            request.getRequestDispatcher("/showOrder.jsp").forward(request,
                    response);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
