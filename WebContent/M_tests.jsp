<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 无用，但不能删除 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>真题管理界面</title>
<script  src="js/jquery-1.8.3.js">
</script>
<style type="text/css">
#table{
    width:100%;
    height:100%;
   }
</style>



</head>
<body>
 <%! String table="table_T" ;%>
<table border="1" bgcolor="#ffffff"  cellspacing="1" cellpadding="1" id="table">

<tr>
<td align="center" >序号</td>
<td align="center">上传者姓名</td>
<td align="center" >上传资料名</td>
<td align="center" >更改</td>
<td align="center" >删除</td>
</tr>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/onlytest?characterEncoding=UTF-8";
Connection con=DriverManager.getConnection(url,"root", "7837800hongkun");
Statement stmt=con.createStatement();
String sql="select id,username,testname from tests5";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td  align="center"><%=rs.getObject(1) %></td>
<td  align="center"><%=rs.getObject(2) %></td>
<td  align="center"><%=rs.getObject(3) %></td>
<td  algin="center"><a href="selectServlet?id=<%=rs.getObject(1) %>&table=table_T&id=<%=rs.getObject(1) %>
&username=<%=rs.getObject(2) %>&testname=<%=rs.getObject(3) %>">修改</a></td>
<td  algin="center"><a href="deleteServlet?id=<%=rs.getObject(1) %>&table=table_T" onClick
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