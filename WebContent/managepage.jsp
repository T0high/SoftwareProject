<%@ page language="java" import="java.util.*,java.sql.*,java.sql.ResultSet" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%ResultSet rs=(ResultSet) session.getAttribute("rs"); %>
  <!-- 管理员界面 -->
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

<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
 
 #first{
    width:1000px;
    height:100px;
    border:solid 1px black;
  }
  #second{
     width:120px;
     height:400px;
     border:solid 1px black;
     float:left;
  }
  #thrid{
     width:870px;
     height:400px;
     float:right;
     
  }
  #middle{
     width:1000px;
     height:400px;
     border:solid 1px black;
  }
  #ford{
     width:1000px;
     height:100px;
     border:solid 1px black;
  }
  #form1{
      display:none;
  }
</style>
<!-- 仅使用jQurey加载数据无法形成数据同步，随着就写了Ajax技术，问题解决了，但弄不明了（中间有bootstrap与bootstraptable插件） -->
<script src="./js/jquery-1.js">
</script>
 <script>
$(document).ready(function(){
	  $("#btn1").click(function(){
	    $("#thrid").load("bootstrap-M_usermessages.jsp");
	  });
	});

$(document).ready(function(){
	  $("#btn2").click(function(){
	    $("#thrid").load("bootstrap-M_messages.jsp");
	  });
	});
	
$(document).ready(function(){
	  $("#btn3").click(function(){
	    $("#thrid").load("bootstrap-M_tests.jsp");
	  });
	});
	
	

</script> 

<script type="text/javascript">
 function loadXMLDoc1(){
	 var xmlhttp;
	 if(window.XMLHttpRequest){
		 xmlhttp=new XMLHttpRequest();
	 }else{
		 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	 }
	 xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    document.getElementById("thrid").innerHTML=xmlhttp.responseText;
	    }
	  }
	 xmlhttp.open("POST","bootstrap-M_usermessages.jsp",true);
	 xmlhttp.send();

 }
 
 function loadXMLDoc2(){
	 var xmlhttp;
	 if(window.XMLHttpRequest){
		 xmlhttp=new XMLHttpRequest();
	 }else{
		 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	 }
	 xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    document.getElementById("thrid").innerHTML=xmlhttp.responseText;
	    }
	  }
	 xmlhttp.open("POST","bootstrap-M_messages.jsp",true);
	 xmlhttp.send();

 }
 
 function loadXMLDoc3(){
	 var xmlhttp;
	 if(window.XMLHttpRequest){
		 xmlhttp=new XMLHttpRequest();
	 }else{
		 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	 }
	 xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    document.getElementById("thrid").innerHTML=xmlhttp.responseText;
	    }
	  }
	 xmlhttp.open("POST","bootstrap-M_tests.jsp",true);
	 xmlhttp.send();

 }
 
 
 
</script>
</head>
<body>

<div id="first">

<center><h1>欢迎管理员<%--=rs.getString("managername") --%>登录!</h1></center>




<div style="float:left">只有真题系统</div>
<div style="float:right">


<a href="HomeFile.jsp" >首页</a>
</div>
</div>

<div id="middle">
<div id="second">
<button value="用户信息" style="height:60px;width:100px;margin:50px 10px 30px 10px;" id="btn1" onclick="loadXMLDoc1()">用户信息</button>
<!--  <input type="button" value="用户信息" style="height:60px;width:100px;margin:50px 10px 30px 10px;" >-->
<!--<input type="button" value="留言信息" style="height:60px;width:100px;margin:30px 10px 30px 10px;">-->
<!--<input type="button" value="真题信息" style="height:60px;width:100px;margin:30px 10px 30px 10px;">-->
<button value="留言信息" style="height:60px;width:100px;margin:30px 10px 30px 10px;" id="btn2" onclick="loadXMLDoc2()">留言信息</button>
<button value="真题信息" style="height:60px;width:100px;margin:30px 10px 30px 10px;" id="btn3" onclick="loadXMLDoc3()">真题信息</button>
</div>

<div id="thrid">

</div>
</div>

<div id="ford">ford </div>

</body>
</html>