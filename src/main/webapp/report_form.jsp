 <!-- ========================= -->
<!-- report_form.jsp -->
<!-- ========================= -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>

<style>

body{
font-family:Arial;
background:linear-gradient(to right,#4b6cb7,#182848);
}

.container{
width:450px;
margin:40px auto;
background:white;
padding:30px;
border-radius:15px;
}

h2{
text-align:center;
}

input{
width:100%;
padding:12px;
margin-top:10px;
border-radius:8px;
border:1px solid gray;
}

button{
width:100%;
padding:12px;
margin-top:15px;
background:#182848;
color:white;
border:none;
border-radius:8px;
font-size:16px;
}

button:hover{
background:#101b31;
}

hr{
margin:25px 0;
}

</style>
</head>

<body>

<div class="container">

<h2>Price Report</h2>

<form action="ReportServlet"
method="post">

<input type="number"
name="price"
placeholder="Enter Minimum Price"
required>

<button type="submit">
Generate Report
</button>

</form>

<hr>

<h2>Category Report</h2>

<form action="ReportCriteriaServlet"
method="post">

<select name="category" required>

<option value="">
-- Select Category --
</option>

<option>Electronics</option>

<option>Mobile Phones</option>

<option>Laptops</option>

<option>Computer Accessories</option>

<option>Home Appliances</option>

<option>Furniture</option>

<option>Clothing</option>

<option>Footwear</option>

<option>Books</option>

<option>Sports & Fitness</option>

<option>Beauty Products</option>

<option>Groceries</option>

<option>Toys & Games</option>

<option>Kitchen Items</option>

<option>Watches</option>

<option>Bags & Accessories</option>

<option>Stationery</option>

<option>Automobile Accessories</option>

<option>Health Care</option>

<option>Jewellery</option>

</select>

<button type="submit">
Category Report
</button>

</form>

<hr>

<h2>Top Products Report</h2>

<form action="TopProductsServlet"
method="post">

<input type="number"
name="count"
placeholder="Enter Top Count"
required>

<button type="submit">
Top Products
</button>

</form>

</div>

</body>
</html>