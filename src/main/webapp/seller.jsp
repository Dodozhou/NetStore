<%@ page import="com.star.estore.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.star.estore.domain.Product" %>
<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <link rel="stylesheet" type="text/css" href="css/buyer_homepage.css"/>
    <script src="js/home_page.js"></script>
    <title>校园二手街</title>
</head>


<body style=" background: -webkit-linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) no-repeat;
background: -o-linear-gradient(left, rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) ;
background: -moz-linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) no-repeat;
background: linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5))">


<!--所有内容-->

<div style="max-width: 1400px;margin: 0 auto;">

    <!--登录注册-->
    <div class="log-box ">
        <small><a href="page.jsp"><img src="images/return-homepage.png"/><label>返回首页</label></a></small>
        <p>
            <span id="login_status">未登录</span>
            <span class="to_login">登录</span>
            <span class="to_register">注册</span></p>
    </div>

    <div  class="col-12 center header" >
        <div class="col-1">
        </div>

        <!--logo-->
        <div class="col-5  ">
            <img class="logo-img" src="images/logo.png">
            <div class="logo-text">
                <p  style="font-size: 30px;">校园服务街</p>
                <p>最安全方便的校园服务平台</p>
            </div>
        </div>
        <!--收索框-->
        <div class="col-6 ">
            <div class="search-box">
                <form action="" method="get" id="searchForm">
                    <input type="search" name="searchYour" placeholder="搜 你 所 想" class="search1"/>
                    <input type="submit" name="search" value=" " class="search2"/>
                </form>
            </div>
        </div>

    </div>

    <div class="a登录注册框">
        <!--登录开始-->
        <div class="mask"></div>
        <div class="log_box" id="log_box">
            <span class="close"><img src="images/close.png"/></span>
            <div class="log-main">
                <form  method="post" id="loginForm" action="/BookStore/user">
                    <label for="uername"> 用户</label><input  type="text" name="uername" id="uername"   autofocus REQUIRED/>
                    <label for="psw">密码</label><input  type="password" name="password" id="psw"   required/><br/>
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
                    <label> 确认密码</label> <input  type="password"  name="repassword" id="repassword" required onblur="informed()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="tishi"></span><br/>
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
    <br style="clear: both;"/>
    <!--头部结束-->

    <!--主体开始   by  zhao-->
    <!--start .main    by li-->
    <%
        User u=(User) request.getAttribute("pro_own");
    %>

    <div class="main row">

        <!--start .basic-->

        <div class="basic row">
            <div class="col-3" id="head-icon">
                <img src="<%=u.getHeader()%>" height="150px" width="150px"/>
            </div>
            <div class="basic-infor col-9">
                <h2><%=u.getNickname()%></h2>
                <p>已卖出*件商品</p>
                <ul>
                    <li><span>商品数：0</span><span>当前等级：0</span><span>服务周到：0</span> </li>
                    <li><span>收藏数：0</span><span>当前积分：0</span><span>质量满意：0</span></li>
                    <li><span>销售量：0</span><span>当前信用：0</span><span>价格合理：0</span></li>
                </ul>
                <ul>
                    <li><span>创建时间：<%=u.getUpdatetime()%></span></li>
                    <li><span>联系电话：<%=u.getPhone()%></span></li>
                    <li><span>Q&nbsp;Q:&nbsp;&nbsp;&nbsp;<%=u.getQQ()%></span></li>

                </ul>
            </div>
        </div>


    <div class="basic row">
        <div class="col-12">
           <h3>买家留言</h3>
            <section class="information"><span><img src="images/small-head-logo.png"/> 昵称</span><span class="text">好好，好好</span></section>
            <section class="information"><span><img src="images/small-head-logo.png"/> 昵称</span><span class="text">好好，好好</span></section>
            <section class="information"><span><img src="images/small-head-logo.png"/> 昵称</span><span class="text">好好，好好</span></section>
            <section class="information"><span><img src="images/small-head-logo.png"/> 昵称</span><span class="text">好好，好好</span></section>
        </div>
    </div>

        <div class="basic row">
            <div class="col-12">
             <h3>卖家的其他闲置商品</h3>
                <ul class="shangpin_more">
              <li>
                  <c:if test="${empty pro}">
                      该用户当前没有任何商品！
                  </c:if>
                  <c:if test="${not empty pro}">
                      <c:forEach var="product" items="${pro}">
                  <a href="${pageContext.request.contextPath}/product?method=findById&id=${product.id}">
                      <img class="shangpin_img" src="${product.imgurl}"/></a>
                      </c:forEach>
                  </c:if>

                 </li>
                    </ul>
            </div>
        </div>
    <!--end .main-->

</div>
    <!--主体结束-->



    <!--结尾开始-->
    <div id="footer" style="background:rgba(43,76,126, 0.79);height: 120px;margin-bottom: 0;clear: both;">
        <div class="col-12">
            <p style="color:#fff;text-align: center;">四川省西南石油大学</p>
            <p style="color:#fff;text-align: center;">翼灵物联工作室版权所有</p>
        </div></div>
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