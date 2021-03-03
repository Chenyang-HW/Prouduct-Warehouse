<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.Hat" %>
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


String deleteid = request.getParameter("productiddelete");
if(deleteid != null)
	Hat.deleteHatByID(deleteid);
else{
	String newid=request.getParameter("productidnew");
	String style=request.getParameter("productstyle");	
	
	if(newid!=null)
		Hat.addHat(newid,style);
}

List<Hat> hat = Hat.getAllProduct();
%>

<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>Product Id</td>
<td>Style</td>
</tr>
<%
for(Hat p : hat){
%>
<tr>
<td><%=p.getProductId()%> </td>
<td><%=p.getStyle()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="hatList.jsp">
      <input type="text" placeholder="the id of the hat" name="productiddelete"/>
      <button>delete hat</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="hatList.jsp">
      <input type="text" placeholder="the id of the hat" name="productidnew"/><br>
      the style of the hat :<br>
      <input type="radio" value="Army" name="productstyle"/>Army<br>
      <input type="radio" value="Beanie" name="productstyle"/>Beanie<br>
      <input type="radio" value="Baseball" name="productstyle"/>Baseball<br>
      <input type="radio" value="Berets" name="productstyle"/>Berets<br>
      <input type="radio" value="Boater" name="productstyle"/>Boater<br>
      <input type="radio" value="Bowler" name="productstyle"/>Bowler<br>

      <button>add hat</button>
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