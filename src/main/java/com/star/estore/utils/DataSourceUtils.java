package com.star.estore.utils;

/**
 * Created by hp on 2016/11/21.
 */

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 工具类，提供数据库连接池和数据库连接
 * 需要引入c3p0的jar包
 */
public class DataSourceUtils {

    //通过c3p0的ComboPooledDataSource类来实例化一个数据源
    private static DataSource dataSource = new ComboPooledDataSource();
    //创建一个私有静态的并且是与事务相关联的局部线程变量
    private static ThreadLocal<Connection> tl=new ThreadLocal<Connection>();

    public static DataSource getDataSource(){ return dataSource;}

    //当DBUtils需要手动控制事物时，调用该方法获得一个连接
    public static Connection getConnection() throws SQLException{
        //获得线程变量tl的值con
        Connection con=tl.get();
        //如果连接为空，则创建连接
        if (con==null){
            //通过配置的数据源来获得一个连接
            con=dataSource.getConnection();
            //将局部变量tl的值设为con
            tl.set(con);
        }
        return con;
    }

    /**
     * 用Static方法将开启、回滚、提交等操作封装为静态方法
     * 以确保操作的都是同一个连接。
     * @throws SQLException
     */
    //开启事物
    public static void startTransaction() throws SQLException{
        getConnection().setAutoCommit(false);//设置事务为手动事务，相当于开启事务
    }

    //事务回滚
    public static void rollback() throws SQLException{
        getConnection().rollback();
    }

    //事务提交
    public static void commitAndReleased() throws SQLException{
        getConnection().commit();   //事务提交
        getConnection().close();       //释放Connection，是将其放回连接池
        tl.remove();
    }




}
