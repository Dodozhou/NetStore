package com.star.estore.utils;

import sun.plugin.com.Dispatcher;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by hp on 2016/11/22.
 */
public class CheckImgServlet extends HttpServlet {
    //定义一个集合保存所有成语
    private List<String> words=new ArrayList<String>();


    @Override
    public void init() throws ServletException {

        //初始化阶段，读取new_words.txt
        //web工程中读取文件，必须使用绝对路径
        String path=getServletContext().getRealPath("/WEB-INF/new_words.txt");
        try {
            //输入流读取文件
            BufferedReader reader=new BufferedReader(new InputStreamReader(
                    new FileInputStream(path),"utf-8"));
            //读出文件中的每行文字，并存入Map中
            String line;
            while ((line=reader.readLine())!=null){
                words.add(line);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //绘制验证码图片
        int width=120;
        int height=30;

        //步骤一，绘制一张内存中的图片
        BufferedImage bufferedImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //步骤二 图片绘制背景颜色 --通过绘图对象
        Graphics graphics= bufferedImage.getGraphics();     //得到画图对象，---画笔
        //绘制图形之前，选择一个颜色，颜色随机生成
        graphics.setColor(getRandColor(200,250));
        //背景颜色填充矩形
        graphics.fillRect(0,0,width,height);

        //步骤三 绘制边框
        graphics.setColor(Color.WHITE);
        graphics.drawRect(0,0,width-1,height-1);

        //步骤四 四个随机数字
        Graphics2D graphics2D=(Graphics2D)graphics;
        //设置字体
        graphics2D.setFont(new Font("宋体",Font.BOLD,18));

        Random random=new Random();//生成随机数
        int index=random.nextInt(words.size());
        String word=words.get(index);//获得随机成语

        //定义x坐标
        int x=10;
        for (int i=0;i<word.length();i++){
            //随机颜色
            graphics2D.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            //旋转 -30到30度
            int jiaodu=random.nextInt(60)-30;
            //换算弧度
            double theta = jiaodu*Math.PI/180;
            //获得字母数字
            char c=word.charAt(i);
            //将c输出到图片
            graphics2D.rotate(theta,x,20);
            graphics2D.drawString(String.valueOf(c),x,20);
            graphics2D.rotate(-theta,x,20);
            x+=30;
            }

            //将验证码内容保存到session，以便于前端页面使用
        request.getSession().setAttribute("checkcode_session",word);
        //System.out.println(word);

        // 步骤五 绘制干扰线
        // graphics.setColor(getRandColor(160, 200));
        // int x1;
        // int x2;
        // int y1;
        // int y2;
        // for (int i = 0; i < 30; i++) {
        // x1 = random.nextInt(width);
        // x2 = random.nextInt(12);
        // y1 = random.nextInt(height);
        // y2 = random.nextInt(12);
        // graphics.drawLine(x1, y1, x1 + x2, x2 + y2);
        // }

        //将上面的图片通过ImageIO输出到浏览器
        response.setCharacterEncoding("utf-8");
        ImageIO.write(bufferedImage,"png",response.getOutputStream());
        graphics.dispose();//释放资源

        }

    /**
     *
     * @param fc
     *              int 范围参数1
     * @param bc
     *              int 范围参数2
     * @return Color
     */
    private Color getRandColor(int fc, int bc) {
        //取其随机颜色
        Random random=new Random();
        if (fc>255){
            fc=255;
        }
        if (bc>255){
            bc=255;
        }
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }


}
