<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.ProductManager" %>
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


String deleteid = request.getParameter("manageriddelete");
if(deleteid != null)
	ProductManager.deleteManagerByID(deleteid);
else{
	String newid=request.getParameter("managernew");
	String sex=request.getParameter("managersex");
	String name=request.getParameter("managername");
	String enrollDate=request.getParameter("enrollDate");
	
	if(newid!=null)
		ProductManager.addManager(newid,sex,name,enrollDate);
}

List<ProductManager> managers = ProductManager.getAllManager();
%>

<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>Manager Id</td>
<td>Name</td>
<td>Sex</td>
<td>Enroll Date</td>
</tr>
<%
for(ProductManager p : managers){
%>
<tr>
<td><%=p.getManagerId()%> </td>
<td><%=p.getName()%> </td>
<td><%=p.isMale()%> </td>
<td><%=p.getEnrollDate()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="productmanagerList.jsp">
      <input type="text" placeholder="the id of the product manager" name="manageriddelete"/>
      <button>delete product manager</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="productmanagerList.jsp">
      <input type="text" placeholder="the id of the product manager" name="managernew"/><br>
      the sex of the product manager :<br>
      <input type="radio" value="male" name="managersex"/>male<br>
      <input type="radio" value="female" name="managersex"/>female<br>
      <input type="text" placeholder="the name of the product manager" name="managername"/>
      <input type="text" placeholder="the enroll date of the product manager" name="enrollDate"/>
      <button>add product manager</button>
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