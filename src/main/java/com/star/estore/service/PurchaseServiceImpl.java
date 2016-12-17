package com.star.estore.service;

import com.star.estore.dao.ProductDao;
import com.star.estore.dao.PurchaseDao;
import com.star.estore.domain.Product;
import com.star.estore.domain.Purchase;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;

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
    public List<Product> findAll() throws Exception {
        return null;
    }

    @Override
    public Product findByInfo(String keyword) throws Exception {
        return null;
    }
}
