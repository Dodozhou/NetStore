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
    public void regist(User user,String pro_path) throws RegistException {
        //调用dao中添加用户的方法
        try {
            new UserDao().addUser(user);
            String emailMsg="注册成功，请在12小时内<a href='"+pro_path+"BookStore/user?method=activeuser&activecode="
                    +user.getActivecode()+"'>激活</a>,激活码是"+user.getActivecode();

System.out.println(emailMsg);
            //调用方法发送邮件
            MailUtils.sendMail(user.getEmail(),emailMsg);
        } catch (SQLException e) {
            throw new RegistException("regist fail!");
        }catch (Exception e){
            throw new RegistException("Fail to send email!");
        }
    }

    public User login(String username, String password) throws Exception {
        //调用Dao层查询方法
        UserDao dao=new UserDao();
        User user;
        try {
        user= dao.findUserByUserNameAndPassword(username,password);
        if (user == null){
            throw new LoginException("username or password may be not correct!");
        }
        //判断用户状态
        if (user.getState() == 0){
            //用户未激活，不能进行登录操作
            throw new LoginException("the count havn't been actived!");
        }}catch (SQLException e){
            throw new LoginException("login fail!");
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
            throw new RegistException("Fail to find user by activecode!");
        }

        long time = System.currentTimeMillis()-user.getUpdatetime().getTime();
        //判断它是否超时 开发是12小时 测试1分钟
        if (time > 12*60*60*1000 ){
            throw new ActiveUserException("active code was out of time!");
        }

        try {
            dao.activeUserByActiveCode(activecode);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ActiveUserException("active failed!");
        }
    }

    @Override
    public User findById(int id) {
        UserDao dao=new UserDao();
        return dao.findUserById(id);
    }
}
