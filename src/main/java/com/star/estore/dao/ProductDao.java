package com.star.estore.dao;

import com.star.estore.domain.Order;
import com.star.estore.domain.OrderItem;
import com.star.estore.domain.Product;
import com.star.estore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public class ProductDao {
    public void addProduct(Product p) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into products values(?,?,?,?,?,?,?)";
        runner.update(sql,p.getId(),p.getName(),p.getPrice(),p.getCategory(),
                p.getPnum(),p.getImgurl(),p.getDescription());
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

    // 当删除订单时，修改商品数量
    public void updateProductCount(List<OrderItem> items) throws SQLException {

        Object[][] params = new Object[items.size()][2];

        for (int i = 0; i < items.size(); i++) {

            OrderItem item = items.get(i);
            params[i][0] = item.getBuynum();
            params[i][1] = item.getProduct_id();

        }

        String sql = "update products set pnum=pnum+? where id=?";

        QueryRunner runner = new QueryRunner();

        runner.batch(DataSourceUtils.getConnection(), sql, params);
    }

    // 修改商品的数量
    public void updateProductCount(Order order) throws SQLException {

        // 要修改的数量在哪?
        List<OrderItem> items = order.getOrderItems();

        Object[][] params = new Object[items.size()][2];

        for (int i = 0; i < items.size(); i++) {

            OrderItem item = items.get(i);
            params[i][0] = item.getBuynum();
            params[i][1] = item.getProduct_id();

        }

        String sql = "update products set pnum=pnum-? where id=?";

        QueryRunner runner = new QueryRunner();

        runner.batch(DataSourceUtils.getConnection(), sql, params);

        // for(OrderItem item:items){
        //
        // runner.update(sql,item.getBuynum(),item.getProduct_id());
        //
        // }
    }

}
