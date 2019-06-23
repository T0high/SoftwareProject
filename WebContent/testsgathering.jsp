<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="login_verify.jsp"%>
<!-- 真题下载界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>下载文件显示页</title>
</head>
<body>
  <!-- 遍历Map集合 -->
    <c:forEach var="me" items="${fileNameMap}">
        <c:url value="/DownLoadServer" var="downurl">
            <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
        ${me.value}<a href="${downurl}">下载</a>
        <br/>
    </c:forEach>
 <div align="center">  <a href="${pageContext.request.contextPath}/TestsgatheringServer">上传文件列表</a>
<a href="HomeFile.jsp">点我返回主界面</a>
</div> 
</body>
</html>