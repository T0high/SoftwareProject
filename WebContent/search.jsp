<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 无用 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>这里是搜索界面</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/SearchServer">查询结果</a>
<form action="SearchServer" method="post">
<table>
<tr>
<td colspan="2" align="center">搜索框</td>
</tr>
<tr>
<td><input type="text" name="searchmessage"></td>
<td><input type="submit" value="🔍"></td>
</tr>
</table>
</form>
</body>
</html>