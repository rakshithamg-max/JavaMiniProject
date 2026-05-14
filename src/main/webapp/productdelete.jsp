<%@ page language="java"
contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Delete Product</title>

<style>

/* ===== GLOBAL ===== */
body{
    margin:0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* ===== CARD DESIGN ===== */
.container{
    width:360px;
    padding:30px;
    border-radius:15px;
    background: rgba(255,255,255,0.1);
    backdrop-filter: blur(12px);
    box-shadow:0 10px 30px rgba(0,0,0,0.5);
    text-align:center;
    color:white;
}

h2{
    margin-bottom:20px;
}

/* ===== INPUT ===== */
input{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:none;
    border-radius:8px;
    outline:none;
    font-size:14px;
}

/* ===== DELETE BUTTON ===== */
.delete-btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background: linear-gradient(135deg,#ff4d4d,#b30000);
    color:white;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

.delete-btn:hover{
    transform:scale(1.03);
}

/* ===== BACK LINK ===== */
a{
    display:block;
    margin-top:15px;
    color:#ddd;
    text-decoration:none;
}

/* ===== MESSAGE ===== */
.error{
    background:#e74c3c;
    padding:8px;
    border-radius:6px;
    margin-bottom:10px;
}

/* ===== MODAL ===== */
.modal{
    display:none;
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.6);
    justify-content:center;
    align-items:center;
}

.modal-box{
    background:white;
    color:black;
    padding:25px;
    border-radius:12px;
    width:300px;
    text-align:center;
    animation:pop 0.2s ease-in-out;
}

@keyframes pop{
    from{transform:scale(0.7);opacity:0;}
    to{transform:scale(1);opacity:1;}
}

.modal-actions{
    margin-top:20px;
    display:flex;
    justify-content:space-between;
}

.cancel-btn{
    background:#7f8c8d;
    color:white;
    border:none;
    padding:8px 15px;
    border-radius:6px;
    cursor:pointer;
}

.confirm-btn{
    background:#e74c3c;
    color:white;
    border:none;
    padding:8px 15px;
    border-radius:6px;
    cursor:pointer;
}

</style>

</head>

<body>

<div class="container">

<h2>Delete Product</h2>

<%
String error = (String)request.getAttribute("error");
if(error != null){
%>
<div class="error"><%=error%></div>
<%
}
%>

<form id="deleteForm"
action="FetchProductServlet"
method="post">

<input type="hidden"
name="page"
value="delete">

<input type="number"
name="id"
placeholder="Enter Product ID"
value="<%= (request.getAttribute("p")!=null)?
((com.model.Product)request.getAttribute("p")).getId():"" %>"
required>

<%
com.model.Product p =
(com.model.Product)request.getAttribute("p");

if(p!=null){
%>

<input type="text"
value="<%=p.getName()%>"
readonly>

<input type="text"
value="<%=p.getCategory()%>"
readonly>

<input type="number"
value="<%=p.getPrice()%>"
readonly>

<input type="number"
value="<%=p.getQuantity()%>"
readonly>

<button type="button"
class="delete-btn"
onclick="openModal()">
Delete Product
</button>

<%
}
else{
%>

<button type="submit"
class="delete-btn">
Fetch Product
</button>

<%
}
%>

</form>

<a href="index.jsp">← Back</a>

</div>

<!-- ===== MODAL ===== -->
<div id="modal" class="modal">

    <div class="modal-box">

        <h3>Confirm Deletion</h3>
        <p>Are you sure you want to delete this product?</p>

        <div class="modal-actions">

            <button class="cancel-btn"
            onclick="closeModal()">
                Cancel
            </button>

            <button class="confirm-btn"
            onclick="submitForm()">
                Yes, Delete
            </button>

        </div>

    </div>

</div>

<script>

function openModal(){
    document.getElementById("modal").style.display = "flex";
}

function closeModal(){
    document.getElementById("modal").style.display = "none";
}

function submitForm(){

    document.getElementById("deleteForm").action =
    "DeleteProductServlet";

    document.getElementById("deleteForm").submit();
}

</script>

</body>
</html>