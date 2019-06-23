<%@ page language="java" import="user.user" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="login_verify.jsp"%>
    <%user user=(user) session.getAttribute("user"); %>
    <!-- 无用，但不能删除 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息页面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
   
table{
    
    border-sapcing:10px 30px;
}
    </style>
   

</head>
<body>



<nav class="navbar navbar-default" role="navigation"> 
    <div class="container-fluid"> 
        <div class="navbar-header"> 
            <a class="navbar-brand" href="javascript:void(0);" style=" color:#666; font-size:24px;">个人信息</a> 
        </div> 
        <ul class="nav navbar-nav navbar-right"> 
            <li><a href="HomeFile.jsp"><span class="glyphicon glyphicon-user"></span> 首页</a></li> 
            <li><a href="ExitServlet"><span class="glyphicon glyphicon-log-in"></span> 退出 </a></li> 
        </ul> 
    </div> 
</nav>

<form action="MeServer" method="post">
<table width="30%" border="0" >
<tr>
   <td>账号:</td>
   <td><input type="text" class="form-control" id="id" name="id"
				value="<%=user.getId() %>"   ></td>
</tr>
<tr>
   <td>姓名:</td>
   <td><input type="text" class="form-control" id="username" name="username"  
				 value="<%=user.getName() %>"  ></td>
</tr>
<tr>
    <td>密码:</td>
    <td><input type="text" class="form-control" id="password" name="password" 
				  value="<%=user.getPassword() %>" ></td>
</tr>
<tr>
   <td align="center"><input type="submit" value="修改"></td>
   
</tr>
</table>
</form>
</body>
</html>