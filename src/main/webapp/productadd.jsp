<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
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
            margin: 8px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            width: 95%;
            padding: 10px;
            margin-top: 10px;
            background: green;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: darkgreen;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .success {
            color: green;
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

    <h2>Add Product</h2>

    <!-- ERROR MESSAGE -->
    <%
        String error = (String) request.getAttribute("error");
        if(error != null){
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>

    <!-- SUCCESS MESSAGE (OPTIONAL) -->
    <%
        String success = (String) request.getAttribute("success");
        if(success != null){
    %>
        <div class="success"><%= success %></div>
    <%
        }
    %>

    <!-- FORM -->
    <form action="add" method="post">

        <input type="number" name="id" placeholder="Product ID" min="1" required>

        <input type="text" name="name" placeholder="Product Name" required>

        <input type="text" name="category" placeholder="Category" required>

        <input type="number" name="price" placeholder="Price" min="1" required>

        <input type="number" name="quantity" placeholder="Quantity" min="0" required>

        <button type="submit">Add Product</button>

    </form>

    <a href="index.jsp">⬅ Back to Home</a>

</div>

</body>
</html>