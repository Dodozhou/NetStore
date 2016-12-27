package com.star.estore.web.servlet;

import com.google.gson.Gson;
import com.star.estore.dao.UserDao;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.factory.ProductServiceFactory;
import com.star.estore.service.ProductService;
import com.star.estore.service.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");

		if ("findById".equals(method)) {
			// 根据id查找商品
			findById(request, response);
		} else if ("findAll".equals(method) || method == null) {
			// 查找全部商品
			findAll(request, response);
		}else if ("findByKey".equals(method)){
				findByKey(request,response);
		}else if ("findByOwner".equals(method)){
			findByOwner(request,response);
		}
	}

	private void findByOwner(HttpServletRequest request, HttpServletResponse response) {
		User user=(User)request.getSession().getAttribute("user");
		int id=user.getId();
		ProductService service=new ProductServiceImpl();
		List<Product> pr=new LinkedList<>();
		try {
			//将查询结果装填进pr链表中
			pr=service.findByUser(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Gson gson=new Gson();
		try {
			response.getWriter().write(gson.toJson(pr));
		} catch (IOException e) {
			//输出流错误，或json转换出错
			e.printStackTrace();
		}
	}

	private void findByKey(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String key=request.getParameter("key");
		ProductService service=new ProductServiceImpl();
        List<Product> pr= new LinkedList<>();
        try {
            pr = service.findByKey(key);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (pr.size()==0){
			response.getWriter().write("您要搜索的商品不存在");
		}else{
			request.setAttribute("pr",pr);
			request.getRequestDispatcher("/search.jsp").forward(request,response);
		}

	}

	// 根据id查找商品
	public void findById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.得到要查询的商品的id
		String id = request.getParameter("id");

		// 2.调用service中查询方法
		try {
			ProductService service = ProductServiceFactory.getInstance();
			Product p = service.findById(id);
			int owner_id=p.getOwner();
			UserDao dao=new UserDao();
			User owner=dao.findUserById(owner_id);
			if (owner==null){
				response.getWriter().write("非常抱歉，根据id查找该商品的拥有者失败！");
				return;
			}
			request.setAttribute("p", p);
			request.setAttribute("owner",owner);

			request.getRequestDispatcher("/goods_details.jsp").forward(request,
					response);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 查找所有商品
	public void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 1.查询所有商品
			ProductService service = ProductServiceFactory.getInstance();
			List<Product> ps = service.findAll();

			// 2.装填查询获得的信息
//			request.setAttribute("ps", ps);
			Gson gson=new Gson();
			response.getWriter().write(gson.toJson(ps));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

//		request.getRequestDispatcher("/page.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
