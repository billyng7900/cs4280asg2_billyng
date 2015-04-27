/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.BookDao;
import BO.*;
import CommonFunction.CommonFunction;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Billy
 */
public class ShoppingCartAddController extends HttpServlet {

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
        CommonFunction cm = new CommonFunction();
        Connection con = null;
        PrintWriter out = response.getWriter();
        try {
            con = cm.createConnection();
            BookDao dao = new BookDao();
            String bookID = request.getParameter("bookID");
            Book book = dao.getBook(Integer.parseInt(bookID),con);
            CartBook cbook = new CartBook();
            cbook.setBook(book);
            ArrayList<CartBook> booklist = new ArrayList<CartBook>();
            HttpSession session = request.getSession();
            if (session.getAttribute("cart") == null) {
                cbook.setQuantity(1);
                booklist.add(cbook);
                ShoppingCart bo = new ShoppingCart();
                bo.setShoppingCart(booklist);
                session.setAttribute("cart", bo);
            } else//has item
            {
                ShoppingCart bo = (ShoppingCart) session.getAttribute("cart");
                booklist = bo.getShoppingCart();
                boolean hasrepeateditem = false;
                for (CartBook b : booklist) {
                    if (b.getBook().getBookID() == cbook.getBook().getBookID()) {
                        b.setQuantity(b.getQuantity() + 1);
                        hasrepeateditem = true;
                    }
                }
                if (!hasrepeateditem) {
                    cbook.setQuantity(1);
                    booklist.add(cbook);
                }
                bo.setShoppingCart(booklist);
                session.setAttribute("cart", bo);
            }
            response.sendRedirect("DetailPage?bookID=" + bookID);
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
