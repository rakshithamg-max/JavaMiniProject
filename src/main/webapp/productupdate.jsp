<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Update Product</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #ff9966, #ff5e62);
        margin: 0;
        padding: 0;
    }

    .container {
        width: 420px;
        margin: 60px auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
    }

    input {
        width: 90%;
        padding: 10px;
        margin: 6px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
    }

    button {
        width: 95%;
        padding: 10px;
        margin-top: 10px;
        background: #ff5e62;
        color: white;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background: #e14c50;
    }

    .error {
        color: red;
        font-size: 13px;
        display: block;
        text-align: left;
        margin-left: 5%;
    }

    .main-error {
        color: red;
        font-weight: bold;
        margin-bottom: 10px;
    }

    a {
        display: block;
        margin-top: 15px;
        text-decoration: none;
        color: blue;
    }
</style>
</head>

<body>

<div class="container">

<h2>Update Product</h2>

<!-- ⭐ GENERAL ERROR -->
<%
String error = (String) request.getAttribute("error");
if(error != null){
%>
    <div class="main-error"><%= error %></div>
<%
}
%>

<form action="update" method="post">

<!-- ID -->
<input type="number" name="id" placeholder="Product ID" 
       value="${param.id}">
<span class="error">${idError}</span>

<!-- NAME -->
<input type="text" name="name" placeholder="New Product Name" 
       value="${param.name}">
<span class="error">${nameError}</span>

<!-- CATEGORY -->
<input type="text" name="category" placeholder="New Category" 
       value="${param.category}">
<span class="error">${categoryError}</span>

<!-- PRICE -->
<input type="number" name="price" placeholder="New Price" 
       value="${param.price}">
<span class="error">${priceError}</span>

<!-- QUANTITY -->
<input type="number" name="quantity" placeholder="New Quantity" 
       value="${param.quantity}">
<span class="error">${qtyError}</span>

<button type="submit">Update Product</button>

</form>

<a href="index.jsp">⬅ Back to Home</a>

</div>

</body>
</html>