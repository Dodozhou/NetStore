<%@ page import="com.star.estore.domain.Product" %>
<%@ page import="com.star.estore.domain.User" %>
<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <link rel="stylesheet" type="text/css" href="css/goods_details.css">
    <title>商品详情</title>
</head>

<%
    Product p=(Product)request.getAttribute("p");
    User u=(User)request.getAttribute("owner");

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
<div id="goodsmain">
    <div class="col-12">
        <div id="seller">
            <table id="table1">
                <tr>
                    <td id="td1" onmouseover="document.getElementById('hidden').style.display='block';document.getElementById('hidden').style.position='absolute';document.getElementById('hidden').style.zIndex=1;">
                        <!--onmouseout="document.getElementById('hidden').style.display='none';">-->
                        <img id="img1"  src="images/personal.jpg"/>
                        <div id="personalword">
                            <span><%=u.getNickname()%></span><br/>
                            <div id="vi">
                                <img  id="img2" src="images/level.png"/>
                                <!--<p id="levelp"><span>V</span><sub>1</sub>会员</p>-->
                                <img  id="img3" src="images/Vi.png"/>
                            </div>
                        </div>

                    </td>
                    <td id="td2" >
                        <span style="color:#606060;">最近编辑</span><br/>
                        <span style="color: #333333"><%=p.getUpdate_time()%></span>
                    </td>
                    <td id="td3">
                        <a href="#">举报该宝贝</a>
                    </td>
                </tr>
            </table>
            <div id="hidden" onmousemove="document.getElementById('hidden').style.display='block'" onmouseout="document.getElementById('hidden').style.display='none';">
                <ul>
                    <li>西南石油大学</li>
                    <li>女</li>
                    <li>注册时间：<%=u.getUpdatetime()%></li>
                    <li>转卖1笔，0人评价</li>
                    <li>靠谱度：10分</li>
                    <li>性价比：10分</li>
                    <li><a href="#">查看卖家信息</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--商品详情-->
    <div id="goodsdetail">
        <div class="focusMain isFocus demoG col-7">
            <!--<a class="focusBtn focusPrev" href="javascript:;"></a>-->
            <!--<a class="focusBtn focusNext" href="javascript:;"></a>-->
            <div class="focusArea">
                <div class="focusCon">
                    <div class="focusItem">
                        <a href="#"><img src="${pageContext.request.contextPath}<%=p.getImgurl_s()%>" alt="" /></a>
                    </div>
                    <div class="focusItem">
                        <a href="#"><img src="images/goods2.jpg" alt="" /></a>
                    </div>
                    <div class="focusItem">
                        <a href="#"><img src="images/goods3.jpg" alt="" /></a>
                    </div>
                    <div class="focusItem">
                        <a href="#"><img src="images/goods4.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="focusIndicators">
                <a href="javascript:;"><img src="${pageContext.request.contextPath}<%=p.getImgurl_s()%>" alt="" /></a>
                <a href="javascript:;"><img src="images/goods2.jpg" alt="" /></a>
                <a href="javascript:;"><img src="images/goods3.jpg" alt="" /></a>
                <a href="javascript:;"><img src="images/goods4.jpg" alt="" /></a>
            </div>
        </div>
        <div class="goodsname col-5">
            <div class="dellist">
                <ul class="detailul">
                    <li id="li1"><%=p.getName()%></li>
                    <li id="li2">转卖价：&yen; <%=p.getPrice()%>元</li>
                    <!--<li id="hr"><hr/></li>-->
                    <li>卖家：<%=u.getNickname()%></li>
                    <li>认证状态：西南石油大学计科院15级（学号认证）</li>
                    <li>QQ：<%=p.getQQ()%></li>
                    <li>发布时间：<%=p.getUpdate_time()%></li>
                </ul>
                <form action="" method="get">
                    <span>交易方式：</span>
                    <lable><input name="style" type="radio" value="inline"/>在线交易</lable>
                    <lable><input name="style" type="radio" value="outline"/>线下交易</lable>
                </form><br/>
                <div style="height: 30px;"></div>
                <button id="btn1">立即购买</button>
                <div style="height: 70px;"></div>
                <img id="like"  onclick="document.getElementById('like').src='images/collect.png'" src="images/like.png"/>
                <span>分享到：</span>
                <a href="#"><img class="shatu"  src="images/kj.png"/></a>
                <a href="#"><img class="shatu"  src="images/wx.png"/></a>
                <a href="#"><img class="shatu" src="images/qq.png"/></a>
            </div>
        </div>
        <div id="tab" class="col-7">
            <div id="navlist">
                <ul>
                    <li class="select" onclick="liclick1()">
                        宝贝介绍
                    </li>
                    <li id="tab2" onclick="liclick2()">
                        留言
                    </li>
                    <li  id="tab3" onclick="liclick3()">
                        安全保障
                    </li>
                </ul>
            </div>
            <div id="content">
                <div class="con" id="con1">
                    <span>宝贝介绍</span>
                    <p><%=p.getDescription()%></p></div>
                <div class="con" id="con2">
                    <span>留言</span>
                    <img id="img" src="images/liuyan.png"/>
                </div>
                <div class="con" id="con3">
                    <span>安全保障</span>
                </div>
            </div>
        </div>
        <div class="col-5 other ">
                <div id="ogoods">
                    <span id="span1">卖家的其它闲置商品（11）</span>
                    <span id="span2"><a href="#">more&raquo;</a></span>
                </div>
                <div class="ogoods">
                    <a href="#"><img src="images/g1.jpg"/></a><br/>
                    <a href="#"><span>迪士尼M7009纪念版!</span></a>
                </div>
                <div class="ogoods">
                    <a href="#"><img src="images/g2.jpg"/></a><br/>
                    <a href="#"><span>迪士尼M7009纪念版!</span></a>
                </div>
                <div class="ogoods">
                    <a href="#"><img src="images/g3.jpg"/></a><br/>
                    <a href="#"><span>迪士尼M7009纪念版!</span></a>
                </div>
                <div class="ogoods">
                    <a href="#"><img src="images/g4.jpg"/></a><br/>
                    <a href="#"><span>迪士尼M7009纪念版!</span></a>
                </div>
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
<script src="http://file.bluesdream.com/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/img_carousel.js"></script>
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

    $(function() {
        /* 设置和说明：
         =====================================================
         // 效果展现 （以下为默认值）
         ubEffect:'left',						// 效果呈现方式 'left' 'top' 'fade' 'leftSeamless' 'topSeamless'
         ubAutoPlay:'on',					// 是否自动播放
         ubAutoBtn:'on',						// 小按钮是否自动生成（便于做成缩略图形式）
         */
        $(".demoG").ublue_ImageCarousel({
            ubAutoPlay:"off", 			// 关闭自动播放
            ubEffect:"fade", 			// 图片切换方式为渐变（淡入淡出）
            ubAutoBtn:"off" 			// 小按钮不自动生成（手工做成缩略图形式）
        });
    });
    //选项卡
    function  liclick1() {
        var con1=document.getElementById('con1');
        var con2=document.getElementById('con2');
        var con3=document.getElementById('con3');
        con1.style.display='block';
        con3.style.display='none';
        con2.style.display='none';
    }
    function  liclick2() {
        var con1=document.getElementById('con1');
        var con2=document.getElementById('con2');
        var con3=document.getElementById('con3');
        con1.style.display='none';
        con3.style.display='none';
        con2.style.display='block';
    }
    function  liclick3() {
        var con1=document.getElementById('con1');
        var con2=document.getElementById('con2');
        var con3=document.getElementById('con3');
        con1.style.display='none';
        con2.style.display='none';
        con3.style.display='block';
    }
</script>
</body>
</html>