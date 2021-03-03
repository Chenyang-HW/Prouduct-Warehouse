<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="ie.ucd.comp2004J.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/showstyle.css">

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
	String ct=request.getParameter("productcategory");
	String cid=request.getParameter("productcity");
	String mid=request.getParameter("productmanager");
	
	
	if(newid!=null)
		Product.addProduct(newid,amount,name,ct,cid,mid);
}

List<Product> products = Product.getAllProduct();
%>
xx

<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="1">
<%
for(Product p : products){
%>
<tr>
<td><%=p.toString()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="productList.jsp">
      <input type="text" placeholder="the id of the product you want to delete" name="productiddelete"/>
      <button>delete product</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="productList.jsp">
      <input type="text" placeholder="the id of the product you want to add" name="productidnew"/>
      <input type="text" placeholder="the amount of the product you want to add" name="productamount"/>
      <input type="text" placeholder="the name of the product you want to add" name="productname"/>
      <input type="text" placeholder="the category of the product you want to add (hat trousers shoes)" name="productcategory"/>
      <input type="text" placeholder="the origin city of the product you want to add" name="productcity"/>
      <input type="text" placeholder="the manager of the product you want to add" name="productmanager"/>
      <button>add product</button>
    </form>
  </div>
</div>


</div>

</body>
</html>