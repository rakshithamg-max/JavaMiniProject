 package com.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

protected void doPost(HttpServletRequest req,
HttpServletResponse res)
throws ServletException, IOException {

try{

Product p=new Product();

p.setName(req.getParameter("name"));

p.setCategory(req.getParameter("category"));

p.setPrice(
Double.parseDouble(req.getParameter("price")));

p.setQuantity(
Integer.parseInt(req.getParameter("quantity")));

if(p.getPrice()<=0){

req.setAttribute("error",
"Price must be greater than 0");

RequestDispatcher rd=
req.getRequestDispatcher("productadd.jsp");

rd.forward(req,res);

return;
}

if(p.getQuantity()<=0){

req.setAttribute("error",
"Quantity must be greater than 0");

RequestDispatcher rd=
req.getRequestDispatcher("productadd.jsp");

rd.forward(req,res);

return;
}

ProductDAO dao=new ProductDAO();

dao.add(p);

res.sendRedirect("index.jsp?msg=added");

}
catch(Exception e){

e.printStackTrace();

}
}
}