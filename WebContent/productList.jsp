<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="ie.ucd.comp2004J.User" %>

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
	Product.deleteProductByID(deleteid);
else{
	String newid=request.getParameter("productidnew");
	String amount=request.getParameter("productamount");
	String name=request.getParameter("productname");
	String md=request.getParameter("made_date");
	String ct=request.getParameter("productcategory");
	String cid=request.getParameter("productcity");
	String mid=request.getParameter("productmanager");
	
	
	if(newid!=null)
		Product.addProduct(newid,amount,name,md,ct,cid,mid);
}

List<Product> products = Product.getAllProduct();
%>

<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>Product Id</td>
<td>Amount</td>
<td>Product Name</td>
<td>MadeDate</td>
<td>Category</td>
<td>City Id</td>
<td>Manager Id</td>
</tr>
<%
for(Product p : products){
%>
<tr>
<td><%=p.getProductId()%> </td>
<td><%=p.getAmount()%> </td>
<td><%=p.getProductName()%> </td>
<td><%=p.getMadeDate()%> </td>
<td><%=p.getCategory()%> </td>
<td><%=p.getcityId()%> </td>
<td><%=p.getManagerId()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="productList.jsp">
      <input type="text" placeholder="the id of the product" name="productiddelete"/>
      <button>delete product</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="productList.jsp">
      <input type="text" placeholder="the id of the product" name="productidnew"/><br>
      <input type="text" placeholder="the amount of the product" name="productamount"/><br>
      <input type="text" placeholder="the name of the product" name="productname"/><br>
      the category of the product:<br>
      <input type="radio" value="hat" name="productcategory"/>hat<br>
      <input type="radio" value="trousers" name="productcategory"/>trousers<br>
      <input type="radio" value="shoes" name="productcategory"/>shoes<br>
      <input type="text" placeholder="the origin city of the product" name="productcity"/><br>
      <input type="text" placeholder="the manager of the product" name="productmanager"/><br>
      <input type="text" placeholder="the date of the product made" name="made_date"/><br>
      <button>add product</button>
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