package com.star.estore.web;

import com.star.estore.annotation.PrivilegeInfo;
import com.star.estore.domain.Product;
import com.star.estore.domain.User;
import com.star.estore.exception.PrivilegeException;
import com.star.estore.factory.ProductServiceFactory;
import com.star.estore.service.ProductService;
import com.star.estore.utils.PicUtils;
import com.star.estore.utils.UploadUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 * Created by hp on 2016/12/4.
 */
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.封装数据到Javabean——先将数据封装到map集合中
        Map<String,String[]> map = new HashMap<>();

        //2.DiskFileItemFactory 用来创建ServletFIleUpload对象并设置上传文件大小限制
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024*1024*5);//设置缓存区大小为5M Threshold 临界值
        //设置临时文件存储位置
        factory.setRepository(new File(this.getServletContext().getRealPath("/temp")));
        //创建ServletFileUpload
        ServletFileUpload upload = new ServletFileUpload(factory);
        //判断上传表单是否为multipart/form-data类型 是否为多媒体上传
        if (upload.isMultipartContent(request)){
            upload.setHeaderEncoding("utf-8");//解决中文上传乱码问题

            //得到所有的FIleItem
            try {
                //将获得的FileIterm存入list中
                List<FileItem> items = upload.parseRequest(request);
                //5.遍历items
                for (FileItem item:items){
                    //普通字段
                    if (item.isFormField()){
                        String fileName = item.getFieldName();//获的字段名
                        String value = item.getString("utf-8");//获得字段值，可以指定编码方式
                        //封装普通字段到map中，便于后边封装
                        map.put(fileName,new String[]{value});
                    }else {
                        //是上传的组件
                        String filename = item.getName();//获得上传文件名称
                        //得到真实名称(即最后一个\后的字符串),调用util包中的UploadUtils类的subFileName方法
                        filename = UploadUtils.subFileName(filename);//如a.txt
                        //得到随机名称
                        String uuidFileName = UploadUtils.generateRandomFileName(filename);
                        //得到随机目录
                        String randomDir = UploadUtils.generateRandomDir(uuidFileName);
                        //合成path
                        String path = this.getServletContext().getRealPath("/upload"+randomDir);

                        File pathFile = new File(path);
                        //如果目录不存在，则创建目录
                        if (!pathFile.exists()){
                            //注意，是用mkdirs而不是mkdir
                            boolean dir = pathFile.mkdirs();
                        }
                        //得到一个imgurl
                        String imgurl = "/upload" + randomDir+"/"+uuidFileName;
                        map.put("imgurl",new String[] {imgurl});//封装上传图片的路径

                        item.write(new File(pathFile,uuidFileName));//文件上传操作
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }


            //封装商品的id
            map.put("id",new String[]{UUID.randomUUID().toString()});
            Product product = new Product();

            try {
                BeanUtils.populate(product,map);//将map中的属性封装为对象
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }

            //做一个功能，得到商品缩略图
            PicUtils putils = new PicUtils(this.getServletContext().getRealPath(product.getImgurl()));
            putils.resize(200,200);
            //调用productService中的添加商品方法
            ProductService service = ProductServiceFactory.getInstance();

            User user = (User) request.getSession().getAttribute("user");
            try {
                service.add(user,product);
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }

        }



    }
}
