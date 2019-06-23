<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 无用，但不能删除 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>这里是用户信息界面</title>
<title>Insert title here</title>
<script type="text/javascript">
function modifyStu(){
	var isMod=confirm("确定要修改该学生信息吗?");
	if(!isMod)
	return false;
	}
	function deleteStu(){
	var isDel=confirm("确定要删除该学生的信息吗?");
	if(!isDel)
	return false;
	}
</script>
<style type="text/css">
table{
    width:100%;
    height:100%;
   }
</style>
</head>
<body>
<table border="1" bgcolor="#ffffff" align="center" cellspacing="1" cellpadding="1">
<!--  <caption>用户管理系统</caption>-->
<tr>
<td align="center" >账号</td>
<td align="center" >姓名</td>
<td align="center" >密码</td>
<td align="center" >更改</td>
<td align="center" >删除</td>
</tr>

<%
try{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/onlytest?characterEncoding=UTF-8";
Connection con=DriverManager.getConnection(url,"root", "7837800hongkun");
Statement stmt=con.createStatement();
String sql="select * from user";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td  align="center"><%=rs.getObject(1) %></td>
<td align="center"><%=rs.getObject(2) %></td>
<td  align="center"><%=rs.getObject(3) %></td>
<td  algin="center" ><a href="selectServlet?id=<%=rs.getObject(1) %>&table=table_UM
&name=<%=rs.getObject(2) %>&password=<%=rs.getObject(3) %>">修改</a></td>
<td  algin="center" ><a href="deleteServlet?id=<%=rs.getObject(1) %>&table=table_UM
&name=<%=rs.getObject(2) %>&password=<%=rs.getObject(3) %>" onClick
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