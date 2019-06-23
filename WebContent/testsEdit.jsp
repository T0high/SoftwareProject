<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
    ResultSet rs=(ResultSet)session.getAttribute("rs");
    %>
    <!-- 编译真题信息界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改信息</title>
</head>
<body>


<form action="editServlet" method="post">
<center>
<table border="1" align="center">
<tr>
<td colspan="3" align="center">真题信息</td>
</tr>
<tr style="display:none"><td style="display:none"><input type="text" name="type" value="table_t" style="display:none"></td></tr>

<tr>
<td>id</td>
<td>username</td>
<td>testname</td>
</tr>

<%
if(rs!=null){
	rs.first();
%>
<tr>
<td><input type="number" max="999999" name="id" value="<%=rs.getInt("id")%>" readonly="readonly"></td>
<td><input type="text" name="username" value="<%=rs.getString("username") %>"></td>
<td><input type="text" name="testname" value="<%=rs.getString("testname") %>"></td>
</tr>

<%
}
%>

<tr>
<td colspan="3" align="center"><input type="submit" value="修改"></td>
</tr>

</table>
</center>
</form>
</body>
</html>