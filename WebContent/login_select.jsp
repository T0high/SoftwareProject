<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 登录选择界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="html5-canvas-circle-digit-clock/css/style.css">
<style type="text/css">
  .news {
  border:50px solid groove;
  position:absolute;
  left:580px;
  top:180px;
  opacity:.8;
 
  }
  .new{
  color:#C0C0C0;
  border:50px solid groove;
  position:absolute;
  left:500px;
  top:100px;
  opacity:.8;
  }
  </style>
</head>
<body>
 <canvas id="canvas" width="1300" height="500" style="position:relative " >
  </canvas>
 <div class="new"><h1>欢迎来到只有真题系统！</h1><br>我的身份：</div>
  
  <div class="news">
  <form action="LoginSelectServer" method="post">
            <select name="type">
                <option value="1">普通用户</option>
                <option value="2">管理员</option>
            </select>
            <input type="submit" value="确定">
        </form>
        </div>  
    <script  src="html5-canvas-circle-digit-clock/js/index.js"></script>
</body>
</html>