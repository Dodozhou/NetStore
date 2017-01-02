<%@ page import="com.star.estore.domain.User" %>
<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="cache-control" content="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <script src="js/jquery.js?v=1.83.min" type="text/javascript"></script>
    <script src="js/load.js"></script>
<%--
    <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
--%>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/sucaijiayuan.js"></script>
    <title>校园二手街</title>
</head>
<%
    response.setHeader("Pragma","No-cache");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
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

        <small><a href="page.jsp"><img src="images/return-homepage.png"/><label >首页</label> </a></small>
        <div>

             <span class="personal-img" style="padding-top: 10px;">
                   <img class="personal-img1" src="images/QRCode.png"/>
                 <c:if test="${not empty user }">
                <span class="personal" >
                    <span> <img src="${pageContext.request.contextPath}/${user.header}" height="50%" width="50%"/></span><br/>
                     <li> <a href="per_home.jsp"> 个人中心</a></li>
                    <li>  <a href="per_home.jsp"> 收藏</a></li>
                    <li>  <a href="per_home.jsp"> 消息</a></li>
                        <li>  <a href="${pageContext.request.contextPath}/user?method=logout"> 注销</a></li>
                </span>
                 </c:if>
               </span>

        <span>
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
        </div>
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


<!--导航栏开始-->
<!--电脑版-->
<div id="nav"  >
        <ul class="nav1">
            <li   class="li1">
                <a href="#a1"  class="a">校园代步</a><span class="span1">|</span>
                <ul  class="ul1">
                    <li><a href="#a1" >电动车</a></li>
                    <li><a href="#a1" >自行车</a></li>
                </ul>
            </li>
            <li class="li1">
                <a href="#a2"  class="a">手机</a><span class="span1">|</span>
                <ul class="ul1">
                    <li> <a href="#a2">各种</a></li>
                </ul>
            </li>
            <li class="li1">
                <a href="#a3"  class="a"> &nbsp;电脑  &nbsp;</a><span class="span1">|</span>
                <ul class="ul1">
                    <li><a href="#a3">笔记本</a></li>
                    <li><a href="#a3">台式机</a></li>
                </ul>
            </li>
            <li class="li1">
                <a href="#a4"  class="a">数码产品</a><span class="span1">|</span>
                <ul class="ul1">
                    <li> <a href="#a4">平板</a></li>
                    <li> <a href="#a4">相机</a></li>
                    <li> <a href="#a4">单反</a></li>
                    <li> <a href="#a4">mp3/mp4</a></li>
                    <li> <a href="#a4">游戏机</a></li>
                    <li> <a href="#a4">智能手环</a></li>
                </ul>
            </li>
            <li class="li1">
                <a href="#a5"  class="a"> 数码配件</a><span class="span1">|</span>
                <ul class="ul1">
                    <li> <a href="#a5"> 充电宝</a></li>
                    <li> <a href="#a5"> 耳机</a></li>
                    <li> <a href="#a5"> 显示器</a></li>
                    <li> <a href="#a5"> 鼠标</a></li>
                    <li> <a href="#a5"> 键盘</a></li>
                    <li> <a href="#a5"> 移动硬盘</a></li>
                </ul>
            </li>
            <li class="li1">
                <a href="#a6"  class="a"> 运动健身 </a><span class="span1">|</span>
                <ul class="ul1">
                    <li> <a href="#a6">篮球、足球</a></li>
                    <li> <a href="#a6"> 羽毛球</a></li>
                    <li> <a href="#a6"> 乒乓球</a></li>
                    <li> <a href="#a6"> 网球</a></li>
                    <li> <a href="#a6"> 轮滑</a></li>
                    <li> <a href="#a6"> 哑铃</a></li>
                    <li> <a href="#a6"> 护具</a></li>
                </ul>
            </li>
            <li class="li1">
                <a href="#a7"  class="a"> 衣物用品 </a><span class="span1">|</span>
                <ul class="ul1">
                    <li> <a href="#a7">衣服、裤子</a></li>
                    <li> <a href="#a7"> 鞋</a></li>
                    <li> <a href="#a7"> 雨伞</a></li>
                    <li> <a href="#a7">围巾、帽子</a></li>
                    <li> <a href="#a7"> 背包</a></li>
                    <li> <a href="#a7"> 护肤品</a></li>
                </ul>

            </li>
            <li class="li1">
                <a href="#a8"  class="a"> 图书教材</a><span class="span1">|</span>
                <ul class="ul1">
                    <li> <a href="#a8"> 教材</a></li>
                    <li> <a href="#a8"> 四、六级</a></li>
                    <li> <a href="#a8"> 考研</a></li>
                    <li> <a href="#a8">雅思/托福</a></li>
                    <li> <a href="#a8"> 课外书</a></li>
                </ul>
            </li>
            <li class="li1" >
                <a href="#a9"  class="a"> 其他</a>
            </li>
            <li class="my" style="margin-left: 30px">
                <c:if test="${not empty user }">
                    <img src="${pageContext.request.contextPath}/${user.header}" height="53px" width="53px" border="5px"/>
                <ul class="ul1" >
                    <li> <a href="per_home.jsp"> 个人中心</a></li>
                    <li>  <a href="per_home.jsp"> 收藏</a></li>
                    <li>  <a href="per_home.jsp"> 消息</a></li>
                    <c:if test="${not empty user }">
                    <li>  <a href="${pageContext.request.contextPath}/user?method=logout"> 注销</a></li>
                    </c:if>
                </ul>
                </c:if>
                <c:if test="${empty user }">
                    <img src="images/my.png"/>
                </c:if>
             </li>
        </ul>
    </div>

<!--导航栏结束-->


 <!--返回顶部开始-->
  <div style="display: none;" id="rocket-to-top">
        <div style="opacity:0;display: block;" class="level-2"></div>
        <div class="level-3"></div>
    </div>
 <!--返回顶部结束-->


<!--主体开始-->
<div id="main" class="row" >

    <!--lunbotu-->
    <div class="col-9  centerimg">
        <div class="carousel slide" id="carousel-49578">
            <ol class="carousel-indicators">
                <li class="active" data-slide-to="0" data-target="#carousel-49578">
                </li>
                <li data-slide-to="1" data-target="#carousel-49578">
                </li>
                <li data-slide-to="2" data-target="#carousel-49578">
                </li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img alt="" src="images/goods2.jpg" />
                    <div class="carousel-caption">
                        <h4>
                            First Thumbnail label
                        </h4>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="images/goods4.jpg" />
                    <div class="carousel-caption">
                        <h4>
                            Second Thumbnail label
                        </h4>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img alt="" src="images/goods1.jpg" />
                    <div class="carousel-caption">
                        <h4>
                            Third Thumbnail label
                        </h4>
                        <p>
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                        </p>
                    </div>
                </div>
            </div> <a class="left carousel-control" href="#carousel-49578" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-49578" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
    </div>


    <div class="col-3" ><!--侧边栏-->
        <span class="release"> <a href="publish.jsp" >我要发布</a></span>
        <span class="buy"> <a href="collect.jsp" >我要求购</a></span>
        <marquee  align="left" class="fabuxiangqing" behavior="scroll"  direction="up"
                 height="300" width="98%"  loop="-1"  scrolldelay="1" speed="10"
                 onMouseOut="this.start()" onMouseOver="this.stop()" >
        <span id="purchase_show"></span>
        </marquee>
    </div>
</div>
<div id="section">
    <div class="row">

        <div class="col-12"><hr  style="width:20px;border: 1px solid red;"/><h2 style="text-align: center;"><img
                src="images/xinping-left.png"/> 新品推荐
            <img src="images/xinping-right.png"/></h2><hr/></div>
		<!-- 商品详情，由load.js中的jquery ajax填充，商品将会被填充在#page_hot之后-->
        <div>
        <span id="page_hot"></span>
        <a class="art-button" href="${pageContext.request.contextPath}/product?method=findAll">更多商品...</a>
        </div>

        <div class="col-12"><h3 id="a1">校园代步</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <span id="transport"></span>

        <div class="col-12"><h3 id="a3">电脑</h3><hr style="margin-left:0;width:45px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <span id="computer"></span>

        <div class="col-12"><h3 id="a4">数码产品</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <span id="electronics"></span>

        <div class="col-12"><h3 id="a6">运动健身</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <span id="exercise"></span>

        <div class="col-12"><h3 id="a7">日常用品</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <span id="daily"></span>

        <div class="col-12"><h3 id="a8">图书教材</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <span id="books"></span>
        <div class="col-12"><h3 id="a9">其他</h3><hr style="margin-left:0;width:45px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <span id="other"></span>

    </div>
</div>
<div style="height:50px;"></div>

<!--主体结束-->


<!--结尾开始-->
    <div id="footer" style="background:rgba(43,76,126, 0.79);height: 120px;margin-bottom: 0;clear: both;">
        <div class="col-12">
            <p style="color:#fff;text-align: center;">四川省西南石油大学</p>
            <p style="color:#fff;text-align: center;">翼灵物联工作室版权所有</p>
        </div></div>
<!--结尾结束-->



    <!--手机版导航栏-->
    <div class="nav">
        <ul>
            <li><a href="#a1">校园代步</a></li>
            <li><a href="#a2">手机</a></li>
            <li><a href="#a3">电脑</a></li>
            <li><a href="#a4">数码产品</a></li>
            <li><a href="#a5">数码配件</a></li>
            <li><a href="#a6">运动健身</a></li>
            <li><a href="#a7">衣物用品</a></li>
            <li><a href="#a8">图书教材</a></li>
            <li><a href="#a9">其他</a></li>
            <li><a href="personal_homepage.html" >个人中心</a></li>
            <li>未登录</li>
        </ul>
    </div>
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
var login_status = document.getElementById("login_status");




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

    window.onload=function() {

        //影藏电脑版导航栏
        function hideDiv() {
            var browserWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            var div = document.getElementById("nav");
            var nav = document.getElementsByClassName("nav")[0];
            if (browserWidth < 1200) {
                div.style.display = "none";
                nav.style.display = "block";
            } else {
                div.style.display = "block";
                nav.style.display = "none";
            }
        }
        var timer = null;
        window.onresize = function () {
            timer && clearTimeout(timer);
            setTimeout(function () {
                hideDiv();
            }, 200);
        };
        hideDiv();

    };

    var password = document.getElementById("password");
    var repassword=document.getElementById("repassword");

    repassword.onblur=function() {
        if(this.value != password.value) {
            document.getElementById("tishi").innerHTML="<font color='red'>两次密码不同</font>";
            document.getElementById("submit").disabled = true;
        }
        else {
            document.getElementById("tishi").innerHTML="<font color='#fff'>两次密码相同</font>";
            document.getElementById("submit").disabled = false;
        }

    }

</script>
</body>
</html>