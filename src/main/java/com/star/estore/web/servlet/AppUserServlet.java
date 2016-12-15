package com.star.estore.web.servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.star.estore.dao.UserDao;
import com.star.estore.domain.User;
import com.star.estore.exception.ActiveUserException;
import com.star.estore.exception.RegistException;
import com.star.estore.service.UserService;
import com.star.estore.service.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by hp on 2016/11/21.
 */
public class AppUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/json;charset=utf-8");
        //获取输入流中的字符串
        String str = IOUtils.toString(request.getInputStream());
        //定义gson对象，便于下面使用其fromJson等方法
        Gson gson=new Gson();
        //解析json字符串
        HashMap<String, String> map = gson.fromJson(str,
                new TypeToken<HashMap<String, String>>() {
                }.getType());
        //接收、解析并分装json字符串
        String method=map.get("method");
        if ("login".equals(method)){    //登录操作
            login(request,response,map);
        }else if ("regist".equals(method)){     //注册操作
            regist(request,response,map);
        }else if("logout".equals(method)){     //注销操作
            logout(request,response);
        }
    }

    private void regist(HttpServletRequest request, HttpServletResponse response,Map<String,String> map) throws IOException {
        //存储反馈信息的map
        Map<String,String> map1=new HashMap<>();
       /* //接受客户端提交的checkcode
        String checkcode=map.get("checkcode");
        //获得后台生成的checkcode_session
        String _checkcode=(String)request.getSession().getAttribute("checkcode_session");
        //移除session中的checkcode_session属性
        request.getSession().removeAttribute("checkcode_session");
        //判断客户端提交的验证码和后台生成的验证码是否一致，不是，则提示注册失败，重定向回注册页面
        if (_checkcode == null || (!_checkcode.equals(checkcode))){
            map1.put("msg", "验证码不正确");
            map1.put("state", "-1");
            sendDetail(map1, response);
            return;
        }*/

        User user=new User();
        try {
            BeanUtils.populate(user,map);
            user.setActivecode(UUID.randomUUID().toString());
            UserService service = new UserServiceImpl();
            service.regist(user);
        } catch (IllegalAccessException | InvocationTargetException e) {
            map1.put("msg1","load user info failed!");
            e.printStackTrace();
        } catch (RegistException e) {
            map1.put("msg","注册失败！");
            map1.put("state", "0");
            e.printStackTrace();
        }
        if (map1.size()>0)
            sendDetail(map1, response);
        else {
            map1.put("state","2");
            map1.put("msg","注册成功，请前往邮箱激活账户！");
            sendDetail(map1, response);
        }


    }

    private void login(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> map) {
        String username=map.get("username");
        String password=map.get("password");
        Map<String,String> map1=new HashMap<String, String>();

        UserService service= new UserServiceImpl();
        User user= null;
        try {
            user = service.login(username,password);
            if (user!=null){
                if (user.getState()==0){
                    map1.put("msg","login fail! account is not actived!");
                    map1.put("state","2");
                    sendDetail(map1,response);
                }else {
                    map1.put("nickname",user.getNickname());
                    map1.put("email",user.getEmail());
                    map1.put("username",user.getUsername());
                    map1.put("state", "1");
                    sendDetail(map1, response);
                }
            }else {
                sendMsg(0,"Your username or password is wrong!",response);
            }
        } catch (Exception e) {
            map1.put("msg", e.getMessage());
            map1.put("state", "0");
            try {
                sendDetail(map1, response);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }


    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //清空session，同时释放资源
        request.getSession().invalidate();
        //将自动登录的Cookie设置为空
        Cookie cookie=new Cookie("autologin","");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        sendMsg(3,"logout success!",response);
    }



    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        doGet(request,response);
    }



    public void sendMsg(int state,String msg,HttpServletResponse response) throws IOException {
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("state",state);
        jsonObject.put("msg",msg);
        response.getWriter().write(jsonObject.toJSONString());
    }
    private void sendDetail(Map<String, String> map,HttpServletResponse response) throws IOException {
        Gson gson=new Gson();
        response.getWriter().write(gson.toJson(map));
    }


}
