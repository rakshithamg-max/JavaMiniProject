package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/FetchProductServlet")
public class FetchProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
    HttpServletResponse res)throws ServletException,IOException {

        try {

            int id=Integer.parseInt(req.getParameter("id"));

            String page=req.getParameter("page");

            ProductDAO dao=new ProductDAO();

            Product p=dao.getProductById(id);

            req.setAttribute("p",p);

            RequestDispatcher rd=null;

            if("update".equals(page)){

                rd=req.getRequestDispatcher("productupdate.jsp");
            }
            else if("delete".equals(page)){

                rd=req.getRequestDispatcher("productdelete.jsp");
            }

            rd.forward(req,res);

        }catch(Exception e){
            e.printStackTrace();
        }
    }

}