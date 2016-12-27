package com.star.estore.dao;

import com.star.estore.domain.User;
import com.star.estore.exception.RegistException;
import com.star.estore.utils.DataSourceUtils;
import com.star.estore.utils.Md5Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import sun.text.normalizer.NormalizerBase;

import javax.xml.crypto.Data;
import java.sql.SQLException;
import java.util.Map;

/**
 * User对象的持久化类
 * Created by hp on 2016/11/21.
 */
public class UserDao {
    //添加用户操作
    public void addUser(User user) throws SQLException{
        //1.创建QueryRunner,QueryRunner是org.apache.commons.dbutils.QueryRunner
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        //2.执行sql语句
        //默认用户role=user state=0 代表未激活
        String sql="insert into users values(null,?,?,?,?,'admin',0,?,null,?,?);";

        try {
            runner.update(sql,user.getUsername(), Md5Utils.md5(user.getPassword()),
                    user.getNickname(),user.getEmail(),user.getActivecode(),user.getPhone(),user.getQQ());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    //查找用户操作
    public User findUserByUserNameAndPassword(String username,String password) throws SQLException {
        QueryRunner runner= new QueryRunner(DataSourceUtils.getDataSource());

        String sql="select * from users where username=? and password=?";
        /**
         * 存储密码时用了加密算法，这里查询时同样应该用加密算法。
         * 由此可知，同一个字符串，不同时间经过相同的算法得出的新串是相等的
         */
        return runner.query(sql,new BeanHandler<User>(User.class),username,Md5Utils.md5(password));
    }

    public User findUserByUserName(String username) throws SQLException {
        QueryRunner runner= new QueryRunner(DataSourceUtils.getDataSource());

        String sql="select * from users where username=?";
        /**
         * 存储密码时用了加密算法，这里查询时同样应该用加密算法。
         * 由此可知，同一个字符串，不同时间经过相同的算法得出的新串是相等的
         */
        return runner.query(sql,new BeanHandler<User>(User.class),username);
    }
    //激活用户
    public void activeUserByActiveCode(String activecode) throws SQLException {
        //创建QuerryRunner
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        //执行sql语句
        String sql="update users set state=1 where activecode=?";
        runner.update(sql,activecode);
    }

    //通过激活码查询用户，返回User
    public User findUserByActiveCode(String activecode) throws SQLException {
        //创建QuerryRunner,并将DataSource传入
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        //待执行的sql语句
        String sql = "select * from users where activecode=?";
        return runner.query(sql,new BeanHandler<User>(User.class),activecode);
    }

    public User findUserById(int id) {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from users where id=?";
        User user=null;
        try {
            user=runner.query(sql,new BeanHandler<User>(User.class),id);
        } catch (SQLException e) {
System.out.println("根据id查找用户失败，可能是id不存在");
            e.printStackTrace();
        }
        return user;
    }

    public Boolean update_info(Map<String, String> map) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update users set nickname=?,phone=?,QQ=? where id=?";
        //返回受影响的行数
        int i=runner.update(sql,map.get("nickname"),map.get("phone"),map.get("QQ"),
                map.get("id"));
        return i > 0;
    }

    public void update_header(String header,int id) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="update users set header=? where id=?";
        runner.update(sql,header,id);

    }
}
