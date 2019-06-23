<%@ page language="java" import="java.util.*,java.sql.*,java.sql.ResultSet" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 管理员管理留言信息界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./bootstrapcss/bootstrap.min.css">
<link rel="stylesheet" href="./bootstrapcss/bootstrap-table.min.css">
<link rel="stylesheet" href="./bootstrapcss/bootstrap.css">
<link rel="stylesheet" href="./bootstrapcss/bootstrap-table.css">
<script type="text/javascript" src="./bootstrapjs/bootstrap.js"></script>
<script type="text/javascript" src="./bootstrapjs/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/jquery-1.js"></script>
<script type="text/javascript" src="./bootstrapjs/bootstrap-table.js"></script>
<script type="text/javascript" src="./bootstrapjs/bootstrap-table.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#table2").bootstrapTable({
		columns:[{
			field:'id',
			title:'账号'
		},{
			field:'leaveM-name',
			title:'姓名'
		},{
			field:'leaveT',
			title:'留言时间'
		},{
			field:'leaveTt',
			title:'留言标题'
		},{
			field:'leavaM',
			title:'留言信息'
		},{
			field:'update',
			title:'更改'
		},{
			field:'delete',
			title:'删除'
		},]
	})
})
</script>
<style type="text/css">
table{
    width:100%;
    height:60%;
   }
</style>
</head>
<body>


<table border="1" bgcolor="#ffffff"  cellspacing="1" cellpadding="1" id="table2" data-pagination="true"
 data-side-pagination="client" data-page-size="2" >



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