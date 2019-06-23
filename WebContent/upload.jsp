<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="login_verify.jsp"%>
    <!-- 上传界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>上传界面</title>

</head>
<body>
<form action="UpServer" enctype="multipart/form-data" method="post" >
<table align="center" border="1" >
<tr align="center">
<td colspan="2">文件上传</td>
</tr>
<tr>
<td colspan="2"><input  type="file" name="uploadfile" accept=".doc,.docx"/></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="提交"  ></td>
</tr>
</table>
</form>
<div align="center"><a href="HomeFile.jsp">点我返回主界面</a></div>
</body>
</html>