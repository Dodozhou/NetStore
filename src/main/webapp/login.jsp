
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<div style="text-align: center">
    <%--使用el表达式更加简单--%>
    <h1>恭喜你,${user.nickname},登录成功！</h1>
    </br>
    </br>
    </br>
    <h1><a href="user?method=logout">注销</a></h1>
</div>
</body>
</html>
