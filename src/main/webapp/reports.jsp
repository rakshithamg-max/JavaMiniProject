<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Reports Section</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #667eea, #764ba2);
        margin: 0;
        padding: 0;
    }

    .container {
        width: 400px;
        margin: 100px auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
        text-align: center;
    }

    h2 {
        margin-bottom: 25px;
        color: #333;
    }

    a.button {
        display: block;
        padding: 12px;
        margin: 10px 0;
        background: #667eea;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-size: 16px;
        transition: 0.3s;
    }

    a.button:hover {
        background: #5563c1;
    }

    .back {
        display: block;
        margin-top: 15px;
        text-decoration: none;
        color: #333;
        font-size: 14px;
    }

    .back:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<div class="container">

    <h2>Reports Section</h2>

    <!-- ⭐ NAVIGATION BUTTON -->
    <a href="reportCriteria" class="button">Generate Report</a>

    <!-- BACK -->
    <a href="index.jsp" class="back"> Back to Home</a>

</div>

</body>
</html>