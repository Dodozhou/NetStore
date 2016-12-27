var to_login = document.getElementsByClassName("to_login")[0];
var mask = document.getElementsByClassName("mask")[0];
var mask1 = document.getElementsByClassName("mask")[1];
var to_register = document.getElementsByClassName("to_register")[0];
var close = document.getElementsByClassName("close")[0];
var close1 = document.getElementsByClassName("close")[1];
var log_box = document.getElementsByClassName("log_box")[0];
var register_box = document.getElementsByClassName("register_box")[0];

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

window.onload=function() {
    //让导航栏的子菜单隐藏
    var ul1 = document.getElementsByClassName("ul1");
    for (i = 0; i < 9; i++) {
        ul1[i].style.display = "none";
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
}
