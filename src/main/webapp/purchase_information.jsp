<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.star.estore.domain.User" %>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <link rel="stylesheet" type="text/css" href="css/purchase_information.css"/>
    <script src="js/home_page.js"></script>
    <title>校园二手街</title>
</head>

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


<!--主体开始   by  zhao-->

<div class="main row">
				
				<h1>求购专区</h1>
				<hr />
							
				<div class="wantbuy col-12">
					<h2>我想买的商品</h2>
					<p>
						<a href="#">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
						  	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
						  	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
						  	nisi ut aliquip ex ea commodo consequat.
						</a>
					</p>
					<time datetime="2016-12-10" pubdate="true" class="pubdate">2016年12月10日</time>
				</div>
				
				<div class="wantbuy col-12">
					<h2>我想买的商品</h2>
					<p>
						<a href="#">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
						  	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
						  	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
						  	nisi ut aliquip ex ea commodo consequat.
						</a>
					</p>
					<time datetime="2016-12-10" pubdate="true" class="pubdate">2016年12月10日</time>
				</div>
				
				<div class="wantbuy col-12">
					<h2>我想买的商品</h2>
					<p>
						<a href="#">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
						  	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
						  	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
						  	nisi ut aliquip ex ea commodo consequat.
						</a>
					</p>
					<time datetime="2016-12-10" pubdate="true" class="pubdate">2016年12月10日</time>
				</div>
				
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