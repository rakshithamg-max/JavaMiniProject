package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/topProducts")
public class TopProductsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String limitStr = request.getParameter("limit");

            //  EMPTY VALIDATION
            if (limitStr == null || limitStr.trim().isEmpty()) {
                request.setAttribute("limitError", "Enter a value!");
                request.getRequestDispatcher("report_form.jsp").forward(request, response);
                return;
            }

            int limit = Integer.parseInt(limitStr);

            //  VALUE VALIDATION
            if (limit <= 0) {
                request.setAttribute("limitError", "N must be greater than 0!");
                request.getRequestDispatcher("report_form.jsp").forward(request, response);
                return;
            }

            //  FETCH DATA
            List<Product> list = ProductDAO.getTopProducts(limit);

            request.setAttribute("list", list);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("limitError", "Invalid number!");
            request.getRequestDispatcher("report_form.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("report_form.jsp").forward(request, response);
        }
    }

    //  HANDLE DIRECT URL ACCESS
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("report_form.jsp");
    }
}