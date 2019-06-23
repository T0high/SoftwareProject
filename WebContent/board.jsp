<%@ page language="java"  import="java.util.*,MessageBoard.*,MessageDao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="login_verify.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言板界面</title>
</head>
<body >
<!-- 留言板界面 -->
<div style="margin-left:35%;margin-top:100px;font-family:Microsoft YaHei">
<h1 style="margin-left:5%">这里是留言板主界面</h1>
<form  action="leavemessage.jsp" method="post">
  <table border="1">
  <caption>所有留言信息</caption>
  	<tr><th>留言人姓名</th><th>留言时间</th>
		<th>留言标题</th><th>留言内容</th></tr>
  		<%
  			ArrayList<Messages> al=new ArrayList<Messages>();
  			al= (ArrayList)session.getAttribute("al");
  			if(al!=null){
  				Iterator iter=al.iterator();
  				while(iter.hasNext()){
  					Messages mb=(Messages)iter.next();
  		%>
  				<tr><td><%= new messagedao().getName(mb.getId()) %></td>
  					<td><%= mb.getTime().toString() %></td>
  					<td><%= mb.getTitle() %></td>
  					<td><%= mb.getMessage() %></td></tr>
  		<% 
  			}
  			}
  		 %>
  		</table>
  	</form>
   <a style="margin-left:22%" href="leavemessage.jsp">留言</a>&nbsp&nbsp
   <a href="HomeFile.jsp">点我返回主界面</a>
    </div>
 

</body>
</html>