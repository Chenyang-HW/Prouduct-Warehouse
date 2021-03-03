<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.Trousers" %>
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
	Trousers.deleteTrousersByID(deleteid);
else{
	String newid=request.getParameter("productidnew");
	String length=request.getParameter("productlength");	
	
	if(newid!=null)
		Trousers.addTrousers(newid,length);
}

List<Trousers> trousers = Trousers.getAllProduct();
%>

<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>Product Id</td>
<td>Length</td>
</tr>
<%
for(Trousers p : trousers){
%>
<tr>
<td><%=p.getProductId()%> </td>
<td><%=p.getLength()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="trousersList.jsp">
      <input type="text" placeholder="the id of the trousers" name="productiddelete"/>
      <button>delete trousers</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="trousersList.jsp">
      <input type="text" placeholder="the id of the trousers" name="productidnew"/>
      <input type="text" placeholder="the length of the trousers" name="productlength"/>
      <button>add trousers</button>
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