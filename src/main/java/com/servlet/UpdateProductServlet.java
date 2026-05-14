package com.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
    HttpServletResponse res)
    throws ServletException, IOException {

        try{

            Product p=new Product();

            p.setId(
            Integer.parseInt(req.getParameter("id")));

            p.setName(
            req.getParameter("name"));

            p.setCategory(
            req.getParameter("category"));

            p.setPrice(
            Double.parseDouble(
            req.getParameter("price")));

            p.setQuantity(
            Integer.parseInt(
            req.getParameter("quantity")));

            ProductDAO dao=new ProductDAO();

            dao.update(p);
            res.sendRedirect("index.jsp?msg=updated");           

        }
        catch(Exception e){

            e.printStackTrace();
        }
    }
}