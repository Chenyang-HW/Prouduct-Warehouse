<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.Shoes" %>
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
	Shoes.deleteShoesByID(deleteid);
else{
	String newid=request.getParameter("productidnew");
	String size=request.getParameter("productsize");	
	
	if(newid!=null)
		Shoes.addShoes(newid,size);
}

List<Shoes> shoes = Shoes.getAllProduct();
%>


<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>Product Id</td>
<td>Size</td>
</tr>
<%
for(Shoes p : shoes){
%>
<tr>
<td><%=p.getProductId()%> </td>
<td><%=p.getSize()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="shoesList.jsp">
      <input type="text" placeholder="the id of the shoes" name="productiddelete"/>
      <button>delete shoes</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="shoesList.jsp">
      <input type="text" placeholder="the id of the shoes" name="productidnew"/>
      <input type="text" placeholder="the size of the shoes" name="productsize"/>
      <button>add shoes</button>
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