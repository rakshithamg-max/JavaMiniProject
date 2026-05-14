 <!-- ========================= -->
<!-- productupdate.jsp -->
<!-- ========================= -->

<%@ page import="com.model.Product"%>

<%
Product p=(Product)request.getAttribute("p");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>

<style>

body{
font-family:Arial;
background:linear-gradient(to right,#134e5e,#71b280);
}

.container{
width:450px;
margin:40px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px rgba(0,0,0,0.3);
}

h2{
text-align:center;
margin-bottom:20px;
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
margin-top:20px;
background:#134e5e;
color:white;
border:none;
border-radius:8px;
cursor:pointer;
font-size:16px;
}

button:hover{
background:#0f3d47;
}


</style>
</head>

<body>

<div class="container">

<h2>Fetch Product</h2>

<form action="FetchProductServlet" method="post">

<input type="hidden"
name="page"
value="update">

<input type="number"
name="id"
placeholder="Enter Product ID"
required>

<button type="submit">
Fetch Product
</button>

</form>

<hr>

<h2>Update Product</h2>

<form action="UpdateProductServlet"
method="post">

<input type="number"
name="id"
value="<%= (p!=null)?p.getId():"" %>"
readonly>

<input type="text"
name="name"
value="<%= (p!=null)?p.getName():"" %>">

<select name="category" required style="width:100%;padding:12px;margin-top:10px;border-radius:8px;border:1px solid gray;">

<option value="">-- Select Category --</option>

<option <%= (p!=null && "Electronics".equals(p.getCategory())) ? "selected" : "" %>>Electronics</option>
<option <%= (p!=null && "Mobile Phones".equals(p.getCategory())) ? "selected" : "" %>>Mobile Phones</option>
<option <%= (p!=null && "Laptops".equals(p.getCategory())) ? "selected" : "" %>>Laptops</option>
<option <%= (p!=null && "Computer Accessories".equals(p.getCategory())) ? "selected" : "" %>>Computer Accessories</option>
<option <%= (p!=null && "Home Appliances".equals(p.getCategory())) ? "selected" : "" %>>Home Appliances</option>
<option <%= (p!=null && "Furniture".equals(p.getCategory())) ? "selected" : "" %>>Furniture</option>
<option <%= (p!=null && "Clothing".equals(p.getCategory())) ? "selected" : "" %>>Clothing</option>
<option <%= (p!=null && "Footwear".equals(p.getCategory())) ? "selected" : "" %>>Footwear</option>
<option <%= (p!=null && "Books".equals(p.getCategory())) ? "selected" : "" %>>Books</option>
<option <%= (p!=null && "Sports & Fitness".equals(p.getCategory())) ? "selected" : "" %>>Sports & Fitness</option>
<option <%= (p!=null && "Beauty Products".equals(p.getCategory())) ? "selected" : "" %>>Beauty Products</option>
<option <%= (p!=null && "Groceries".equals(p.getCategory())) ? "selected" : "" %>>Groceries</option>
<option <%= (p!=null && "Toys & Games".equals(p.getCategory())) ? "selected" : "" %>>Toys & Games</option>
<option <%= (p!=null && "Kitchen Items".equals(p.getCategory())) ? "selected" : "" %>>Kitchen Items</option>
<option <%= (p!=null && "Watches".equals(p.getCategory())) ? "selected" : "" %>>Watches</option>
<option <%= (p!=null && "Bags & Accessories".equals(p.getCategory())) ? "selected" : "" %>>Bags & Accessories</option>
<option <%= (p!=null && "Stationery".equals(p.getCategory())) ? "selected" : "" %>>Stationery</option>
<option <%= (p!=null && "Automobile Accessories".equals(p.getCategory())) ? "selected" : "" %>>Automobile Accessories</option>
<option <%= (p!=null && "Health Care".equals(p.getCategory())) ? "selected" : "" %>>Health Care</option>
<option <%= (p!=null && "Jewellery".equals(p.getCategory())) ? "selected" : "" %>>Jewellery</option>

</select>

<input type="number"
name="price"
value="<%= (p!=null)?p.getPrice():"" %>">

<input type="number"
name="quantity"
value="<%= (p!=null)?p.getQuantity():"" %>">

<button type="submit">
Update Product
</button>

</form>
<a href="index.jsp" class="back-btn">
Back To Home
</a>

</div>

</body>
</html>