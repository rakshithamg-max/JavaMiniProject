<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Report Form</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        margin: 0;
        padding: 0;
    }

    .container {
        width: 500px;
        margin: 60px auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 15px;
        color: #333;
    }

    input {
        width: 95%;
        padding: 10px;
        margin: 6px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
    }

    input:focus {
        border-color: #007BFF;
        outline: none;
        box-shadow: 0 0 5px rgba(0,123,255,0.5);
    }

    button {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background: #007BFF;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        cursor: pointer;
    }

    button:hover {
        background: #0056b3;
    }

    hr {
        margin: 25px 0;
    }

    .error {
        color: red;
        font-size: 13px;
        margin-left: 5px;
    }

    .main-error {
        color: red;
        font-weight: bold;
        text-align: center;
        margin-bottom: 10px;
    }

    .section {
        margin-bottom: 20px;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 15px;
        text-decoration: none;
        color: #007BFF;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="container">

    <!-- ⭐ GENERAL ERROR -->
    <div class="main-error">${error}</div>

    <!-- ⭐ FILTER REPORT -->
    <div class="section">
        <h2>Filter Products</h2>

        <form action="report" method="post">

            <!-- CATEGORY -->
            <input type="text" name="category"
                   placeholder="Enter Category"
                   value="${param.category}">
            <span class="error">${categoryError}</span>

            <!-- PRICE -->
            <input type="number" name="price"
                   placeholder="Enter Minimum Price"
                   value="${param.price}">
            <span class="error">${priceError}</span>

            <button type="submit">Generate Report</button>

        </form>
    </div>

    <hr>

    <!-- ⭐ TOP N REPORT -->
    <div class="section">
        <h2>Top N Products (By Quantity)</h2>

        <form action="topProducts" method="post">

            <input type="number" name="limit"
                   placeholder="Enter N Value"
                   value="${param.limit}">
            <span class="error">${limitError}</span>

            <button type="submit">Show Top Products</button>

        </form>
    </div>

    <a href="index.jsp">⬅ Back to Home</a>

</div>

</body>
</html>