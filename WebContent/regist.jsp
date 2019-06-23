<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 注册界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>这里是注册界面</title>
</head>
<body>
<center>
<h1 align="center">欢迎注册</h1>

<form action="RegistServer" method="get" >
<table border="1px" align="center">
<tr>
<td colspan="2" align="center">请输入你的信息！</td>
</tr>

<tr>
<td>用户名:</td>
<td><input type="text" name="name"></td>
</tr>

<tr>
<td>账号:</td>
<td><input type="text" name="id"></td>
</tr>

<tr>
<td>密码:</td>
<td><input type="password" name="password"></td>
</tr>

<tr>
<td colspan="2" align="center"><input type="submit" value="注册"></td>
</tr>
</table>
</form>
<a href="HomeFile.jsp">点我返回主界面</a>
</center>
</body>
</html>