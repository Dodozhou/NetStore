package com.star.estore.service;

import com.star.estore.domain.Favorite;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

/**
 * Created by hp on 2016/12/28.
 */
public interface FavoriteService {
     Boolean addFav(Favorite favorite);

    List<Favorite> findByUid(int id) throws SQLException;

    Boolean exist(Favorite favorite) throws SQLException;
}
