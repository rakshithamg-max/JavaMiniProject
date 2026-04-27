package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");

            double price = 0;

            //  VALIDATION
            if (priceStr != null && !priceStr.isEmpty()) {

                price = Double.parseDouble(priceStr);

                if (price < 0) {
                    request.setAttribute("priceError", "Price cannot be negative!");
                    request.getRequestDispatcher("report_form.jsp").forward(request, response);
                    return;
                }
            }

            // OPTIONAL: category validation
            if (category != null && category.trim().isEmpty()) {
                request.setAttribute("categoryError", "Category cannot be empty!");
                request.getRequestDispatcher("report_form.jsp").forward(request, response);
                return;
            }

            //  FETCH DATA
            List<Product> list = ProductDAO.getFilteredProducts(category, price);

            request.setAttribute("list", list);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("priceError", "Invalid price format!");
            request.getRequestDispatcher("report_form.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("report_form.jsp").forward(request, response);
        }
    }
}