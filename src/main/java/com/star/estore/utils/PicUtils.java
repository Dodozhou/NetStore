package com.star.estore.utils;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.xml.internal.ws.api.message.ExceptionHasMessage;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by hp on 2016/12/4.
 */
public class PicUtils {
    private String srcFile;//存储传入的文件路径
    private String destFile;
    private int width;
    private int height;
    private Image img;

    /**
     * 构造函数，获取、处理必要的参数
     * @param fileName
     * @throws IOException
     */
    public PicUtils(String fileName) throws IOException{
        File _file = new File(fileName); //读入文件
        this.srcFile = fileName;
        //取出文件名后缀
        int index = this.srcFile.lastIndexOf(".");
        String ext = this.srcFile.substring(index);//从index完后的部分截取出来
        //取得缩略图的路径
        this.destFile = this.srcFile.substring(0,index)+"_s"+ext;
        img = ImageIO.read(_file);//构造Image对象
        width = img.getWidth(null);
        height = img.getHeight(null);
    }

    /**
     * 强制压缩/放大图片到固定的大小
     * @param w
     * @param h
     * @throws IOException
     */
    public void resize(int w,int h) throws IOException {
        //将图片加载到内存中
        BufferedImage _image = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
        _image.getGraphics().drawImage(img,0,0,w,h,null);//绘制缩小后的图
        FileOutputStream out = new FileOutputStream(destFile);//建立输出流并指定文件名
        //将文件输出为jpeg格式的
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        encoder.encode(_image);
        out.close();
    }

    /**
     * 按照固定比例缩放图片
     * @param t 缩放比例
     * @throws IOException
     */
    public void resize(double t) throws IOException {
        int w = (int) (width*t);
        int h = (int) (height*t);
        resize(w,h);
    }

    /**
     * 以宽度为基准，等比例缩放图片
     * @param w
     * @throws IOException
     */
    public void resizeByWidth(int w) throws IOException {
        int h=(height*w/width);
        resize(w,h);
    }

    /**
     * 以高度为基准，等比例缩放图片
     * @param h
     * @throws IOException
     */
    public void resizeByHeight(int h) throws IOException {
        int w = (width*h/height);
        resize(w,h);
    }

    /**
     * 按照最大高度限制，生成最大的等比例缩略图
     * @param w
     * @param h
     * @throws IOException
     */
    public void resizeFix(int w,int h) throws IOException {
        if(width / height > w/h ){
            resizeByWidth(w);
        }else {
            resizeByHeight(h);
        }
    }

    /**
     * 设置缩略图文件名为传入的fileName
     * @param fileName
     * @throws Exception
     */
    public void setDestFile(String fileName) throws Exception {
        if (!fileName.endsWith(".jpg")){
            throw new Exception("Dest File Must end with \".jpg\".");
        }
        destFile = fileName;
    }

    public String getDestFile(){
        return destFile;
    }

    public int getSrcWidth(){return width;}

    public int getSrcHeight(){return height;}

}
