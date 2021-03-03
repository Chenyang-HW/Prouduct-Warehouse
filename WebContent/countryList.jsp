<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.Country" %>
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


String deleteid = request.getParameter("countryiddelete");
if(deleteid != null)
	Country.deleteCountryByID(deleteid);
else{
	String newid=request.getParameter("countryidnew");
	String name=request.getParameter("countryname");	
	String traiff=request.getParameter("countrytraiff");	
	
	if(newid!=null)
		Country.addCountry(newid,name,traiff);
}

List<Country> countries = Country.getAllCountries();
%>


<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>Country Id</td>
<td>Country Name</td>
<td>Tariff Rate</td>
</tr>
<%
for(Country p : countries){
%>
<tr>
<td><%=p.getCountryId()%> </td>
<td><%=p.getCountryName()%> </td>
<td><%=p.getTariffRate()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="countryList.jsp">
      <input type="text" placeholder="the id of the country" name="countryiddelete"/>
      <button>delete country</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="countryList.jsp">
      <input type="text" placeholder="the id of the country" name="countryidnew"/>
      <input type="text" placeholder="the name of the country" name="countryname"/>
      <input type="text" placeholder="the traiff of the country" name="countrytraiff"/>
      <button>add country</button>
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