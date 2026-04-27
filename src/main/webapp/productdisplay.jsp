<%@ page import="java.util.*,com.dao.ProductDAO,com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<title>Product List</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #2193b0, #6dd5ed);
        margin: 0;
        padding: 0;
    }

    .container {
        width: 85%;
        margin: 40px auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th {
        background: #2193b0;
        color: white;
        padding: 12px;
        text-align: center;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #2193b0;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="container">

<h2>Product List</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
</tr>

<%
List<Product> list = ProductDAO.getAllProducts();

for(Product p : list){
%>

<tr>
<td><%=p.getProductId()%></td>
<td><%=p.getProductName()%></td>
<td><%=p.getCategory()%></td>
<td><%=p.getPrice()%></td>
<td><%=p.getQuantity()%></td>
</tr>

<%
}
%>

</table>

<a href="index.jsp"> Back to Home</a>

</div>

</body>
</html>