package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
    HttpServletResponse res)
    throws ServletException, IOException {

        try {

            String idStr = req.getParameter("id");

            // VALIDATION 1
            if(idStr == null || idStr.trim().equals("")){

                req.setAttribute("error", "Product ID is required");

                RequestDispatcher rd =
                req.getRequestDispatcher("productdelete.jsp");

                rd.forward(req, res);
                return;
            }

            int id = Integer.parseInt(idStr);

            // VALIDATION 2
            if(id <= 0){

                req.setAttribute("error", "Invalid Product ID");

                RequestDispatcher rd =
                req.getRequestDispatcher("productdelete.jsp");

                rd.forward(req, res);
                return;
            }

            ProductDAO dao = new ProductDAO();

            // VALIDATION 3
            Product p = dao.getProductById(id);

            if(p == null){

                req.setAttribute("error", "Product ID does not exist");

                RequestDispatcher rd =
                req.getRequestDispatcher("productdelete.jsp");

                rd.forward(req, res);
                return;
            }

            // DELETE PRODUCT
            dao.delete(id);
            res.sendRedirect("index.jsp?msg=deleted");
           
        }
        catch(NumberFormatException e){

            req.setAttribute("error", "Only numbers allowed");

            RequestDispatcher rd =
            req.getRequestDispatcher("productdelete.jsp");

            rd.forward(req, res);
        }
        catch(Exception e){

            e.printStackTrace();

            req.setAttribute("error", "Something went wrong");

            RequestDispatcher rd =
            req.getRequestDispatcher("productdelete.jsp");

            rd.forward(req, res);
        }
    }
}