package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ProductDAO;

@WebServlet("/delete")
public class DeleteProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idStr = request.getParameter("id");

            boolean hasError = false;

            //  EMPTY VALIDATION
            if (idStr == null || idStr.trim().isEmpty()) {
                request.setAttribute("idError", "Product ID is required");
                hasError = true;
            }

            if (hasError) {
                request.getRequestDispatcher("productdelete.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(idStr);

            //  VALUE VALIDATION
            if (id <= 0) {
                request.setAttribute("idError", "Product ID must be greater than 0");
                request.getRequestDispatcher("productdelete.jsp").forward(request, response);
                return;
            }

            //  DELETE FROM DB
            int status = ProductDAO.deleteProduct(id);

            if (status > 0) {
                response.sendRedirect("delete_success.jsp");
            } else {
                request.setAttribute("error", "Product not found!");
                request.getRequestDispatcher("productdelete.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("idError", "ID must be a valid number!");
            request.getRequestDispatcher("productdelete.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("productdelete.jsp").forward(request, response);
        }
    }

    // HANDLE DIRECT ACCESS
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("productdelete.jsp");
    }
}