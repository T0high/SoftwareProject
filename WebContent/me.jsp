<%@ page language="java" import="user.user" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="login_verify.jsp"%>
    <%user user=(user) session.getAttribute("user"); %>
    <!-- 个人信息界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息页面</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
    .file {
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
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
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




<div id="below-left" style="float:left">
<div  style="width:400px">
  <form class="form-horizontal" role="form" action="#" method="post">
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">账号:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="id" name="id"
				value="<%=user.getId() %>"   >
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">名字:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="username" name="username"  
				 value="<%=user.getName() %>"  >
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">密码:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="password" name="password" 
				  value="<%=user.getPassword() %>"  >
		</div>
	</div>
	
	<div class="form-group" Style="margin:40px;">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default" style="margin-right:80px">保存</button>
		<!--  	<button type="submit" class="btn btn-default">取消</button> -->
		</div>
	</div>
</form>
</div>
</div>

<div id="below-right" style="float:left;margin-left:60px;"  ><div align="center">


<div id="myDiv"><img id="imghead" width="180" height="180" src="images/ali2.jpg" class="img-thumbnail" /></div>
 
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >修改头像</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel" >修改头像</h4>
            </div>
           
           <div class="modal-body" id="mydiv">
            <form action="*" enctype="multipart/form-data"  method="post" >
             <table align="center" border="1" >
             <tr >
                <td ><input type="hidden" name="id" value="<%=user.getId() %>"></td>
                <td ><input type="hidden" name="name"  value="<%=user.getName() %>"></td>
                <td ><input type="hidden" name="password"  value="<%=user.getPassword() %>"></td>
             </tr>
             <tr align="center">
             <td colspan="2">头像上传</td>
              </tr>
             <tr>
               <td colspan="2"><input  type="file"  accept=".jpg,.jpeg,.png,.jpe" onchange="imgChange(this);"/></td>
            </tr>
             <tr>
                <td colspan="2" align="center"><input type="submit" value="提交"   ></td>
             </tr>
             </table>
            
 
            </form>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">

function imgChange(obj) {
	 //获取点击的文本框
	 var file =document.getElementById("file");
	 var imgUrl =window.URL.createObjectURL(file.files[0]);
	 var img =document.getElementById('imghead');
	 img.setAttribute('src',imgUrl); // 修改img标签src属性值
	 };
</script> 
 
 </div>
 </div>

</body>
</html>