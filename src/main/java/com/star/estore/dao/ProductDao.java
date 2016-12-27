package com.star.estore.dao;

import com.star.estore.domain.Order;
import com.star.estore.domain.OrderItem;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.utils.DataSourceUtils;
import com.sun.mail.util.QEncoderStream;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.taglibs.standard.tag.common.sql.DataSourceUtil;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public class ProductDao {
    public void addProduct(Product p) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into products values(?,?,?,?,?,?,?,?,?,?,?,null)";
        runner.update(sql,p.getId(),p.getName(),p.getPrice(),p.getCategory(),
                p.getImgurl(),p.getDescription(),p.getDealps(),
                p.isDiscount(),p.getQQ(),p.getPhone(), p.getOwner());
    }

    public List<Product> findAll() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from products";
        return runner.query(sql,new BeanListHandler<Product>(Product.class));
    }

    public Product findById(String id) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from products where id =?";
        return runner.query(sql,new BeanHandler<Product>(Product.class),id);
    }

   public List<Product> findSell() throws SQLException {
       String sql = "select products.name,sum(buynum) as totalsalenum from orders,orderitem,products where orders.id=orderitem.order_id and products.id=orderitem.product_id and orders.paystate=1 group by products.id order by totalsalenum desc";
       QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
       return runner.query(sql,new BeanListHandler<Product>(Product.class));
   }




    public List<Product> findByKey(String key) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        //构造模糊查询字符串，即每个关键字前后加上%
        String key2="";
        key=key.trim();
        key=key.replaceAll("\\s+",",");
        String[] keys=key.split(",");
        for (String key1 : keys) {
            key2 = key2 + "%" + key1;
        }
        key2=key2.concat("%");

        String sql="select * from products where concat(description,name,category,price) like ?";
        return runner.query(sql,new BeanListHandler<Product>(Product.class),key2);
    }

    public List<Product> findByUser(int id) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from products where owner=?";
        return runner.query(sql,new BeanListHandler<Product>(Product.class),id);
    }
}
