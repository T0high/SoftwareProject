<%@ page language="java" import="user.user,java.sql.*,db.DbConnect,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%user user=(user) session.getAttribute("user"); %>
    <%List<String> list1=(List)session.getAttribute("list1");  %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- 没有实现，不管 -->
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

</head>
<body>

<b>上传图片</b>
<center>
  <div id="myDiv"> <img id="imghead" width="180" height="180" src="images/ali2.jpg"   /></div>
 
</center>


<form action="ImgServer" enctype="multipart/form-data"  method="post" >
<table align="center" border="1" >
            <tr>
                <td ><input type="hidden" name="id" value="<%=user.getId() %>"></td>
                <td ><input type="hidden" name="name"  value="<%=user.getName() %>"></td>
                <td ><input type="hidden" name="password"  value="<%=user.getPassword() %>"></td>
             </tr>

<tr>
<td  class="imgfile"><input type="file" name="file" id="file"   accept=".jpg,.jpeg,.png,.jpe" onchange="imgChange(this);" />头像选择</td>

<td  align="center"><input type="submit" value="头像上传"  onclick="changeCode()" /></td>
</tr>
</table>
</form>



<script type="text/javascript">

function imgChange(obj) {
	 //获取点击的文本框
	 var file =document.getElementById("file");
	 var imgUrl =window.URL.createObjectURL(file.files[0]);
	 var img =document.getElementById('imghead');
	 img.setAttribute('src',imgUrl); // 修改img标签src属性值
	 }
		function changeCode() {
			

			var PicPath = document.getElementById("file").value;
			document.getElementById("myDiv").innerHTML="<img src="+PicPath+"/>";
		    
		}
		
	
</script>		
</body>
</html>