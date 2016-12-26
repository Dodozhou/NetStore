package com.star.estore.service;

import com.star.estore.dao.ProductDao;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public class ProductServiceImpl implements ProductService{
    //添加商品
    @Override
    public void add(User user, Product product) throws PrivilegeException, Exception {
        ProductDao dao = new ProductDao();
        product.setOwner(user.getId());
        dao.addProduct(product);
    }
//查找所有商品
    @Override
    public List<Product> findAll() throws Exception {
        ProductDao dao = new ProductDao();
        return dao.findAll();
    }

    @Override
    public Product findById(String id) throws Exception {
        ProductDao dao = new ProductDao();
        return dao.findById(id);
    }
    //得到销售榜单信息
    @Override
    public List<Product> findSell(User user) throws PrivilegeException, Exception {
        ProductDao dao = new ProductDao();
        return dao.findSell();
    }

    @Override
    public List<Product> findByKey(String key) throws SQLException {
        ProductDao dao=new ProductDao();
        return dao.findByKey(key);
    }
}
