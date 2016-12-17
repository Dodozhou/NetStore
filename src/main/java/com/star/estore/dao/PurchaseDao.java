package com.star.estore.dao;

import com.star.estore.domain.Purchase;
import com.star.estore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

/**
 * Created by hp on 2016/12/16.
 */
public class PurchaseDao {

    public void add(Purchase p) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into purchase values(null,?,?,?,?,?,?,?,?)";
        runner.update(sql,p.getName(),p.getDescription(),p.getDealps(),p.getPrice(),
                p.getCategory(),p.getOwner(),p.getQQ(),p.getPhone());
    }
}
