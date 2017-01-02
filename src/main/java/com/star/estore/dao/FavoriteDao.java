package com.star.estore.dao;

import com.star.estore.domain.Favorite;
import com.star.estore.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/28.
 */
public class FavoriteDao {

    public Boolean addFav(Favorite favorite) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into collection values(null,?,?)";
        return runner.update(sql,favorite.getUid(),favorite.getPid())>0;
    }

    public List<Favorite> findByUid(int id) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from collection where uid=?";
        return runner.query(sql,new BeanListHandler<Favorite>(Favorite.class),id);
    }

    public List<Favorite> exist(Favorite favorite) throws SQLException {
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from collection where uid=? and pid=?";
        return runner.query(sql,new BeanListHandler<Favorite>(Favorite.class),favorite.getUid(),favorite.getPid());
    }
}
