<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--Responsive layout：响应式布局-->
    <link rel="stylesheet" type="text/css" href="css/normal.css">
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/sucaijiayuan.js"></script>
    <script src="js/load.js"></script>
    <script src="js/1.js"></script>
    <title>校园二手街</title>
</head>

<body style=" background: -webkit-linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) no-repeat;
background: -o-linear-gradient(left, rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) ;
background: -moz-linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5)) no-repeat;
background: linear-gradient(left,rgba(218, 239, 247,.5), rgba(228, 225, 247,.5))">

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
        <li><a href="#" >个人中心</a></li>
    </ul>
</div>

<!--所有内容-->
<div style="max-width: 1400px;margin: 0 auto;">


<!--头部开始-->
<div id="header"  class="col-12 center ">
<div class="col-1">
    <!--<img style="max-width: 100%;" src="photo/logo.png">-->
</div>
    <div class="col-3   col-4-n">
        <img style="max-width:120px;display: inline;" src="photo/logo.png">
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
        <div class="log-box"><span class="to_login">登录</span> <span class="to_register">注册</span></div>
        <c:if test="${empty user }">
            <li>用户未登录</li>
        </c:if>

        <c:if test="${not empty user }">
            <li>当前用户:${user.username}</li>
            <li><a
                    href='${pageContext.request.contextPath}/user?method=logout'>注销</a>
            </li>
        </c:if>
    </div>
    <div class="a登录注册框">
        <!--登录开始-->
        <div class="mask"></div>
        <div class="log_box">
            <span class="close"><img src="photo/close.png"/></span>
            <div class="log-main">
                <form  method="post" id="loginForm" action="${pageContext.request.contextPath}/user">
                <input type="hidden" name="method" value="login">
                    <label> 用户</label><input  type="text" name="username" id="uername"   autofocus REQUIRED/>
                    <label>密码</label><input  type="password" name="password" id="psw"   required/><br/>
                    <input type="checkbox" name="remember"  value="on" class="autologin"/><span>记住用户</span>
                    <input type="checkbox" name="autologin" value="on" class="autologin"/><span>自动登录</span><br />
                    <input type="submit" name="loginbtn"
                           class="go_log" value="登   录" ><br/>
                    <label> <a  href="#registerForm">去注册</a></label>
                </form>
            </div>
        </div>
        <!--登录结束-->

        <!--注册开始-->
        <div class="mask"></div>
        <div class="register_box">
            <span class="close"><img src="photo/close.png"/></span>
            <div class="register-main">
                <form id="registerForm" method="post" action="${pageContext.request.contextPath }/user">
                    <input type="hidden" name="method" value="regist">
                    <label>用户名</label><input  type="text" name="username"  id="username"  required /><br/>
                    <label>密码</label><input  type="password" name="password"  id="password" required  /><br/>
                    <label> 确认密码</label> <input  type="password"  name="repassword" id="repassword" required onkeyup="informed()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="tishi"></span><br/>
                    <label>昵称</label><input  type="text"  name="nickname" id="nickname"   required/><br/>
                    <label> 邮箱</label> <input  type="email" name="email" id="email" required  title="email的格式是xxx@xxx.xx"/><br/>
                    <label>验证码</label><input  type="text" name="checkcode" id="code" class="ckeckcode" required/>
                     <img src='${pageContext.request.contextPath }/checkcode' id="im"
                    onclick="change();"><span id="checkcode_span"><a
                    href="javascript:void(0)" onclick="change();"><font
                    color='black'>看不清，换一张</font>
					</a>
				</span>
                    <input type="submit" id="submit"  class="register" value=" 注   册 " >
                    <input type="reset"  class="register" value=" 取   消 "><br/><br/>
                    <label> <a href="#loginForm">去登录</a></label><br/>
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
        <ul>
            <li   class="li1"
                  onmousemove="document.getElementsByClassName('ul1')[0].style.display ='block';"
                  onmouseout="document.getElementsByClassName('ul1')[0].style.display ='none';">
                <a href="#a1"  class="a">校园代步</a><span class="span1">|</span>
                <ul  class="ul1">
                    <li><a href="#a1" >电动车</a></li>
                    <li><a href="#a1" >自行车</a></li>
                </ul>
            </li>
            <li class="li1"
                onmousemove="document.getElementsByClassName('ul1')[1].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[1].style.display ='none';">
                <a href="#a2"  class="a">手机</a><span class="span1">|</span>
                <ul class="ul1">
                    <li> <a href="#a2">各种</a></li>
                </ul>
            </li>
            <li class="li1"
                onmousemove="document.getElementsByClassName('ul1')[2].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[2].style.display ='none';">
                <a href="#a3"  class="a"> &nbsp;电脑  &nbsp;</a><span class="span1">|</span>
                <ul class="ul1">
                    <li><a href="#a3">笔记本</a></li>
                    <li><a href="#a3">台式机</a></li>
                </ul>
            </li>
            <li class="li1"
                onmousemove="document.getElementsByClassName('ul1')[3].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[3].style.display ='none';">
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
            <li class="li1"
                onmousemove="document.getElementsByClassName('ul1')[4].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[4].style.display ='none';">
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
            <li class="li1"
                onmousemove="document.getElementsByClassName('ul1')[5].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[5].style.display ='none';">
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
            <li class="li1"
                onmousemove="document.getElementsByClassName('ul1')[6].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[6].style.display ='none';">
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
            <li class="li1"
                onmousemove="document.getElementsByClassName('ul1')[7].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[7].style.display ='none';">
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
            <li class="my" onmousemove="document.getElementsByClassName('ul1')[8].style.display ='block';"
                onmouseout="document.getElementsByClassName('ul1')[8].style.display ='none';">
                <img src="photo/my.png"/>
                <ul class="ul1" >
                    <li> <a href=""> 个人中心</a></li>
                    <li> <a href=""> 收藏</a></li>
                    <li> <a href=""> 消息</a></li>
                </ul>
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

    <div class="col-9" > <!--轮播图-->
       <!-- <div class="container">
            <div class="row clearfix">
                <div class="col-8 column">
                    <div class="carousel slide" id="carousel-895822">
                        <ol class="carousel-indicators">
                            <li class="active" data-slide-to="0" data-target="#carousel-895822">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-895822">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-895822">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="" src="photo/tu/1.jpg" />

                            </div>
                            <div class="item">
                                <img alt="" src="photo/tu/2.jpg" />

                            </div>
                            <div class="item">
                                <img alt="" src="photo/tu/3.jpg" />

                            </div>
                        </div> <a class="left carousel-control" href="#carousel-895822" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-895822" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>
            </div>
        </div>-->
        <div class="centerimg">
        <img src="photo/tu/1.jpg" /></div>
    </div>

    <div class="col-3" ><!--侧边栏-->
        <span class="release"> <a href="${pageContext.request.contextPath}/addProduct.jsp" >我要发布</a></span>
        <span class="buy"> <a href="#" >我要求购</a></span>
        <marquee align="left" behavior="scroll" bgcolor="rgba(43,76,126,0.4)" direction="up"
                 height="300" width="98%"  loop="-1"  scrolldelay="1" speed="10"
                 onMouseOut="this.start()" onMouseOver="this.stop()">
            <p><a href="#" >设定活动字幕的滚动方向direction="up"：向上</a></p>
            <p><a href="#" >设定活动字幕的滚动方向direction="up"：向上</a></p>
            <p><a href="#" >设定活动字幕的滚动方向direction="up"：向上</a></p>
            <p><a href="#" >设定活动字幕的滚动方向direction="up"：向上</a></p>
            <p><a href="#" >设定活动字幕的滚动方向direction="up"：向上</a></p>
            <p><a href="#" >设定活动字幕的滚动方向direction="up"：向上</a></p>
        </marquee>
    </div>
</div>
    <script type="text/javascript" src="mutilpleFlash.js"></script>
<div id="section">
    <div class="row">
        <div class="col-12"><hr  style="width:20px;border: 1px solid red;"/><h2 style="text-align: center;">新品推荐</h2><hr /></div>
        <div>
        <span id="page_hot"></span>
        <a class="art-button" href="${pageContext.request.contextPath}/product?method=findAll">更多商品...</a>
        </div>
        <div class="col-12"><h3 id="a1">校园代步</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a2">手机</h3><hr style="margin-left:0;width:45px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a3">电脑</h3><hr style="margin-left:0;width:45px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a4">数码产品</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a5">数码配件</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a6">运动健身</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a7">衣物用品</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a8">图书教材</h3><hr style="margin-left:0;width:100px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>

        <div class="col-12"><h3 id="a9">其他</h3><hr style="margin-left:0;width:45px;margin-top:0px;border:1px solid rgb(245, 119, 46);" /></div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
        <div class="col-6 ">
            <div class="shangpin1" ><img src="photo/tu/1.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/4.jpg"/></div>
        </div>
        <div class="col-6">
            <div class="shangpin1" ><img src="photo/tu/2.jpg"/></div>
            <div class="shangpin1"><img src="photo/tu/3.jpg"/></div>
        </div>
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

    window.onload=function() {
        //让导航栏的子菜单隐藏
        var ul1 = document.getElementsByClassName("ul1");
        for (i = 0; i < 9; i++) {
            ul1[i].style.display = 'none';
        }

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

</script>
</body>
</html>