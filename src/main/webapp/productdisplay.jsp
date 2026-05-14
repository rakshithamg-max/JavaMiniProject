<%@ page import="java.util.*,com.model.Product"%>

<!DOCTYPE html>
<html>
<head>

<title>Product List</title>

<style>

body{
font-family:Arial;
background:#f2f2f2;
margin:0;
padding:0;
}

.container{
width:90%;
margin:40px auto;
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 0 10px rgba(0,0,0,0.2);
}

h2{
text-align:left;
color:#243b55;
margin-bottom:25px;
}

table{
width:100%;
border-collapse:collapse;
}

/* UPDATED ALIGNMENT */
th{
background:#243b55;
color:white;
padding:12px;
text-align:left;
}

td{
padding:10px;
text-align:left;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f5f5f5;
}

.noData{
text-align:left;
font-size:20px;
color:red;
margin-top:30px;
}

a{
display:inline-block;
margin-top:20px;
text-decoration:none;
background:#243b55;
color:white;
padding:10px 20px;
border-radius:6px;
}

a:hover{
background:#141e30;
}

</style>

</head>

<body>

<div class="container">

<h2>Product List</h2>

<%
List<Product> list =
(List<Product>)request.getAttribute("data");

if(list == null || list.size() == 0){
%>

<div class="noData">
No Products Available
</div>

<%
}
else{
%>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
</tr>

<%
for(Product p : list){
%>

<tr>
<td><%=p.getId()%></td>
<td><%=p.getName()%></td>
<td><%=p.getCategory()%></td>
<td><%=p.getPrice()%></td>
<td><%=p.getQuantity()%></td>
</tr>

<%
}
%>

</table>

<%
}
%>

<br>

<a href="index.jsp">
Back To Home
</a>

</div>

</body>
</html>