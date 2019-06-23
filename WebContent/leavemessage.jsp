<%@ page language="java" import="java.util.*,MessageBoard.*,MessageDao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="login_verify.jsp"%>
    <!-- 留言界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言界面</title>
</head>
<body  style="font-family:Microsoft YaHei">
  <div style="text-align:center;margin-top:1px" >
    <h1 >请留言</h1>
   <form action="LeaveMessageServer" method="post" ectype="application/x-www-form-urlencoded" >
  			<table align="center" border="1">
  			<caption>填写留言信息</caption>
  		    	<tr><td>留言标题</td>
  				<td><input type="text" name="title"/></td></tr>
  			<tr><td>留言内容</td>
  				<td><textarea  name="message" rows="10" cols="35"></textarea></td>
			</tr>
  			</table>
  		<input type="submit" value="提交"/>
  		<input type="reset" value="重置"/>
  	</form>
    <a href="board.jsp">返回留言板界面</a>&nbsp&nbsp
    <a href="HomeFile.jsp">点我返回主界面</a>
    <!-- 留言板的数据没有与留言及时同步 -->
    </div>
  </body>
</html>