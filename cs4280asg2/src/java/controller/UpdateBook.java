/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import BO.Book;
import CommonFunction.ConnectionHelper;
import Dao.BookDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Billy
 */
public class UpdateBook extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShoppingChartAddController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShoppingChartAddController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ConnectionHelper cm = new ConnectionHelper();
        Connection con = null;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            con = cm.createConnection();
            con.setAutoCommit(false);
            String hello = request.getParameter("bookID");
            int bookID = Integer.parseInt(request.getParameter("bookID"));
            String bookName = request.getParameter("bookname");
            String author = request.getParameter("author");
            String bookDescription = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            int availability = Integer.parseInt(request.getParameter("availability"));
            String imageURL = request.getParameter("imageURL");
            Book book = new Book();
            book.setBookID(bookID);
            book.setBookName(bookName);
            book.setAuthor(author);
            book.setBookDescription(bookDescription);
            book.setPrice(price);
            book.setAvailability(availability);
            book.setImageURL(imageURL);
            BookDao dao = new BookDao();
            int successful = dao.updateBook(book,con);
            if(successful==1)
            {
                cm.commitConnection();
                response.sendRedirect("BookMaintenanceMain");
            }
            else
            {
                cm.rollbackConnection();
                response.sendRedirect("Home");
            }
        } catch (Exception e) {
            response.sendRedirect("Home");
        } finally {
            cm.closeConnection();
            out.close();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
