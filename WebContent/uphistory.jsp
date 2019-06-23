<%@ page language="java" import="java.util.*,java.sql.*, java.util.HashMap,
java.util.Map,java.util.Iterator" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ResultSet rs1=(ResultSet)session.getAttribute("rs1");
    %>
<%@ include file="login_verify.jsp"%>
<!-- 上传历史界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>这里是显示上传历史记录界面</title>
</head>
<body>
<center>
<form action="UphistoryDeleteServer">
<table>
<tr>
<td colspan="2" align="center">上传历史</td>
</tr>
<tr>
<td>文本名</td>
<td>操作</td>
</tr>
<%
while(rs1.next()){
%>
<tr>
<td><%=rs1.getString("testname") %></td>
<td><a href="UphistoryDeleteServer?id=<%=rs1.getInt("id")%>" onClick="return confirm('确定要删除吗?')" >删除</a></td>
</tr>

<%
}
%>
</table>
</form>
<a href="HomeFile.jsp">点我返回主界面</a>
</center>
</body>
</html>