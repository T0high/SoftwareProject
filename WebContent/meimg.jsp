<%@ page language="java" import="user.user,java.sql.*,db.DbConnect,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%user user=(user) session.getAttribute("user"); %>
    <%List<String> list1=(List)session.getAttribute("list1");  %>
    <!-- 没实现，不能删 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.imgfile {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.imgfile input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.imgfile:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}

</style>

<script type="text/javascript">
 function loadXMLDoc(){
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
	    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	    }
	  }
	 var file=document.getElementById("file").value;
	 xmlhttp.open("POST","imgshow1.jsp",true);
	 xmlhttp.send("file="+file);

 }
 </script>
</head>
<body>

${list1.get(0)}
<%=user.getId() %>
<%=user.getName()%>
<%=user.getPassword() %>
<b>上传图片</b>
<div id="myDiv" align="center"><img id="imghead" width="180" height="180" src="images/ali2.jpg"  /> <!--图片显示位置--></div>
<form action="ImgServer" enctype="multipart/form-data"  method="post" >
<table align="center" border="1" >
            <tr>
                <td ><input type="hidden" name="id" value="<%=user.getId() %>"></td>
                <td ><input type="hidden" name="name"  value="<%=user.getName() %>"></td>
                <td ><input type="hidden" name="password"  value="<%=user.getPassword() %>"></td>
             </tr>

<tr>
<td  class="imgfile"><input type="file" name="file" id="file"   accept=".jpg,.jpeg,.png,.jpe"/>头像选择</td>

<td  align="center"><input type="submit" value="头像上传"  /></td>
</tr>

</table>
</form>
<a href="javascript:loadXMlDoc()">保存图片</a>
<script type="text/javascript">
 function loadXMLDoc(){
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
	    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
	    }
	  }
	 var file=document.getElementById("file").value;
	 xmlhttp.open("POST","imgshow1.jsp",true);
	 xmlhttp.send("file="+file);

 }
 </script>
</body>
</html>