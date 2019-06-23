<%@ page language="java" import="user.user" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%user user=(user) session.getAttribute("user"); %>
    <!-- 主界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  <style type="text/css">
  #menu{ width: 100px; border: 1px solid #999;
  } 
 #menu ul{ margin: 0px; padding: 0px; list-style: none;/* 隐藏默认列表符号*/
        } 
 #menu ul li{ background: #06C; height: 26px; line-height: 26px; /*行距*/
            text-align: center; border-bottom: 1px solid #999; position: relative; 
            }
 a{ display: block; font-size: 13px; color: #FFF; text-decoration: none;/*隐藏超廉价默认下划线*/
        }
 a:hover{ color:#F00; font-size: 14px; 
 }
 #menu ul li ul{ display: none;/*默认隐藏*/
            top:0px; width: 130px; border: 1px solid #ccc; border-bottom: none; position: absolute; left: 100px;
             }
  #menu ul li:hover ul{ display: block;
   } 
 #menu ul li:hover ul li a{ display: block;
  }
 a{ display: block; font-size: 13px; color: #FFF; text-decoration: none;/*隐藏超廉价默认下划线*/
        }
 #search{
 
 }-->
 <style type="text/css">
 #menu{
      float:left;
 }
 #menu ul li{ 
             position: relative; 
            }
 #menu ul li ul{ display: none;/*默认隐藏*/
            top:0px; width: 130px; border: 1px solid #ccc; border-bottom: none; position: absolute; left: 100px;
             }
  #menu ul li:hover ul{ display: block;
   } 
    #menu ul li:hover ul li a{ display: block;
  }
 a{ display: block; font-size: 13px; color: #000; text-decoration: none;/*隐藏超廉价默认下划线*/
        }
 #function{
  
  width:880px; border: 1px solid #999;
  float:left;
 
 }
 #function div{
   float:left;
  width:100px;
  margin:20px;
 }


</style>


</head>
<body >

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="javascript:void(0);" style=" color:#666; font-size:24px;">只有真题</a>
    </div>
    <div>
        <!--向左对齐-->
       
       
       <form class="navbar-form navbar-left" role="search">
         <!--     <button type="submit" class="btn btn-default">               向左           </button>-->
         
         
            <div class="btn-group" id="menu">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">分类
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li>
            <a href="#">IT·互联网</a>
             <ul> <li><a href="#">互联网产品</a></li>
                  <li><a href="#">编程语言</a></li>
                  <li><a href="#">   前端开发</a></li>
                  <li><a href="#"> 移动开发</a></li>
                  <li><a href="#">网络与运维</a></li>
                  <li><a href="#">游戏开发</a></li>
                  <li><a href="#">软件研发</a></li>
                  <li><a href="#">云计算大数据</a></li>
                  <li><a href="#">硬件研发</a></li>
                  <li><a href="#">认证考试</a></li>
            </ul>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">设计·创作</a>
            <ul> <li><a href="#">平面设计</a></li>
                 <li><a href="#">设计软件</a></li>
                 <li><a href="#">环境艺术设计</a></li>
                 <li><a href="#">绘画创作</a></li>
                 <li><a href="#">工业产品设计</a></li> 
                 <li><a href="#">UI设计</a></li>
                 <li><a href="#">游戏动画设计</a></li>
                 <li><a href="#">影视后期设计</a></li>
                 <li><a href="#">服装设计</a></li>
                 <li><a href="#">其他</a></li>
           </ul>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">电商·营销</a>
            <ul> <li><a href="#">电商平台</a></li>
                 <li><a href="#">跨境电商</a></li>
                 <li><a href="#">社交电商</a></li>
                 <li><a href="#">其他</a></li>
            </ul>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">职业·考证</a>
            <ul> <li><a href="#">公考求职</a></li>
                 <li><a href="#">法学院</a></li> 
                 <li><a href="#">财会经融</a></li>
                 <li><a href="#">医疗卫生</a></li>
                 <li><a href="#">建筑工程</a></li> 
                 <li><a href="#">职业技能</a></li>
           </ul> 
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">升学·考研</a>
            <ul> <li><a href="#">考研</a></li> 
                 <li><a href="#">大学</a></li> 
                 <li><a href="#">高中</a></li> 
                 <li><a href="#">初中</a></li>
                 <li><a href="#">小学</a></li>
           </ul>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">兴趣·生活</a>
            <ul> <li><a href="#">母婴亲子</a></li> 
                 <li><a href="#">音乐乐器</a></li> 
                 <li><a href="#">文艺修养</a></li> 
                 <li><a href="#">生活百科</a></li>
                 <li><a href="#">运动健康</a></li>
                 <li><a href="#">投资理财</a></li>
           </ul>
        </li>
         <li class="divider"></li>
        <li>
            <a href="#">语言·留学</a>
            <ul> <li><a href="#">实用英语</a></li> 
                 <li>
               <a href = "javascript:location.href=encodeURI('ClassifyServer?value=出国留学')">出国留学</a>
                 </li> 
                 <li>
               <!--    <a href="ClassifyServer?value=英语">英语四六级</a>-->
              <a href = "javascript:location.href=encodeURI('ClassifyServer?value=英语')">英语四六级</a>
         
                 </li> 
                 <li><a href="#">日语</a></li>
                 <li><a href="#">韩语</a></li>
                 <li><a href="#">小语种</a></li>
            </ul> 
        </li>
    </ul>
</div>
          </form>  
        
        <form class="navbar-form navbar-left" role="search" action="SearchServer">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" name="searchmessage">
            </div>
            <button type="submit" class="btn btn-default">🔍</button>
        </form>
        
       
       
        <ul class="nav navbar-nav navbar-right"> 
        <li><a href="ExitServlet"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li> 
            <li><a href="regist.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
            <li><a href="login_select.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
        </ul> 
    </div>
    </div>
</nav>



 <!--  <div id=search>
<form action="SearchServer">
<table>
<tr>
<td colspan="2" align="center">搜索框</td>
</tr>
<tr>
<td><input type="text" name="searchmessage"></td>
<td><input type="submit" value="🔍"></td>
</tr>
</table>
</form>
 -->
 
 <div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active" style="height:120px">
			<img src="./images/e1.jpg" alt="First slide" height="30">
		</div>
		<div class="item" style="height:120px">
			<img src="./images/e2.jpg" alt="Second slide"  height="30" width="1024">
		</div>
		<div class="item" style="height:120px">
			<img src="./images/e3.jpg" alt="Third slide"  height="30" width="1024">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div> 

<div id="function">
<div ><a href="upload.jsp">上传真题</a></div>
<div ><a href="testsgathering.jsp">下载真题</a></div>
<div ><a href="historyrecord.jsp">浏览记录</a></div>
<div ><a href="board.jsp">留言</a></div>
<div ><a href="me.jsp">我</a></div>
</div>


 



</body>
</html>