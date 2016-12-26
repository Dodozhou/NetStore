package com.star.estore.domain;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by hp on 2016/12/16.
 */
public class Purchase {
    private int id;//求购物品的编号
    private String name;//求购物品名称
    private String description;//求购物品描述
    private String dealps;//交易地点
    private int price;//期望价格
    private String category;//求购物品的类别，方便查询
    private int owner;//求购信息发布者
    private String QQ;//联系方式
    private String phone;
    private Timestamp update_time;

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDealps() {
        return dealps;
    }

    public void setDealps(String dealps) {
        this.dealps = dealps;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }


}
