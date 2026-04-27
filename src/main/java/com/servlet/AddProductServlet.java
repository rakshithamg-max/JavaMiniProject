package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;
import com.model.Product;
@WebServlet("/add")
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String qtyStr = request.getParameter("quantity");

            //  EMPTY VALIDATION
            if (idStr == null || idStr.trim().isEmpty() ||
                name == null || name.trim().isEmpty() ||
                category == null || category.trim().isEmpty() ||
                priceStr == null || priceStr.trim().isEmpty() ||
                qtyStr == null || qtyStr.trim().isEmpty()) {

                request.setAttribute("error", "All fields are required!");
                request.getRequestDispatcher("productadd.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(idStr);
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(qtyStr);

            //  VALUE VALIDATION
            if (id <= 0) {
                request.setAttribute("error", "Invalid Product ID!");
                request.getRequestDispatcher("productadd.jsp").forward(request, response);
                return;
            }

            if (price <= 0) {
                request.setAttribute("error", "Price must be greater than 0!");
                request.getRequestDispatcher("productadd.jsp").forward(request, response);
                return;
            }

            if (quantity < 0) {
                request.setAttribute("error", "Quantity cannot be negative!");
                request.getRequestDispatcher("productadd.jsp").forward(request, response);
                return;
            }

            //  INSERT
            Product p = new Product();
            p.setProductId(id);
            p.setProductName(name);
            p.setCategory(category);
            p.setPrice(price);
            p.setQuantity(quantity);

            ProductDAO.addProduct(p);

            response.sendRedirect("success.jsp");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format!");
            request.getRequestDispatcher("productadd.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("productadd.jsp").forward(request, response);
        }
    }
}