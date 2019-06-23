<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 管理员登录报错界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>这里是管理员登录错误界面</title>
</head>
<body>
<h1 align="center">登录错误!</h1>
<%response.setHeader("refresh", "3;URl=managerlogin.jsp"); %>
</body>
</html>