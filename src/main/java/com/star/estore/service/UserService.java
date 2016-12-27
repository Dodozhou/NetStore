package com.star.estore.service;

import com.star.estore.domain.User;
import com.star.estore.exception.RegistException;

/**
 * Created by hp on 2016/11/21.
 */
public interface UserService {
    //注册功能
    public void regist(User user,String pro_path) throws RegistException;
    //登录操作
    public User login(String username,String password) throws Exception;
    //激活操作
    public void activeUser(String activecode) throws Exception;

    User findById(int id);
}
