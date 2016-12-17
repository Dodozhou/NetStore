package com.star.estore.web.servlet;


import com.star.estore.domain.Purchase;
import com.star.estore.domain.User;
import com.star.estore.service.PurchaseService;
import com.star.estore.service.PurchaseServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class PurchaseServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("add".equals(method)){
			try {
				addColl(request,response);
			} catch (Exception e) {
System.out.println("封装求购信息失败，在PurchaseServlet里。");
				e.printStackTrace();
			}
		}else if ("findBykey".equals(method)) {
			// 根据id查找求购信息

		} else if ("findAll".equals(method) || method == null) {
			// 查找全部求购信息

		}
	}

	private void addColl(HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user=(User)request.getSession().getAttribute("user");
		if (user==null){
			response.getWriter().write("请先登录！");
			return;
		}
		Map map= request.getParameterMap();
		Purchase purchase=new Purchase();
		try {
			BeanUtils.populate(purchase,map);
		} catch (IllegalAccessException | InvocationTargetException e) {
			System.out.println("求购信息封装失败");
			e.printStackTrace();
		}
		PurchaseService service= new PurchaseServiceImpl();
		service.add(user,purchase);
		response.getWriter().write("恭喜你，发布求购信息成功！请静候佳音！");
	}





	/*// 根据id查找商品
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
	}*/

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
