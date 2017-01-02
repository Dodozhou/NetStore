package com.star.estore.domain;

/**
 * Created by hp on 2016/12/28.
 */
public class Favorite {
    int id;//收藏记录的id
    int uid;//收藏者的id
    String pid;//商品的id

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
