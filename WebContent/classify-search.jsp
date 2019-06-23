<%@ page language="java" import="java.sql.*,java.util.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ResultSet rst=(ResultSet)session.getAttribute("rst"); 
    %>
    <!-- 分类功能查询结果界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分类搜索结果界面</title>
</head>
<body>

<center>
<%=rst.isClosed() %>
   
<table>
<tr>
<td colspan="2" align="center">查询信息</td>
</tr>
<tr>
<td>文本名</td>
<td>操作</td>
</tr>
<%
rst.beforeFirst();
while(rst.next()){
%>
<tr>
<td><%=rst.getString("testname") %></td>
<td><a href="file://localhost//<%=rst.getString("testpath") %>"target="_blank">下载</a></td>

</tr>

<%
}
%>
</table>

<a href="HomeFile.jsp">点我返回主界面</a>
</center>
</body>
</html>