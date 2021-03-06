<%@ page import="com.star.estore.domain.User" %>
<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
	<%--禁用缓存--%>
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="0">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
	<link rel="stylesheet" type="text/css" href="css/normal.css">
    <link rel="stylesheet" type="text/css" href="css/personal_homepage.css"/>
    <script src="js/home_page.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/favorite.js"></script>
    <script src="js/per_info.js"></script>
    <title>校园二手街</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
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
	<!--登录注册-->
	<div class="log-box">

		<small class="left_to" ><a href="page.jsp"><img src="images/return-homepage.png"/><label >首页</label> </a></small>
		<p>
        <span class="right_to">
            <c:if test="${empty user }">
				&nbsp;
				<span style="color: red;" id="login_status">请登录!</span>
			</c:if>
        <c:if test="${not empty user }">
        &nbsp;
        <span>
            欢迎您！${user.username}
            </c:if>
        </span>
                </span>
			<%--<span id="login_status">未登录</span>--%>
			<span class="to_login right_to">登录</span>
			<span class="to_register right_to">注册</span>
		</p>
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
				<form action="${pageContext.request.contextPath}/product" method="post" id="searchForm">
					<input type="hidden" name="method" value="findByKey">
					<input type="search" name="key" placeholder="搜 你 所 想" class="search1"/>
					<input type="submit" name="search" value=" " class="search2"/>
				</form>
			</div>
		</div>

		<div class="a登录注册框">
			<!--登录开始-->
			<div class="mask"></div>
			<div class="log_box" id="log_box">
				<span class="close"><img src="images/close.png"/></span>
				<div class="log-main">
					<form  method="post" id="loginForm" action="${pageContext.request.contextPath}/user">
						<input type="hidden" name="method" value="login">
						<label for="uername"> 用户</label><input  type="text" name="username" id="uername"   autofocus REQUIRED/>
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
					<form id="registerForm" method="post" action="${pageContext.request.contextPath }/user" >
						<input type="hidden" name="method" value="regist">
						<label>用户名</label><input  type="text" name="username"  id="username"  required /><br/>
						<label>密码</label><input  type="password" name="password"  id="password" required  /><br/>
						<label> 确认密码</label> <input  type="password"  name="repassword" id="repassword" required onblur="informed()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="tishi"></span><br/>
						<label>昵称</label><input  type="text"  name="nickname" id="nickname"   required/><br/>
						<label> 邮箱</label> <input  type="email" name="email" id="email" required  title="email的格式是xxx@xxx.xx"/><br/>
						<label>验证码</label><input  type="text" name="checkcode" id="code" class="ckeckcode" required/>
						<img src='${pageContext.request.contextPath }/checkcode' id="im" onclick="change();">
						<span id="checkcode_span">
					<a href="javascript:void(0)" onclick="change();">
					<font color='black'>看不清，换一张</font>
					</a>
					</span>
						${requestScope["regist.message"] }
						<br>
						<c:forEach items="${map}" var="m">
							${m.value }<br>
						</c:forEach>
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

							<form method="post" action="${pageContext.request.contextPath}/user?method=header"  enctype="multipart/form-data">
								<label for="file_up" class="imglogo" >
									<img class="changeimg" id="header" src="${pageContext.request.contextPath}<%=u.getHeader()%>" height="150px" width="150px" />
									<span class="userlogo">✐ 点击编辑 </span></label>
								<input type="file" name="img" id="file_up"  style="display: none;">
								<br>
								<input type="submit" id="submit1" class="submit" value=" 提交">
							</form>


					</div>
					<div class="basic-infor col-9">
						<h2><%=u.getNickname()%></h2>
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
							<p>账号<span><%=u.getEmail()%></span></p>
							<h4>基本信息<button onclick="changes()">✐ 编辑</button></h4>
							<hr  />

							<div id="hidden">
								<p>昵称<span id="hidden1" ><%=u.getNickname()%></span></p>
								<p>手机<span id="hidden2"><%=u.getPhone()%></span></p>
								<p>QQ&nbsp;&nbsp;<span id="hidden3"><%=u.getQQ()%></span></p>
							</div>
							<form action="${pageContext.request.contextPath}/user" method="post" id="homepage">
								<input type="hidden" name="method" value="update">
								<p>昵称 <input type="text" name="nickname"  value=<%=u.getNickname()%> /></p>
								<p>手机 <input type="tel" name="phone" value=<%=u.getPhone()%> /></p>
								<p>QQ&nbsp;&nbsp;<input type="text" name="QQ" value=<%=u.getQQ()%> /></p>
								<input type="submit" value="提 交" class="submit1"/>
							</form>

						</section>
						<section id="tab2">
							<h2>我发布的商品</h2>
							<span id="mypro"></span>

						</section>
						<section  id="tab3">
							<h2>我的收藏</h2>
                            <span id="favorite"></span>

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

			function  changes(){
				var hidden= document.getElementById("hidden");
				var homepage = document.getElementById("homepage");
				var Hinput = homepage.getElementsByTagName("input");
				var hidden1 = document.getElementById("hidden1");
				var hidden2 = document.getElementById("hidden2");
				var hidden3 = document.getElementById("hidden3");
				var Hsubmit = Hinput[4];
				hidden.style.display='none';
				homepage.style.display='block';

				/*Hsubmit.onclick = function(){
					hidden.style.display='block';
					homepage.style.display='none';
					/!* 页面上值的替换*!/
					hidden1.innerHTML = Hinput[0].value;
					hidden2.innerHTML = Hinput[1].value;
					hidden3.innerHTML = Hinput[2].value;
				}*/
			}

		</script>
<script>
	document.getElementById('file_up').onchange = function() {
		var imgFile = this.files[0];
		var fr = new FileReader();
		fr.onload = function() {
			document.getElementById('header').src = fr.result;
		};
		fr.readAsDataURL(imgFile);
		/*document.getElementById("submit1").style.display='block';*/
	};
</script>



</body>
</html>