package com.star.estore.web.servlet;

import com.mchange.v2.beans.BeansUtils;
import com.star.estore.dao.UserDao;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.exception.ActiveUserException;
import com.star.estore.exception.RegistException;
import com.star.estore.service.ProductService;
import com.star.estore.service.ProductServiceImpl;
import com.star.estore.service.UserService;
import com.star.estore.service.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by hp on 2016/11/21.
 */
public class UserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //得到请求参数method，判断当前是什么操作
        //String method1=request.getMethod(); 这是错误的写法，得到的结果是POST
        request.setCharacterEncoding("utf-8");
        String method=request.getParameter("method");

        if ("login".equals(method)){    //登录操作
            login(request,response);
        }else if ("regist".equals(method)){     //注册操作
            regist(request,response);
        }else if ("logout".equals(method)){     //注销操作
            logout(request,response);
        }else if ("activeuser".equals(method)){ //激活操作
            activecode(request,response);
        }else if ("findById".equals(method)){ //通过id查找卖家信息
            findById(request,response);
        }else if ("header".equals(method)){ //通过id查找卖家信息
            addHeader(request,response);
        } else if ("update".equals(method)){ //更新卖家信息
            try {
                update_info(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    //添加头像处理函数
    private void addHeader(HttpServletRequest request, HttpServletResponse response) {
        User u=(User)request.getSession().getAttribute("user");
        //当文件较大时，不能放在内存中，应该放在一个临时文件夹里面
        String tepdir=getServletContext().getRealPath("/temp");
        //DiskFileItemFactory：将请求消息实体中的每一个项目封装成单独的DiskFIleItem对象
        //第一个参数：上传文件的缓存最大值，当大于这个值的时候就存入临时目录
        //第二个参数：设置缓存文件的目录
        DiskFileItemFactory factory =new DiskFileItemFactory(1024*1024,new File(tepdir));
        //文件上传处理类
        ServletFileUpload upload=new ServletFileUpload(factory);
        try {
            //parseRequest方法解析Request中的文件，并返回FileItem列表
            List<FileItem> list=upload.parseRequest(request);
            //创建一个迭代器，用来迭代多个FileItem对象
            ListIterator<FileItem> iterator=list.listIterator();
            //临时容纳单个fileItem
            FileItem item;
            String fileName;
            int index;
            while (iterator.hasNext()){
                //获得下一个item文件对象
                item=iterator.next();
                //获取文件名
                fileName=item.getName();
                System.out.println(fileName);
                //分离文件名后缀，如.jpg
                index=fileName.indexOf(".");
                //substring 方法会返回下标为index之后的字符串
                fileName=fileName.substring(index);

                System.out.println(fileName);
                //使用UUID类重新生成一个随机的文件名（防止文件名重复），记住要加上文件后缀
                fileName=UUID.randomUUID().toString()+fileName;
                System.out.println(fileName);
                //多级文件存储目录，以日期划分，这样可以分流
                SimpleDateFormat df=new SimpleDateFormat("/yyyy/MM/dd/HH");
                String dir=df.format(new Date());

                //getServletContext().getRealPath方法会自动获取并在
                // 最前面加上当前项目的根路径
                String path=getServletContext().getRealPath("header/"+dir);
                //新建文件目录
                File pathFile=new File(path);
                //如果文件夹不存在，则创建文件夹
                if (!pathFile.exists()){
                    //mkdirs方法或自动创建多级目录，而mkdir则只会创建一层
                    pathFile.mkdirs();
                }

                String header="/header"+dir+"/"+fileName;
System.out.println(header);
                //保存头像路径到数据库
                UserDao dao=new UserDao();
                dao.update_header(header,u.getId());
                /*
                 * 将文件写入磁盘
                 * @param pathFile 文件存储的路径
                 * @param fileName 存储的文件名
                 */
                item.write(new File(pathFile,fileName));


                response.getWriter().write("恭喜你，头像上传成功！");
            }
            //parseRequest抛出的异常
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void update_info(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //从session获取当前登录的用户
        User u= (User)request.getSession().getAttribute("user");
       //map:封装需要更新的信息，便于传递
        Map<String,String> map=new HashMap<>();
        map.put("nickname",request.getParameter("nickname"));
        map.put("phone",request.getParameter("phone"));
        map.put("QQ",request.getParameter("QQ"));
        map.put("id",String.valueOf(u.getId()));
        UserDao dao=new UserDao();
        if (dao.update_info(map)){
           response.sendRedirect("/per_home.jsp");
        }else {
            response.getWriter().write("更改用户信息失败！");
        }



    }

    private void findById(HttpServletRequest request, HttpServletResponse response) {
        //获取上一页面传递的参数：商品发布者id，并进行类型转换
        String id=request.getParameter("id");
        if(id==null){
System.out.println("您传入的id为空！");
            return;
        }
        UserService service=new UserServiceImpl();
        User user=service.findById(Integer.parseInt(id));
        ProductService service1=new ProductServiceImpl();
        List<Product> pro;
        try {
            //查找该卖家的其他商品
            pro=service1.findByUser(user.getId());
            //将卖家的用户信息和卖家的其他商品装填进req的属性中，传递到下一页面
            request.setAttribute("pro_own",user);
            request.setAttribute("pro",pro);
            //页面转向到卖家详情页面
            request.getRequestDispatcher("/seller.jsp").forward(request,response);
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
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
            String pro_path=request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+"/";
            //第二个参数，将当前项目的根路径传递进去
            service.regist(user,pro_path);
            response.getWriter().write("恭喜您注册成功，请前往您的邮箱激活账户！");
        } catch (RegistException e) {
            request.setAttribute("regist.message",e.getMessage());
            request.getRequestDispatcher("/page.jsp").forward(request,response);
            e.printStackTrace();
        }

    }


}
