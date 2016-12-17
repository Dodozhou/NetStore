<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.star.estore.domain.User" %>
<%@ taglib prefix="privilege" uri="http://www.itcast.cn/privilege"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <link rel="stylesheet" type="text/css" href="css/i_want_pulish.css">
    <title>我要发布</title>
    <script src="js/home_page.js"></script>
</head>
<%
    User u=(User)request.getSession().getAttribute("user");
    if (u==null){
        response.sendRedirect("page.jsp");
    }
%>
<body style=" background: -webkit-linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) no-repeat;
background: -o-linear-gradient(left, rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) ;
background: -moz-linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) no-repeat;
background: linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5))">

<!--所有内容-->
<div style="max-width: 1400px;margin: 0 auto;">


    <!--头部开始-->
    <div id="header"  class="col-12 center " >
        <div class="col-1">
            <!--<img style="max-width: 100%;" src="images/logo.png">-->
        </div>
        <div class="col-3   col-4-n">
            <img style="max-width:120px;display: inline;" src="images/logo.png">
            <h1 >校园服务街</h1>
            <p>最安全方便的校园服务平台</p>
        </div>

        <!--收索框-->
        <div class="col-8  col-8-n">
            <div class="search-box">
                <form action="" method="get" id="searchForm">
                    <input type="search" name="searchYour" placeholder="搜 你 所 想" class="search1"/>
                    <input type="submit" name="search" value="搜 索" class="search2"/>
                </form>
            </div>
            <div class="log-box">
                <span class="to_login">登录</span>
                <span class="to_register">注册</span>
            </div>
        </div>
        <div class="a登录注册框">
            <!--登录开始-->
            <div class="mask"></div>
            <div class="log_box" id="log_box">
                <span class="close"><img src="images/close.png"/></span>
                <div class="log-main">
                    <form  method="post" id="loginForm" action="/BookStore/user">
                        <label> 用户</label><input  type="text" name="uername" id="uername"   autofocus REQUIRED/>
                        <label>密码</label><input  type="password" name="password" id="psw"   required/><br/>
                        <input type="checkbox" name="remember"  value="on" class="autologin"/><span>记住用户</span>
                        <input type="checkbox" name="autologin" value="on" class="autologin"/><span>自动登录</span><br />
                        <input type="submit" name="loginbtn"
                               class="go_log" value="登   录" ><br/>
                        <label> <a  href="#"  onclick="register()">去注册</a></label>
                    </form>
                </div>
            </div>
            <!--登录结束-->

            <!--注册开始-->
            <div class="mask"></div>
            <div class="register_box" id="register_box">
                <span class="close"><img src="images/close.png"/></span>
                <div class="register-main" >
                    <form id="registerForm" method="post" action=" " >
                        <input type="hidden" name="method" value="register">
                        <label>用户名</label><input  type="text" name="uername"  id="username"  required /><br/>
                        <label>密码</label><input  type="password" name="password"  id="password" required  /><br/>
                        <label> 确认密码</label> <input  type="password"  name="repassword" id="repassword" required onkeyup="informed()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="tishi"></span><br/>
                        <label>昵称</label><input  type="text"  name="nickname" id="nickname"   required/><br/>
                        <label> 邮箱</label> <input  type="email" name="email" id="email" required  title="email的格式是xxx@xxx.xx"/><br/>
                        <label>验证码</label><input  type="text" name="checkcode" id="code" class="ckeckcode" required/>
                        <input type="button" id="checked"  onclick="creatCode()" value="8TXK" required>
                        <input type="submit" id="submit"  class="register" value=" 注   册 " >
                        <input type="reset"  class="register" value=" 取   消 "><br/><br/>
                        <label> <a href="#" onclick="login()">去登录</a></label><br/>
                    </form>
                </div>
            </div>
            <!--注册结束-->
        </div>

    </div>
    <!--头部结束-->


<!--主体开始-->
<div class="issuemain">
      <div class="row1">
          <div class="col-12 tit">
              <img  src="images/fabu.png"/>
              <span>我要发布</span>
          </div>
      </div>

    <div class="row2  content">
        <div class="col-2 blank"></div>
        <div class="col-7 formmain">
            <div class="row3">
                <div class="col-12 upload">
                    <img src="images/upload.png"/>
                </div>
                <privilege:estore user="${user}"/>
                <div class="col-12 table">
                    <form name="form1" action="${pageContext.request.contextPath}/addProduct"
                          method="post" enctype="multipart/form-data">
                        <div class="col-3 span">
                            <span>商品名称</span>
                        </div>
                        <div class="col-9">
                            <input id="text1" name="name" onclick="document.getElementById('text1').style.backgroundColor='#fff'"
                                   class="input1" type="text" size="25" placeholder="少于25字" required/>
                        </div>
                        <div class="col-3 span">
                            <span>商品图片</span>
                        </div>
                        <div class="col-9">
                            <input id="tex"  name="f" onclick="document.getElementById('text1').style.backgroundColor='#fff'"
                                   class="input1" type="file" size="25" required/>
                        </div>
                    <div id="textarea">
                        <div class="col-3 span">
                            <span>商品详情</span>
                        </div>
                        <div class="col-9">
                            <textarea id="text2" name="description" onclick="document.getElementById('text2').style.backgroundColor='#fff'"
                                      class="input1" rows="5" placeholder="商品用途、新旧程度、原价等信息" required></textarea>
                        </div>
                    </div>
                        <div class="col-3 span">
                            <span>交易地点</span>
                        </div>
                        <div class="col-9">
                            <input  id="text3" name="dealps" onclick="document.getElementById('text3').style.backgroundColor='#fff'"
                                    class="input1" type="text" size="25" required placeholder="宿舍、教学楼、食堂、快递"/>
                        </div>
                        <div class="col-3 span">
                            <span>价格</span>
                        </div>
                        <div class="col-9">
                            <input  id="text4" name="price" onclick="document.getElementById('text4').style.backgroundColor='#fff'" class="input2" type="text"  placeholder="&yen; " required/>
                        </div>
                        <div class="col-3 span">
                            <span>分类</span>
                        </div>
                        <div class="col-9">
                            <input class="input2" name="category" id="datalist" list="browsers" required/>
                            <datalist id="browsers">
                                <option value="校园代步">
                                <option value="手机">
                                <option value="电脑">
                                <option value="数码产品">
                                <option value="数码配件">
                                <option value="运动健身">
                                <option value="衣物用品">
                                <option value="图书素材">
                                <option value="其他">
                            </datalist>
                        </div>
                        <div class="col-3 span">
                            <span>讲价</span>
                        </div>
                        <div class="col-9">
                            <input class="jiangjia" type="radio" name="discount" value="可小刀"/>
                            <input class="jiangjia" type="radio" name="discount" value="不可小刀"/>
                        </div>
                        <div class="col-3 span">
                                <span>联系方式</span>
                        </div>
                        <div class="col-9 tishi">
                               <span id="tishi">（至少选择一项）</span>
                        </div>
                        <div class="col-3 span">
                            <span>QQ</span>
                        </div>
                        <div class="col-9">
                            <span style="vertical-align:center"><%=u.getQQ()%></span>
                            <input type="hidden" value="<%=u.getQQ()%>">
                        </div>
                        <div class="col-3 span">
                            <span>手机号</span>
                        </div>
                        <div class="col-9">
                            <span><%=u.getPhone()%></span>
                            <input type="hidden" value="<%=u.getPhone()%>">
                        </div>
                        <div class="col-3 span radio" style="text-align: right">
                            <input  type="radio"/>
                        </div>
                        <div class="col-9 rule">
                            <span>我同意<a href="#">商品发布规则</a></span>
                        </div>
                        <div class="submit">
                            <button type="submit" value="agree">发布</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>
        <div class="col-3">

        </div>
    </div>

</div>
    <!--结尾开始-->
    <div id="footer" style="background:rgba(43,76,126, 0.79);height: 120px;margin-bottom: 0;clear: both;">
        <div class="col-12">
            <p style="color:#fff;text-align: center;">四川省西南石油大学</p>
            <p style="color:#fff;text-align: center;">翼灵物联工作室版权所有</p>
        </div>
    </div>
    <!--结尾结束-->
</div>

<script type="text/javascript">
    //开始登陆,注册
    var to_login = document.getElementsByClassName("to_login")[0];
    var mask = document.getElementsByClassName("mask")[0];
    var mask1 = document.getElementsByClassName("mask")[1];
    var to_register = document.getElementsByClassName("to_register")[0];
    var close = document.getElementsByClassName("close")[0];
    var close1 = document.getElementsByClassName("close")[1];
    var log_box = document.getElementsByClassName("log_box")[0];
    var register_box = document.getElementsByClassName("register_box")[0];

    to_login.onclick=function(){
        log_box.style.display = "block";
        mask.style.display = "block";
    };
    close.onclick = function (){
        log_box.style.display = "none";
        mask.style.display = "none";
    };
    to_register.onclick=function(){
        register_box .style.display = "block";
        mask1.style.display = "block";
    };close1.onclick = function (){
        register_box.style.display = "none";
        mask1.style.display = "none";
    };
    function  register() {
        log_box.style.display = "none";
        mask.style.display = "none";
        register_box .style.display = "block";
        mask1.style.display = "block";

    }
    function login() {
        register_box.style.display = "none";
        mask1.style.display = "none";
        log_box.style.display = "block";
        mask.style.display = "block";
    }

</script>
</body>
</html>