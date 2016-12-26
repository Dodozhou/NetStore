package com.star.estore.service;

import com.star.estore.annotation.PrivilegeInfo;
import com.star.estore.domain.Product;
import com.star.estore.domain.Purchase;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public interface PurchaseService {
    //添加求购
    void add(User user, Purchase purchase) throws Exception;
    //查找前12条求购信息，在主页上循环播放
    List<Purchase> find12() throws SQLException;

    List<Purchase> findAll() throws SQLException;
}
