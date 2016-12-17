function change() {
    document.getElementById("im").src = "/BookStore/checkcode?time"
        + new Date().getTime();
}

function checkForm() {

    //先得到所有的span,将其内容清空。
    var spans=document.getElementsByTagName("span");

    for(var i=0;i<spans.length;i++){
        spans[i].innerHTML="";
    }

    //验证用户名
    var flag1=checkNull("username");
    //验证密码
    var flag2=checkNull("password");

    //验证确认密码
    var flag3=checkNull("repassword");

    var flag4=checkNull("nickname");
    var flag5=checkNull("email");
    var flag6=checkNull("checkcode");


    //对确认密码进行操作
    var flag7=repasswordValidate();

    return flag1&&flag2&&flag3&&flag4&&flag5&&flag6&&flag7;
};

function repasswordValidate(){

    var value1=document.getElementById("password").value;
    var value2=document.getElementById("repassword").value;

    if(value1==value2){
        return true;
    }else{
        document.getElementById("repassword_span").innerHTML="两次密码不一致";
        return false;
    }
}

//非空操作
function checkNull(field){
    var reg = /^\s*$/; //代表0个或多个空白符

    var value = document.getElementById(field).value;

    if (reg.test(value)) {
        document.getElementById(field+"_span").innerHTML=(field+"不能为空");
        return false;
    }

    return true;
}



