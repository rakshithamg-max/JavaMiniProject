 package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
    HttpServletResponse res)throws ServletException,IOException {

        try{

            String category=req.getParameter("category");

            ProductDAO dao=new ProductDAO();

            List<Product> list=
            dao.categoryReport(category);

            req.setAttribute("data",list);

            RequestDispatcher rd=
            req.getRequestDispatcher("report_result.jsp");

            rd.forward(req,res);

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}