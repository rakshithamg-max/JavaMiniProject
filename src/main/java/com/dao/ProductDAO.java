package com.dao;

import java.sql.*;
import java.util.*;

import com.model.Product;

public class ProductDAO {

    Connection getCon() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/productdb",
            "root",
            "raksha@01"
        );
    }

    // ADD PRODUCT
    public void add(Product p) throws Exception {

        Connection c = getCon();

        PreparedStatement ps = c.prepareStatement(
            "insert into Products(ProductName,Category,Price,Quantity) values(?,?,?,?)"
        );

        ps.setString(1, p.getName());
        ps.setString(2, p.getCategory());
        ps.setDouble(3, p.getPrice());
        ps.setInt(4, p.getQuantity());

        ps.executeUpdate();
    }

    // DISPLAY PRODUCTS
    public List<Product> getAll() throws Exception {

        List<Product> list = new ArrayList<>();

        Connection c = getCon();

        Statement s = c.createStatement();

        ResultSet rs = s.executeQuery(
            "select * from Products"
        );

        while(rs.next()) {

            Product p = new Product();

            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setCategory(rs.getString(3));
            p.setPrice(rs.getDouble(4));
            p.setQuantity(rs.getInt(5));

            list.add(p);
        }

        return list;
    }

    // DELETE PRODUCT
    public void delete(int id) throws Exception {

        Connection c = getCon();

        PreparedStatement ps = c.prepareStatement(
            "delete from Products where ProductID=?"
        );

        ps.setInt(1, id);

        ps.executeUpdate();
    }

    // UPDATE PRODUCT
    public boolean update(Product p) throws Exception {

        boolean status = false;

        Connection c = getCon();

        PreparedStatement ps = c.prepareStatement(

            "update Products set ProductName=?,Category=?,Price=?,Quantity=? where ProductID=?"
        );

        ps.setString(1, p.getName());
        ps.setString(2, p.getCategory());
        ps.setDouble(3, p.getPrice());
        ps.setInt(4, p.getQuantity());
        ps.setInt(5, p.getId());

        int rows = ps.executeUpdate();

        if(rows > 0){
            status = true;
        }

        return status;
    }

    // GET PRODUCT BY ID
    public Product getProductById(int id) throws Exception {

        Product p = null;

        Connection c = getCon();

        PreparedStatement ps = c.prepareStatement(
            "select * from Products where ProductID=?"
        );

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            p = new Product();

            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setCategory(rs.getString(3));
            p.setPrice(rs.getDouble(4));
            p.setQuantity(rs.getInt(5));
        }

        return p;
    }

    // PRICE REPORT
    public List<Product> priceReport(double price)
    throws Exception {

        List<Product> list = new ArrayList<>();

        Connection c = getCon();

        PreparedStatement ps = c.prepareStatement(
            "select * from Products where Price>?"
        );

        ps.setDouble(1, price);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {

            Product p = new Product();

            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setCategory(rs.getString(3));
            p.setPrice(rs.getDouble(4));
            p.setQuantity(rs.getInt(5));

            list.add(p);
        }

        return list;
    }

    // CATEGORY REPORT
    public List<Product> categoryReport(String category)
    throws Exception {

        List<Product> list = new ArrayList<>();

        Connection c = getCon();

        PreparedStatement ps = c.prepareStatement(
            "select * from Products where Category=?"
        );

        ps.setString(1, category);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {

            Product p = new Product();

            p.setId(rs.getInt(1));
            p.setName(rs.getString(2));
            p.setCategory(rs.getString(3));
            p.setPrice(rs.getDouble(4));
            p.setQuantity(rs.getInt(5));

            list.add(p);
        }

        return list;
    }

    // TOP PRODUCTS
    public List<Product> topProducts(int n)
    		throws Exception {

    		    List<Product> list = new ArrayList<>();

    		    Connection c = getCon();

    		    PreparedStatement ps = c.prepareStatement(

    		    "select * from Products order by Quantity desc limit ?");

    		    ps.setInt(1, n);

    		    ResultSet rs = ps.executeQuery();

    		    while(rs.next()) {

    		        Product p = new Product();

    		        p.setId(rs.getInt(1));
    		        p.setName(rs.getString(2));
    		        p.setCategory(rs.getString(3));
    		        p.setPrice(rs.getDouble(4));
    		        p.setQuantity(rs.getInt(5));

    		        list.add(p);
    		    }

    		    return list;
    		}
 // NEXT PRODUCT ID
    public int getNextProductId()
    throws Exception {

        int id = 1;

        Connection c = getCon();

        Statement s = c.createStatement();

        ResultSet rs = s.executeQuery(
        "select max(ProductID) from Products");

        if(rs.next()) {

            id = rs.getInt(1) + 1;
        }

        return id;
    }

    }








