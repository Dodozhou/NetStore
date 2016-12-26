package com.star.estore.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by hp on 2016/12/4.
 */
//可序列化的对象
public class Product implements Serializable {
    private String id; // 商品编号
    private String name; // 名称
    private double price; // 价格
    private String category; // 分类
    private int pnum; // 数量
    private String imgurl; // 图片路径
    private String description; // 描述
    // 在获取销售榜单信息时使用
    private int totalSaleNum; // 总销售数量

    private String dealps;
    private boolean discount;
    private String QQ;
    private String phone;
    private int owner;
    private Timestamp update_time;

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }

    public String getDealps() {
        return dealps;
    }

    public void setDealps(String dealps) {
        this.dealps = dealps;
    }

    public boolean isDiscount() {
        return discount;
    }

    public void setDiscount(boolean discount) {
        this.discount = discount;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPnum() {
        return pnum;
    }

    public void setPnum(int pnum) {
        this.pnum = pnum;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTotalSaleNum() {
        return totalSaleNum;
    }

    public void setTotalSaleNum(int totalSaleNum) {
        this.totalSaleNum = totalSaleNum;
    }

    //得到缩略图图片路径
    public String getImgurl_s(){
        int index = imgurl.lastIndexOf(".");
        String filename = imgurl.substring(0,index);
        String ext = imgurl.substring(index);
        return filename+"_s"+ext;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Product other = (Product) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }



}
