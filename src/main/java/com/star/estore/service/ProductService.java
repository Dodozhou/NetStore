package com.star.estore.service;

import com.star.estore.annotation.PrivilegeInfo;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;

import java.sql.PreparedStatement;
import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public interface ProductService {
    //添加商品
    @PrivilegeInfo("添加商品")
    public void add(User user, Product product) throws PrivilegeException,Exception;

    //查找商品
    public List<Product> findAll() throws Exception;

    //根据ID查找商品
    public Product findById(String id) throws Exception;

    //查询销售榜单
    @PrivilegeInfo("下载榜单")
    public List<Product> findSell(User user) throws PrivilegeException,Exception;
}
