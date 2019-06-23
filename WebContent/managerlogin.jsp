<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 管理员登录界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录界面</title>

</head>
<body>
<center>
<form action="ManagerLoginServer" method="post">
<table border="1px" align="center">
<tr>
<td colspan="2" align="center"> 请输入信息</td>
</tr>

<tr>
<td>用户名:</td>
<td><input type="text" name="managername"></td>
</tr>

<tr>
<td>密码:</td>
<td><input type="password" name="password"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="登录"></td>
</tr>

</table>

</form>
<a href="HomeFile.jsp">点我返回主界面</a>
</center>
</body>
</html>