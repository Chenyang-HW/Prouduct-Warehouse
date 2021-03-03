<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.UserDAO" %>
<%@ page import="ie.ucd.comp2004J.User" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/goods.css">

<title>Employee List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>

<%


String deleteid = request.getParameter("useriddelete");
if(deleteid != null)
	UserDAO.deleteUserByID(deleteid);
else{
	String newid=request.getParameter("useridnew");
	String uname=request.getParameter("username");	
	String upwd=request.getParameter("userpassword");	
	
	if(newid!=null)
		UserDAO.insertUser(uname,upwd,newid);
}

List<User> users = UserDAO.getAllUsers();
%>


<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>User name</td>
<td>Password</td>
<td>Id</td>
</tr>
<%
for(User p : users){
%>
<tr>
<td><%=p.getUsername()%> </td>
<td><%=p.getPassword()%> </td>
<td><%=p.getId()%> </td>

</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="userList.jsp">
      <input type="text" placeholder="the id of the user" name="useriddelete"/>
      <button>delete user</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="userList.jsp">
      <input type="text" placeholder="the id of the user" name="useridnew"/>
      <input type="text" placeholder="the name of the user" name="username"/>
      <input type="text" placeholder="the password of the user" name="userpassword"/>
      <button>add user</button>
    </form>
  </div>
</div>


<div class="back">
  <div class="form">
    <form class="login-form" method="post" action="allList.jsp">
      <button>back to menu</button>
    </form>
  </div>
</div>


</div>

</body>
</html>