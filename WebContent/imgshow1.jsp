<%@ page language="java" import="java.util.*, java.sql.*,user.user,java.lang.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%user user=(user) session.getAttribute("user"); %>
    <%
      String localpath=request.getParameter("file");
    %>
    <!-- 没有实现，不管 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/onlytest?characterEncoding=UTF-8";
Connection con=DriverManager.getConnection(url,"root", "7837800hongkun");
PreparedStatement pst = null;
ResultSet rs=null;
String imgurl=null;


System.out.println("localpath");
String filename = localpath.substring(localpath.lastIndexOf("\\")+1);
System.out.println(filename);
String name=user.getName();
String sql="select * from userimg where name=? ";
pst=con.prepareStatement(sql);
pst.setString(1, name);
rs=pst.executeQuery();

while(rs.next()){
	     String frommysqlpath=rs.getString("imgpath");
		 String frommysqlfilenam=frommysqlpath.substring
				 (frommysqlpath.lastIndexOf("_")+1);
		 if(filename.equals(frommysqlfilenam)) {
			 imgurl=frommysqlpath;
			 System.out.println(imgurl);
			 //访问地址
		//	 String searchpath=frommysqlpath.substring
		//			 (frommysqlpath.indexOf("OnlyTest4")+10);
		//	 System.out.println(searchpath);
			 
			 //地址转换
		//	 searchpath = searchpath.replaceAll("\\\\", "/");  
		//	 searchpath="./"+searchpath;
		//        System.out.println(searchpath);  
			 %>
<center>
     
    <img id="imgs" width="180" height="180" src="<%=frommysqlpath %>"/>
 
</center>
	<% }	
   }
} catch (Exception e) {
	e.printStackTrace();
}

%>		
</body>
</html>