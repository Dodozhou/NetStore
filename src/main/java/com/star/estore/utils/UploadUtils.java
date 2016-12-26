package com.star.estore.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Created by hp on 2016/12/4.
 */
public class UploadUtils {
    /**
     * 获取真实文件名
     */
    public static String subFileName(String fileName){
        //查找最后一个/出现的位置
        int index = fileName.lastIndexOf("\\");
        if (index == -1){
            return fileName;
        }
        return fileName.substring(index+1);
    }

    //获取随机UUID文件名
    public static String generateRandomFileName(String fileName){
        //获得扩展名
        String ext=fileName.substring(fileName.lastIndexOf("."));
        //UUID+扩展名
        return UUID.randomUUID().toString()+ext;
    }

    //获取hashcode生成二级目录
    public static String generateRandomDir(){
        SimpleDateFormat df=new SimpleDateFormat("/yyyy/MM/dd/HH");
        return df.format(new Date());
    }
}
