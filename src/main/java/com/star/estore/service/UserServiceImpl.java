package com.star.estore.service;

import com.star.estore.dao.UserDao;
import com.star.estore.domain.User;
import com.star.estore.exception.ActiveUserException;
import com.star.estore.exception.RegistException;
import com.star.estore.utils.MailUtils;

import javax.security.auth.login.LoginException;
import java.sql.SQLException;

/**
 * Created by hp on 2016/11/21.
 */
public class UserServiceImpl implements UserService {
    //注册功能
    public void regist(User user) throws RegistException {
        //调用dao中添加用户的方法
        try {
            new UserDao().addUser(user);

           /* String emailMsg="Regist success!Please click the <a href='http://localhost:8888/user?method=activeuser&activecode="
                    +user.getActivecode()+"'>active</a> to active your account,the active code is :"+user.getActivecode();*/
            //本地的测试消息
            String emailMsg="注册成功，请在12小时内<a href='http://localhost:8888/user?method=activeuser&activecode="
                    +user.getActivecode()+"'>激活</a>,激活码是"+user.getActivecode();
            //云服务器的测试消息
           /* String emailMsg="注册成功，请在12小时内<a href='http://www.deardull.com/BookStore/user?method=activeuser&activecode="
                    +user.getActivecode()+"'>激活</a>,激活码是"+user.getActivecode();*/
            //调用方法发送邮件
            MailUtils.sendMail(user.getEmail(),emailMsg);
        } catch (SQLException e) {
            throw new RegistException("注册失败");
        }catch (Exception e){
            throw new RegistException("邮件发送失败");
        }
    }

    public User login(String username, String password) throws Exception {
        //调用Dao层查询方法
        UserDao dao=new UserDao();
        User user;
        try {
        user= dao.findUserByUserNameAndPassword(username,password);
        if (user == null){
            throw new LoginException("用户名或密码不正确");
        }
        //判断用户状态
        if (user.getState() == 0){
            //用户未激活，不能进行登录操作
            throw new LoginException("用户未激活");
        }}catch (SQLException e){
            throw new LoginException("登录失败");
        }

        return user;
    }

    public void activeUser(String activecode) throws RegistException,ActiveUserException {
            //调用一个dao中的方法，根据activecode查找用户
        UserDao dao = new UserDao();
        User user=null;
        try {
            user = dao.findUserByActiveCode(activecode);
        } catch (SQLException e) {
            throw new RegistException("根据激活码查找用户失败");
        }

        long time = System.currentTimeMillis()-user.getUpdatetime().getTime();
        //判断它是否超时 开发是12小时 测试1分钟
        if (time > 12*60*60*1000 ){
            throw new ActiveUserException("激活码过期");
        }

        try {
            dao.activeUserByActiveCode(activecode);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ActiveUserException("激活失败");
        }
    }
}
