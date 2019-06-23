<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 登录验证 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录验证</title>
</head>
<body>
<%
  
  if(session.getAttribute("user")==null)
  {%>
  <h1>未登录！</h1>
        3秒后跳转到登录页面
        <p>
        如果没有跳转，请点<a href="login.jsp">这里</a></p>
    <%
        response.setHeader("refresh","3;URL=login.jsp");
        return;
   }
   %>
</body>
</html>