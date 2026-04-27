<%@ page import="java.util.*,com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<title>Report Result</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #2c3e50, #4ca1af);
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
        margin-bottom: 10px;
        color: #333;
    }

    .count {
        margin-bottom: 15px;
        color: #555;
        font-size: 14px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }

    th {
        background: #4ca1af;
        color: white;
        padding: 12px;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .no-data {
        padding: 15px;
        font-weight: bold;
        color: #555;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #4ca1af;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="container">

<h2>Report Result</h2>

<%
List<Product> list = (List<Product>) request.getAttribute("list");
int count = (list != null) ? list.size() : 0;
%>

<div class="count">Total Records: <%= count %></div>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Category</th>
<th>Price (Rupee)</th>
<th>Quantity</th>
</tr>

<%
if(list != null && !list.isEmpty()){
    for(Product p : list){
%>

<tr>
<td><%=p.getProductId()%></td>
<td><%=p.getProductName()%></td>
<td><%=p.getCategory()%></td>
<td> <%= String.format("%.2f", p.getPrice()) %></td>
<td><%=p.getQuantity()%></td>
</tr>

<%
    }
} else {
%>

<tr>
<td colspan="5" class="no-data">No Records Found</td>
</tr>

<%
}
%>

</table>

<a href="report_form.jsp"> Back to Reports</a>

</div>

</body>
</html>