<%@ page language="java"
contentType="text/html; charset=UTF-8"%>
<%@ page import="com.dao.ProductDAO" %>

<%
ProductDAO dao = new ProductDAO();

int nextId = dao.getNextProductId();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Product</title>

<style>

body{
font-family:Arial;
background:linear-gradient(to right,#2193b0,#6dd5ed);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
width:450px;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px rgba(0,0,0,0.3);
}

h2{
text-align:center;
color:#243b55;
}

input,select{
width:100%;
padding:12px;
margin-top:12px;
border-radius:8px;
border:1px solid #ccc;
font-size:15px;
}

button{
width:100%;
padding:12px;
margin-top:20px;
background:#243b55;
color:white;
border:none;
border-radius:8px;
font-size:16px;
cursor:pointer;
}

button:hover{
background:#141e30;
}

.error{
color:red;
margin-top:10px;
text-align:center;
}

a{
display:block;
text-align:center;
margin-top:15px;
text-decoration:none;
font-weight:bold;
color:#243b55;
}

</style>

<script>

function validate(){

let p=document.f.price.value;

let q=document.f.quantity.value;

if(p<=0){

alert("Price must be greater than 0");

return false;
}

if(q<=0){

alert("Quantity must be greater than 0");

return false;
}

return true;
}

</script>

</head>

<body>

<div class="container">

<h2>Add Product</h2>

<%
String error=(String)request.getAttribute("error");

if(error!=null){
%>

<div class="error">
<%=error%>
</div>

<%
}
%>

<form name="f"
action="AddProductServlet"
method="post"
onsubmit="return validate()">

<input type="text"
value="<%=nextId%>"
readonly>

<input type="text"
name="name"
placeholder="Enter Product Name"
required>

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

<input type="number"
name="price"
placeholder="Enter Price"
required>

<input type="number"
name="quantity"
placeholder="Enter Quantity"
required>

<button type="submit">
Add Product
</button>

</form>

<a href="index.jsp">
← Back To Home
</a>

</div>

</body>
</html>