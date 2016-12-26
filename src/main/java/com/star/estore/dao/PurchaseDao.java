package com.star.estore.dao;

import com.star.estore.domain.Purchase;
import com.star.estore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/16.
 */
public class PurchaseDao {

    public void add(Purchase p) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into purchase values(null,?,?,?,?,?,?,?,?,null)";
        runner.update(sql,p.getName(),p.getDescription(),p.getDealps(),p.getPrice(),
                p.getCategory(),p.getOwner(),p.getQQ(),p.getPhone());
    }

    public List<Purchase> find12() throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from purchase limit 12";
        return runner.query(sql,new BeanListHandler<Purchase>(Purchase.class));
    }

    public List<Purchase> findAll() throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from purchase";
        return runner.query(sql,new BeanListHandler<Purchase>(Purchase.class));
    }
}
