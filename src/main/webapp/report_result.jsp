<!-- ========================= -->
<!-- report_result.jsp -->
<!-- ========================= -->

<%@ page import="java.util.*,com.model.Product"%>

<%
List<Product> list =
(List<Product>)request.getAttribute("data");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Result</title>

<style>

body{
font-family:Arial;
background:#f2f2f2;
}

h2{
text-align:center;
margin-top:20px;
}

table{
width:80%;
margin:30px auto;
border-collapse:collapse;
background:white;
box-shadow:0 0 10px gray;
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
border:1px solid #ccc;
}

tr:hover{
background:#f5f5f5;
}

</style>
</head>

<body>

<h2>Report Result</h2>

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

</body>
</html>