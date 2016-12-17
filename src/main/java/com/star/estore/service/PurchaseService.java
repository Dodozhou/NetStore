package com.star.estore.service;

import com.star.estore.annotation.PrivilegeInfo;
import com.star.estore.domain.Product;
import com.star.estore.domain.Purchase;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;

import java.util.List;

/**
 * Created by hp on 2016/12/4.
 */
public interface PurchaseService {
    //添加求购
    public void add(User user, Purchase purchase) throws Exception;

    //查找求购信息
    public List<Product> findAll() throws Exception;

    //根据关键字查找求购信息
    public Product findByInfo(String keyword) throws Exception;

    }
