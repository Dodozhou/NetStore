package com.star.estore.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by hp on 2016/11/28.
 */
public class Md5Utils {
    /**
     * 使用Md5算法进行加密
     */
    public static String md5(String plainText){
        //定义一个字节数组，接收加密完成的密码
        byte[] secretBytes=null;
        try {
            /**
             * MessageDigest：实现指定算法的一个类
             * 返回值是一个MessageDigest对象
             * getInstance(String algorithm)
             * algorithm :要实现的算法名字
             * public byte[] digest()
             * 通过执行注入填充志蕾的最终操作完成哈希计算。在调用次方法之后，摘要被重置
             */

            secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        /**
         * public BigInteger(int signum,byte[] magnitude)
         * signum:生成的大数字的符号。-1表示负数，0表示零，1表示正数
         * magnitude：需要转化的字节数组
         */
        String md5code=new BigInteger(1,secretBytes).toString(16);//16进制数字
        //如果生成的数字未满32位，要在前面补0
        for (int i=0;i<32-md5code.length();i++){
            md5code="0"+md5code;
        }
        return md5code;
    }
    //用于测试的主方法。
   /* public static void main(String[] args) {
        System.out.println(md5("123"));
        System.out.println(md5("123"));
    }*/
}
