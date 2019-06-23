<%@ page language="java" import="java.util.*,java.sql.*,java.io.File,java.io.FileInputStream,java.io.OutputStream,java.io.IOException" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ResultSet rs=(ResultSet)session.getAttribute("rs");
    %>
    <!-- 搜索结果界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>这里是搜索结果界面</title>
</head>
<body>

<center>
<table>
<tr>
<td colspan="2" align="center">查询信息</td>
</tr>
<tr>
<td>文本名</td>
<td>操作</td>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><%=rs.getString("testname") %></td>
<td><a href="file://localhost//<%=rs.getString("testpath") %>"target="_blank">下载</a></td>

</tr>

<%
}
%>
</table>
<a href="HomeFile.jsp">点我返回主界面</a>
</center>

</body>
</html>