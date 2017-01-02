package com.star.estore.web.servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mchange.v2.c3p0.stmt.GooGooStatementCache;
import com.star.estore.dao.ProductDao;
import com.star.estore.domain.Favorite;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.service.FavoriteService;
import com.star.estore.service.FavoriteServiceImpl;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by hp on 2016/12/28.
 */
public class FavoriteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method=request.getParameter("method");
        if ("add".equals(method)){
            try {
                addFav(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if ("findAll".equals(method)){
            try {
                findByUid(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void findByUid(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int uid;
        //获取当前登录的用户
        User u=(User) request.getSession().getAttribute("user");
        uid=u.getId();
        FavoriteService service=new FavoriteServiceImpl();
        //存储数据库返回的该用户的收藏
        List<Favorite> favorites=new LinkedList<>();
        //存储根据收藏的Pid查找到的商品
        List<Product> products=new LinkedList<>();
        Product pro;
        ProductDao dao=new ProductDao();
        try {
            //返回当前用户的收藏
            favorites=service.findByUid(uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (favorites!=null && favorites.size()>0){
            //若收藏不为空，则根据pid查找商品并装填
            for (Favorite fav:favorites) {
                pro=dao.findById(fav.getPid());
                products.add(pro);
            }
            //将查找到的商品以json的形式发回客户端
            Gson gson=new Gson();
            response.getWriter().write(gson.toJson(products));
        }else {
            response.getWriter().write("you hava no favorites!");
        }
    }

    private void addFav(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        response.setCharacterEncoding("utf-8");
        String pid;//商品id
        int uid;//收藏者id
        //获取商品id
        pid = request.getParameter("pid");
            //获取当前用户
        User u = (User) request.getSession().getAttribute("user");
        uid = u.getId();

        Favorite favorite=new Favorite();
//System.out.println("添加到收藏的用户id   "+u.getId());
//System.out.println("添加到收藏的商品id   "+pid);
        favorite.setUid(uid);
        favorite.setPid(pid);
        FavoriteService service=new FavoriteServiceImpl();
        if (service.exist(favorite)){
                response.getWriter().write("该商品已收藏！请勿重复收藏！");
                return;
        }
        if (service.addFav(favorite)){
            response.getWriter().write("成功加入收藏！");
        }else {
            response.getWriter().write("加入收藏失败！");
        }

    }



}
