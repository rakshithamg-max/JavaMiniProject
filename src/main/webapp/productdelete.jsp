<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Delete Product</title>

<style>
   body {
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #667eea, #764ba2);
    margin: 0;

        padding: 0;
    }

    .container {
        width: 400px;
        margin: 80px auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input {
        width: 90%;
        padding: 12px;
        margin: 10px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    input:focus {
        border-color: #ff4b2b;
        outline: none;
        box-shadow: 0 0 5px rgba(255,75,43,0.5);
    }

    button {
        width: 95%;
        padding: 12px;
        margin-top: 15px;
        background: #ff4b2b;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #e03e1f;
    }

    .error {
        color: red;
        font-size: 13px;
        text-align: left;
        margin-left: 5%;
    }

    .main-error {
        color: red;
        font-weight: bold;
        margin-bottom: 15px;
    }

    a {
        display: block;
        margin-top: 20px;
        text-decoration: none;
        color: #333;
        font-size: 14px;
    }

    a:hover {
        color: #ff4b2b;
    }
</style>
</head>

<body>

<div class="container">

    <h2>Delete Product</h2>

    <!-- ⭐ GENERAL ERROR -->
    <%
    String error = (String) request.getAttribute("error");
    if(error != null){
    %>
        <div class="main-error"><%= error %></div>
    <%
    }
    %>

    <!-- ⭐ FORM -->
    <form action="delete" method="post">

        <input type="number" name="id" placeholder="Enter Product ID" value="${param.id}">
        <span class="error">${idError}</span>

        <button type="submit">Delete Product</button>

    </form>

    <a href="index.jsp">⬅ Back to Home</a>

</div>

</body>
</html>