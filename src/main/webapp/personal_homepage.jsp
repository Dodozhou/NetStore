<%@ page import="com.star.estore.domain.User" %>
<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <link rel="stylesheet" type="text/css" href="css/personal_homepage.css"/>
    <script src="js/home_page.js"></script>
    <title>校园二手街</title>
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


<!--主体开始   by  zhao-->
<!--start .main    by li-->
			
			<div class="main">
				
				<!--start .basic-->
				
				<div class="basic row">
					<div class="col-3" id="head-icon">
						<img src="images/head-icon.png" />
					</div>
					<div class="basic-infor col-9">
						<h2>用户ID</h2>
						<p>已卖出*件商品</p>
						<ul>
							<li><span>当前等级：0</span><a href="#">等级有什么用？</a></li>
							<li><span>当前积分：0</span><a href="#">查看积分明细</a></li>
							<li><span>升级还需：0</span><a href="#">如何升级？</a></li>
						</ul>
					</div>
				</div>
				
				<!----------------------------------end .basic------------------------------------------------->
				
				<!----------------------------------start .tabs------------------------------------------------->
				
				<div class="tabs">
						<input type="radio" id="" name="tab-control" checked=" checked" />
						<input type="radio" id="" name="tab-control" />
						<input type="radio" id="" name="tab-control" />
						<input type="radio" id="" name="tab-control" />
					<ul>
						<li title="tab" onclick="liclick1()" ><label for="tab" role="button"><span style="color: #929daf;">个人资料</span></label></li>
						<li title="tab" onclick="liclick2()" ><label for="tab" role="button"><span>我发布的商品</span></label></li>
						<li title="tab" onclick="liclick3()" ><label for="tab" role="button"><span>我的收藏</span></label></li>
						<li title="tab" onclick="liclick4()" ><label for="tab" role="button"><span>消息中心</span></label></li>
					</ul>
					<!---<div class="slider">
						<div class="indicator">
							<!--用于制作下划线动画-->
						<!--</div>
					</div>-->
					<div class="content">
						<section id="tab1">
							<h2 >个人资料</h2>
							<h4>帐号信息</h4>
							<hr />
							<p>账号<span>123456@163.com</span></p>
							<h4>基本信息<button>✐ 编辑</button></h4>
							<hr  />
							<p>昵称<span>123</span></p>
							<p>手机<span>123456789</span></p>
							<p>QQ&nbsp;&nbsp;<span>6543210</span></p>
						</section>
						<section id="tab2">
							<h2>我发布的商品</h2>
							<div class="mine row">
								<div class="mine-img col-3">
									<img src="images/demo.jpg" />
								</div>
								<div class="mine-txt col-9">
									<h3>发布的商品名称<button>取消发布</button></h3>
									<p>商品信息简介</p>
									<p>商品状态：出售中</p>
								</div>
							</div>
						</section>
						<section  id="tab3">
							<h2>我的收藏</h2>
							<div class="mine row">
								<div class="mine-img col-3">
									<img src="images/demo.jpg" />
								</div>
								<div class="mine-txt col-9">
									<h3>收藏的商品名称<button>取消收藏</button></h3>
									<p>商品信息简介</p>
									<p>商品状态：出售中</p>
								</div>
							</div>
						</section>
						<section id="tab4">
							<h2>消息中心</h2>
							<div class="msg">
								<p class="msg-content">Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
						  	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
						  	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
						  	nisi ut aliquip ex ea commodo consequat.
								</p>
								<time datetime="2016-12-10" pubdate="true">2016-12-10</time>
							</div>
						</section>
					</div>
					
					
				</div>	
				
				<!--end .tabs-->
				
			</div>
			
			<!--end .main-->


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


<!--tab切换   by li-->
<script type="text/javascript">
			function liclick1(){
				var tab1=document.getElementById("tab1");
				var tab2=document.getElementById("tab2");
				var tab3=document.getElementById("tab3");
				var tab4=document.getElementById("tab4");
				tab1.style.display='block';
				tab2.style.display='none';
				tab3.style.display='none';
				tab4.style.display='none';
			}
			function liclick2(){
				var tab1=document.getElementById("tab1");
				var tab2=document.getElementById("tab2");
				var tab3=document.getElementById("tab3");
				var tab4=document.getElementById("tab4");
				tab1.style.display='none';
				tab2.style.display='block';
				tab3.style.display='none';
				tab4.style.display='none';
			}
			function liclick3(){
				var tab1=document.getElementById("tab1");
				var tab2=document.getElementById("tab2");
				var tab3=document.getElementById("tab3");
				var tab4=document.getElementById("tab4");
				tab1.style.display='none';
				tab2.style.display='none';
				tab3.style.display='block';
				tab4.style.display='none';
			}
			function liclick4(){
				var tab1=document.getElementById("tab1");
				var tab2=document.getElementById("tab2");
				var tab3=document.getElementById("tab3");
				var tab4=document.getElementById("tab4");
				tab1.style.display='none';
				tab2.style.display='none';
				tab3.style.display='none';
				tab4.style.display='block';
			}
			
		</script>



</body>
</html>