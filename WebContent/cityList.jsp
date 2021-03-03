<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.City" %>
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


String deleteid = request.getParameter("cityiddelete");
if(deleteid != null)
	City.deleteCityByID(deleteid);
else{
	String newid=request.getParameter("cityidnew");
	String cityname=request.getParameter("cityname");	
	String countryid=request.getParameter("countryidnew");	
	
	if(newid!=null)
		City.addCity(newid,cityname,countryid);
}

List<City> cities = City.getAllCities();
%>

<div class="container">
	<div class="info">
	<h2>COMP2004J Product System</h2>
	</div>
</div>
<table border="3">
<tr>
<td>Country Id</td>
<td>City Id</td>
<td>City Name</td>
</tr>
<%
for(City p : cities){
%>
<tr>
<td><%=p.getCountryId()%> </td>
<td><%=p.getCityId()%> </td>
<td><%=p.getCityName()%> </td>
</tr>
<br/>
<%
}
%>
</table>

<div class="delete">
  <div class="form">
    <form class="login-form" method="post" action="cityList.jsp">
      <input type="text" placeholder="the id of the city" name="cityiddelete"/>
      <button>delete City</button>
    </form>
  </div>
</div>

<div class="add">
  <div class="form">
    <form class="login-form" method="post" action="cityList.jsp">
      <input type="text" placeholder="the id of the city" name="cityidnew"/>
      <input type="text" placeholder="the name of the city" name="cityname"/>
      <input type="text" placeholder="country" name="countryidnew"/>
      <button>add City</button>
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