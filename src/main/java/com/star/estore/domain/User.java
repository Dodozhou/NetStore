package com.star.estore.domain;

import com.star.estore.dao.UserDao;
import com.star.estore.exception.RegistException;

import javax.security.auth.login.LoginException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hp on 2016/11/21.
 */
public class User {
    private int id; // 用户编号
    private String username; // 用户名
    private String password; // 密码
    private String nickname; // 昵称
    private String email; // 邮箱
    private String role; // 角色
    private int state; // 是否激活
    private String activecode; // 激活码 UUID获取
    private Timestamp updatetime; // 更新时间
    private String QQ;
    private String phone;

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getActivecode() {
        return activecode;
    }

    public void setActivecode(String activecode) {
        this.activecode = activecode;
    }

    public Timestamp getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Timestamp updatetime) {
        this.updatetime = updatetime;
    }

    public Map<String, String> validateRegist(){
        Map<String ,String > map=new HashMap<String, String>();
        UserDao dao = new UserDao();
        User user;
        try {
            user= dao.findUserByUserName(username);
            if (user != null){
                map.put("namein.message","该用户名已存在，请更换用户名");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (username==null || username.trim().isEmpty()){
            map.put("username.message","用户名不能为空");
        }
        if (password==null || password.trim().isEmpty()){
            map.put("username.message","密码不能为空");
        }
        if (nickname==null || nickname.trim().isEmpty()){
            map.put("username.message","昵称不能为空");
        }
        if (email==null || email.trim().isEmpty()){
            map.put("username.message","邮箱不能为空");
        }
        return map;
    }
}
