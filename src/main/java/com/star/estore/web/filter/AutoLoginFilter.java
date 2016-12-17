package com.star.estore.web.filter;

import com.star.estore.domain.User;
import com.star.estore.exception.LoginException;
import com.star.estore.service.UserServiceImpl;
import com.star.estore.utils.CookieUtils;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;

public class AutoLoginFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
		// 1.强转
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		// 2.操作

		// 2.1判断当前用户是否登录
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) { // user为null说明用户没有登录，可以进行自动登录操作
			// 2.2 得到访问的资源路径
			String uri = req.getRequestURI();
			String contextPath = req.getContextPath();
			String path = uri.substring(contextPath.length());

			if (!("/page.jsp".equalsIgnoreCase(path)
					|| "/login".equalsIgnoreCase(path) || "/page"
						.equalsIgnoreCase(path))) {
				// 符合条件的是可以进行自动登录操作的.

				// 2.3 得到cookie，从cookie中获取username,password
				Cookie cookie = CookieUtils.findCookieByName(req.getCookies(),
						"autologin");

				if (cookie != null) {
					// 说明有用户名与密码，可以进行自动登录
					String username = URLDecoder.decode(cookie.getValue()
							.split("%itcast%")[0], "utf-8");
					String password = cookie.getValue().split("%itcast%")[1];

					// 2.4调用UserService方法进行登录操作.
					UserServiceImpl service = new UserServiceImpl();
					try {
						User existUser = service.login(username, password);

						if (existUser != null) {
							// 可以进行登录操作
							req.getSession().setAttribute("user", existUser);
						}

					} catch (LoginException e) {
						e.printStackTrace();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			}

		}
		// 3.放行
		chain.doFilter(req, resp);
	}

	public void destroy() {

	}

}
