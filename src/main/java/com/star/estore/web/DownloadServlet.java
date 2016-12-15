package com.star.estore.web;

import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;
import com.star.estore.factory.ProductServiceFactory;
import com.star.estore.service.ProductService;
import com.star.estore.utils.DownloadUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import static java.lang.String.format;

public class DownloadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1.得到下载文件名称
		String filename = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new Date()) + "销售榜单.csv";
		// 2.设置下载文件的mimeType类型
		response.setContentType(this.getServletContext().getMimeType(filename));

		// 3.设置Content-Dispostion
		String agent = request.getHeader("User-agent");
		response.setHeader("Content-disposition", "attachement;filename="
				+ DownloadUtils.getDownloadFileName(filename, agent));

		// 4.得到销售榜单信息

		List<Product> ps = null;
		ProductService service = ProductServiceFactory.getInstance();
		try {
			User user = (User) request.getSession().getAttribute("user");
			ps = service.findSell(user);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (PrivilegeException e) {
			response.sendRedirect(request.getContextPath() + "/error/error.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setCharacterEncoding("gbk");
		response.getWriter().println("商品名称,销售数量");

		for (Product p : ps) {
			response.getWriter().println(
					p.getName() + "," + p.getTotalSaleNum());
			response.getWriter().flush();
		}

		response.getWriter().close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
