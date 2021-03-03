<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.UserDAO" %>
<%@ page import="ie.ucd.comp2004J.User" %>
<%@ page import="ie.ucd.comp2004J.JDBCTool" %>
    
    
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String rootpassword = request.getParameter("rootpassword");
JDBCTool.rootPassword=rootpassword;
 
out.print(username);
out.print(password);

User u = UserDAO.login(username, password);

if(u==null){
	//response.sendRedirect("index.jsp");
}
else{
	session.setAttribute("user", u);
	response.sendRedirect("allList.jsp");
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title </title>
</head>
<body>
Wrong password!!!!!!
</body>
</html>