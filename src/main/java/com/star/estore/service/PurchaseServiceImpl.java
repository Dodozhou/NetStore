package com.star.estore.service;

import com.star.estore.dao.ProductDao;
import com.star.estore.dao.PurchaseDao;
import com.star.estore.domain.Product;
import com.star.estore.domain.Purchase;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public class PurchaseServiceImpl implements PurchaseService{

    @Override
    public void add(User user, Purchase purchase) throws Exception {
        PurchaseDao dao = new PurchaseDao();
        purchase.setOwner(user.getId());
        dao.add(purchase);
    }

    @Override
    public List<Purchase> find12() throws SQLException {
        PurchaseDao dao=new PurchaseDao();
        return dao.find12();
    }

    @Override
    public List<Purchase> findAll() throws SQLException {
        PurchaseDao dao=new PurchaseDao();
        return dao.findAll();
    }
}
