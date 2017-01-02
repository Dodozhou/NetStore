package com.star.estore.service;

import com.star.estore.dao.FavoriteDao;
import com.star.estore.domain.Favorite;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/28.
 */
public class FavoriteServiceImpl implements FavoriteService {
    @Override
    public Boolean addFav(Favorite favorite) {
            FavoriteDao dao=new FavoriteDao();
        try {
            return dao.addFav(favorite);
        } catch (SQLException e) {
System.out.println("sql插入收藏失败！");
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Favorite> findByUid(int id) throws SQLException {
        FavoriteDao dao=new FavoriteDao();
        return dao.findByUid(id);
    }

    @Override
    public Boolean exist(Favorite favorite) throws SQLException {
        FavoriteDao dao=new FavoriteDao();
        List<Favorite> favorites=dao.exist(favorite);
        if (favorites.size()>0){
            return true;
        }else return false;
    }
}
