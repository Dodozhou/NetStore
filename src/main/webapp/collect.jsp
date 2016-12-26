<%@ page import="com.star.estore.domain.User" %>
<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="privilege" uri="http://www.itcast.cn/privilege" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <link rel="stylesheet" type="text/css" href="css/i_want_buy.css">
    <script src="js/home_page.js"></script>
    <title>我要求购</title>
</head>
<%
    User u = (User) request.getSession().getAttribute("user");
    if (u == null) {
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
    <div  class="col-12 center header" >
        <div class="col-2">
            <small><a href="page.jsp"> <img src="images/return-homepage.png"/> 返回首页 </a></small>
        </div>
        <div class="col-3">
            <img class="logo-img" src="images/logo.png">
            <div class="logo-text">
                <p  style="font-size: 30px;">校园服务街</p>
                <p>最安全方便的校园服务平台</p>
            </div>
        </div>

        <!--收索框-->
        <div class="col-5 ">
            <div class="search-box">
                <form action="${pageContext.request.contextPath}/product" method="post" id="searchForm">
                    <input type="hidden" name="method" value="findByKey">
                    <input type="search" name="key" placeholder="搜 你 所 想" class="search1"/>
                    <input type="submit" name="search" value=" " class="search2"/>
                </form>
            </div>
        </div>
        <div class="col-2">
            <div class="log-box ">
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
                        <label> 确认密码</label> <input  type="password"  name="repassword" id="repassword" required onkeyup="informed()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="tishi"></span><br/>
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

    <!--主体开始-->
    <div class="askmain">
        <div class="row1">
            <div class="col-12 tit">
                <img src="images/fabu.png"/>
                <span>我要求购</span>
            </div>
        </div>
        <privilege:estore user="${user}"/>
        <div class="row2  content">
            <div class="col-2 blank"></div>
            <div class="col-7 formmain">
                <div class="row3">
                    <div class="col-12 table">

                        <form name="form1" action="${pageContext.request.contextPath}/pur"
                              method="post" >
                            <input type="hidden" name="method" value="add">
                            <div class="col-3 span">
                                <span>商品名称</span>
                            </div>
                            <div class="col-9">
                                <input id="text1" name="name"
                                       onclick="document.getElementById('text1').style.backgroundColor='#fff'"
                                       class="input1" type="text" size="25" placeholder="少于25字" required/>
                            </div>
                            <div id="textarea">
                                <div class="col-3 span">
                                    <span>商品描述</span>
                                </div>
                                <div class="col-9">
                                    <textarea id="text2" name="description"
                                              onclick="document.getElementById('text2').style.backgroundColor='#fff'"
                                              class="input1" rows="5" placeholder="商品用途、新旧程度、原价等信息" required></textarea>
                                </div>
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
                                <span>交易地点</span>
                            </div>
                            <div class="col-9">
                                <input id="text3" name="dealps"
                                       onclick="document.getElementById('text3').style.backgroundColor='#fff'"
                                       class="input1" type="text" size="25" required placeholder="宿舍、教学楼、食堂、快递"/>
                            </div>
                            <div class="col-3 span">
                                <span>期望价格</span>
                            </div>
                            <div class="col-9">
                                <input id="text4" name="price"
                                       onclick="document.getElementById('text4').style.backgroundColor='#fff'"
                                       class="input2" type="text" placeholder="&yen; " required/>
                            </div>
                            <div class="col-3 span">
                                <span>联系方式</span>
                            </div>
                            <div class="col-9 tishi">
                                <span >（至少选择一项）</span>
                            </div>
                            <div class="col-3 span">
                                <span>QQ</span>
                            </div>
                            <div class="col-9">
                                <span><%=u.getQQ()%></span>
                                <input type="hidden" name="QQ" value="<%=u.getQQ()%>">
                            </div>
                            <div class="col-3 span">
                                <span>手机号</span>
                            </div>
                            <div class="col-9">
                                <span><%=u.getPhone()%></span>
                                <input type="hidden" name="phone" value="<%=u.getPhone()%>">
                            </div>
                            <div class="submit">
                                <button type="submit">提交</button>
                            </div>
                        </form>


                    </div>
                </div>
            </div>
            <div class="col-3">

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

    to_login.onclick = function () {
        log_box.style.display = "block";
        mask.style.display = "block";
    };
    close.onclick = function () {
        log_box.style.display = "none";
        mask.style.display = "none";
    };
    to_register.onclick = function () {
        register_box.style.display = "block";
        mask1.style.display = "block";
    };
    close1.onclick = function () {
        register_box.style.display = "none";
        mask1.style.display = "none";
    };
    function register() {
        log_box.style.display = "none";
        mask.style.display = "none";
        register_box.style.display = "block";
        mask1.style.display = "block";

    }
    function login() {
        register_box.style.display = "none";
        mask1.style.display = "none";
        log_box.style.display = "block";
        mask.style.display = "block";
    }

    $(function () {
        /* 设置和说明：
         =====================================================
         // 效果展现 （以下为默认值）
         ubEffect:'left',						// 效果呈现方式 'left' 'top' 'fade' 'leftSeamless' 'topSeamless'
         ubAutoPlay:'on',					// 是否自动播放
         ubAutoBtn:'on',						// 小按钮是否自动生成（便于做成缩略图形式）
         */
        $(".demoG").ublue_ImageCarousel({
            ubAutoPlay: "off", 			// 关闭自动播放
            ubEffect: "fade", 			// 图片切换方式为渐变（淡入淡出）
            ubAutoBtn: "off" 			// 小按钮不自动生成（手工做成缩略图形式）
        });
    });
    //input点击
    //    function inputclick(){
    //        var arr=document.getElementsByTagName('input');
    //        for(i=0;i<5;i++){
    //            arr[i].style.backgroundColor='#fff';
    //        }
    //    }
</script>
</body>
</html>