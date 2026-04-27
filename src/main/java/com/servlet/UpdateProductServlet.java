package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/update")
public class UpdateProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String qtyStr = request.getParameter("quantity");

            boolean hasError = false;

            // FIELD-WISE EMPTY VALIDATION
            if (idStr == null || idStr.trim().isEmpty()) {
                request.setAttribute("idError", "ID is required");
                hasError = true;
            }

            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("nameError", "Name is required");
                hasError = true;
            }

            if (category == null || category.trim().isEmpty()) {
                request.setAttribute("categoryError", "Category is required");
                hasError = true;
            }

            if (priceStr == null || priceStr.trim().isEmpty()) {
                request.setAttribute("priceError", "Price is required");
                hasError = true;
            }

            if (qtyStr == null || qtyStr.trim().isEmpty()) {
                request.setAttribute("qtyError", "Quantity is required");
                hasError = true;
            }

            if (hasError) {
                request.getRequestDispatcher("productupdate.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(idStr);
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(qtyStr);

            //  VALUE VALIDATION
            if (id <= 0) {
                request.setAttribute("idError", "ID must be greater than 0");
                hasError = true;
            }

            if (price <= 0) {
                request.setAttribute("priceError", "Price must be greater than 0");
                hasError = true;
            }

            if (quantity < 0) {
                request.setAttribute("qtyError", "Quantity cannot be negative");
                hasError = true;
            }

            if (hasError) {
                request.getRequestDispatcher("productupdate.jsp").forward(request, response);
                return;
            }

            //  CREATE OBJECT
            Product p = new Product();
            p.setProductId(id);
            p.setProductName(name);
            p.setCategory(category);
            p.setPrice(price);
            p.setQuantity(quantity);

            int status = ProductDAO.updateProduct(p);

            if (status > 0) {
                response.sendRedirect("update_success.jsp");
            } else {
                request.setAttribute("error", "Product not found!");
                request.getRequestDispatcher("productupdate.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format!");
            request.getRequestDispatcher("productupdate.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("productupdate.jsp").forward(request, response);
        }
    }

    //  HANDLE DIRECT ACCESS
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("productupdate.jsp");
    }
}