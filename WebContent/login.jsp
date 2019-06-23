<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 登录界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
  background-image:url(./images/dai.gif);
}
</style>
</head>
<body>

<center>
<h1 align="center">欢迎来到用户登录界面!</h1>
<form action="LoginServer" method="get">
<table border="1px" align="center">
<tr>
<td>账号:</td>
<td><input type="text" name="id"></td>
</tr>

<tr>
<td>密码:</td>
<td><input type="password" name="password"></td>
</tr>

<tr>
<td colspan="2" align="center"><input type="submit" value="登录" ></td>
</tr>
</table>
</form>
<a href="HomeFile.jsp">点我返回主界面</a>
<a href="login_select.jsp">点我返回选择界面</a>
</center>

</body>
</html>