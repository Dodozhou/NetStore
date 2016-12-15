package com.star.estore.utils;

import com.star.estore.utils.mail.MailSenderInfo;
import com.star.estore.utils.mail.SimpleMailSender;

import javax.mail.*;

/**
 * Created by hp on 2016/11/29.
 */

public class MailUtils {
    public static void sendMail(String email,String emailMsg) throws MessagingException {
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setUserName("zhoucheng05_13@163.com");
        mailInfo.setPassword("zhoucheng0513");//您的邮箱密码
        mailInfo.setFromAddress("zhoucheng05_13@163.com");
        mailInfo.setToAddress(email);
        mailInfo.setSubject("多终端校园交易平台用户注册验证");
        mailInfo.setContent(emailMsg);
        //这个类主要来发送邮件
        SimpleMailSender sms = new SimpleMailSender();
        //sms.sendTextMail(mailInfo);//发送文体格式
        SimpleMailSender.sendHtmlMail(mailInfo);//发送html格式
        //邮件正文中文乱码问题未解决
    }
}
