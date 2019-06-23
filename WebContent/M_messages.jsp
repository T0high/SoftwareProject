<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 无用，但不能删除 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>消息管理界面</title>
<style type="text/css">
table{
    width:100%;
    height:100%;
   }
</style>
</head>
<body>
<table border="1" bgcolor="#ffffff" align="center" cellspacing="1" cellpadding="1">

<tr>
<td align="center" >账号</td>
<td align="center" >留言者姓名</td>
<td align="center" >留言时间</td>
<td align="center" >留言标题</td>
<td align="center" >留言信息</td>
<td align="center" >更改</td>
<td align="center" >删除</td>
</tr>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/onlytest?characterEncoding=UTF-8";
Connection con=DriverManager.getConnection(url,"root", "7837800hongkun");
Statement stmt=con.createStatement();
String sql="select * from messages";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td  align="center"><%=rs.getObject(1) %></td>
<td  align="center"><%=rs.getObject(2) %></td>
<td  align="center"><%=rs.getObject(3) %></td>
<td  align="center"><%=rs.getObject(4) %></td>
<td align="center"><%=rs.getObject(5) %></td>
<td algin="center"><a href="javascript:void(0);" onClick
="return confirm('改什么改！没得改！');">修改</a></td>
<td  algin="center" ><a href="deleteServlet?id=<%=rs.getObject(1) %>&table=table_M&name=<%=rs.getObject(2) %>
&time=<%=rs.getObject(3) %>&title=<%=rs.getObject(4) %>&message=<%=rs.getObject(5) %>" onClick
="return confirm('确定要删除吗?');">删除</a></td>
</tr>
<%
}
rs.close();
stmt.close();
con.close();
}catch(Exception e){
e.printStackTrace();
}
%> 
</table>
</body>
</html>