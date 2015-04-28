/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import BO.Book;
import BO.User;
import CommonFunction.ConnectionHelper;
import Dao.BookDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Billy
 */
public class BookMaintenanceCreateController extends HttpServlet {

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
            out.println("<title>Servlet BookMainteanceCreateController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookMainteanceCreateController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ConnectionHelper cm = new ConnectionHelper();
        Connection con = null;
        try {
            HttpSession session = request.getSession();
            if(session.getAttribute("user")==null)
            {
                response.sendRedirect("Home");
            }
            else
            {
                User user = (User)session.getAttribute("user");
                if(user.getIsManager())
                {
                    con = cm.createConnection();
                    BookDao dao = new BookDao();
                    String bookname = request.getParameter("bookname");
                    String author = request.getParameter("author");
                    String description = request.getParameter("description");
                    float price = Float.parseFloat(request.getParameter("price"));
                    int availability = Integer.parseInt(request.getParameter("availability"));
                    String imageURL = request.getParameter("bookcover");
                    Book book = new Book();
                    book.setBookName(bookname);
                    book.setAuthor(author);
                    book.setBookDescription(description);
                    book.setPrice(price);
                    book.setImageURL(imageURL);
                    book.setAvailability(availability);
                    int success = dao.insertBook(book,con);
                    if(success==1)
                    {
                        cm.commitConnection();
                        response.sendRedirect("BookMaintenanceMain");
                    }
                    else
                    {
                        cm.rollbackConnection();
                        response.sendRedirect("Home");
                    }
                }
                else
                {
                    cm.rollbackConnection();
                    response.sendRedirect("Home");
                }
            }
        } catch(Exception e){
            cm.rollbackConnection();
        }finally {
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
