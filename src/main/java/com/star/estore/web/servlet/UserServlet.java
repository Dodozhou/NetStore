package com.star.estore.web.servlet;

import com.mchange.v2.beans.BeansUtils;
import com.star.estore.domain.User;
import com.star.estore.exception.ActiveUserException;
import com.star.estore.exception.RegistException;
import com.star.estore.service.UserService;
import com.star.estore.service.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

/**
 * Created by hp on 2016/11/21.
 */
public class UserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //得到请求参数method，判断当前是什么操作
        //String method1=request.getMethod(); 这是错误的写法，得到的结果是POST
        String method=request.getParameter("method");
//        System.out.println(method);
//        System.out.println(method.equals("regist"));  调试输出语句
        if ("login".equals(method)){    //登录操作
            login(request,response);
        }else if ("regist".equals(method)){     //注册操作
            regist(request,response);
        }else if ("logout".equals(method)){     //注销操作
            logout(request,response);
        }else if ("activeuser".equals(method)){ //激活操作
            activecode(request,response);
        }
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        doGet(request,response);
    }

    private void activecode(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        //得到提交过来的激活码
        String activecode = request.getParameter("activecode");
        //调用UserService中的方法完成激活操作
        UserService service= new UserServiceImpl();
        try {
            //将连接提交的验证码传递给service中的具体业务方法activeUser()
            service.activeUser(activecode);
        } catch (RegistException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage()+"," +
                    "重新<a href="+request.getContextPath()+"/page.jsp>注册</a>");
            return;
        }catch (ActiveUserException e){
            e.printStackTrace();
            response.getWriter().write(e.getMessage()+",重新<a href='" + request.getContextPath()
                    + "//page.jsp'>注册</a>");
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.getWriter().write("用户激活成功,请回<a href='" + request.getContextPath()
                + "/page.jsp'>首页</a>");
        return;
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //清空session，同时释放资源
        request.getSession().invalidate();
        //将自动登录的Cookie设置为空
        Cookie cookie=new Cookie("autologin","");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        response.sendRedirect(request.getContextPath()+"/page.jsp");
    }

    //登录操作
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.得到用户名和密码
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        //按用户名查找该用户，核对密码是否正确，正确则登录，不正确，则失败
        UserService service = new UserServiceImpl();
        try {
            //调用servece层的login方法执行查询逻辑
            User user=service.login(username,password);
            if (user!=null){
                //用户如果登录成功，判断是否勾选了记住用户名
                String saveUsername=request.getParameter("remember");
                if ("on".equals(saveUsername)){
                    //在浏览器端添加Cookie，记住用户名 设置为UTF-8编码
                    Cookie cookie=new Cookie("saveusername", URLEncoder.encode(username,"utf-8"));
                    cookie.setMaxAge(7*24*60*60);//可以记住7天，单位为秒
                    cookie.setPath("/");//
                    response.addCookie(cookie);//添加到客户端浏览器
                }

                //自动登录
                String autologin=request.getParameter("autologin");
                //勾选了自动登录
                if ("on".equals(autologin)){
                    //勾选了自动登录就把用户名与密码存储到Cookie中
                    Cookie cookie=new Cookie("autologin",URLEncoder.encode(username,"utf-8")+"%itcast%"+password);
                    cookie.setMaxAge(7*24*60*60);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }else{
                    Cookie cookie=new Cookie("autologin",URLEncoder.encode(username,"utf-8")+"%itcast%"+password);
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
                //登录成功过后，将用户存储到sesison中去
                request.getSession().invalidate();
                request.getSession().setAttribute("user",user);
                request.getRequestDispatcher("/page.jsp").forward(request,response);
            }else {
                request.setAttribute("login.message","用户名或密码错误");
                request.getRequestDispatcher("/page.jsp").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("login.message",e.getMessage());
            request.getRequestDispatcher("/page.jsp").forward(request,response);
        }

    }


    private void regist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        //接受客户端提交的checkcode
        String checkcode=request.getParameter("checkcode");
        //获得后台生成的checkcode_session
        String _checkcode=(String)request.getSession().getAttribute("checkcode_session");
        //移除session中的checkcode_session属性
        request.getSession().removeAttribute("checkcode_session");
        //判断客户端提交的验证码和后台生成的验证码是否一致，不是，则提示注册失败，重定向回注册页面
        if (_checkcode == null || (!_checkcode.equals(checkcode))){
            request.setAttribute("regist.message","验证码不正确");
            request.getRequestDispatcher("/page.jsp").forward(request,response);
            return;
        }
        User user=new User();
        try {
            //得到请求参数，并封装到Bean中
            BeanUtils.populate(user,request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        //进行服务器端的数据校验
        Map<String,String> map = user.validateRegist();
        if (map.size()>0){
            //说明有错误信息
            request.setAttribute("map",map);
            request.getRequestDispatcher("/page.jsp").forward(request,response);
            return;
        }
        //手动封装一个激活码
        user.setActivecode(UUID.randomUUID().toString());
        //调用service
        UserServiceImpl service=new UserServiceImpl();
        try {
            //service对象调用regist方法，进行用户注册
            service.regist(user);
            response.getWriter().write("恭喜您注册成功，请前往您的邮箱激活账户！");
        } catch (RegistException e) {
            request.setAttribute("regist.message",e.getMessage());
            request.getRequestDispatcher("/page.jsp").forward(request,response);
            e.printStackTrace();
        }

    }


}
