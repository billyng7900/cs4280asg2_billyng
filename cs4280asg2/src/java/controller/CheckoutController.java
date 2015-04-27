/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import BO.*;
import Dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author yuchunng3
 */
public class CheckoutController extends HttpServlet {

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
        doPost(request,response);
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
        try {
            HttpSession session = request.getSession();
            if(session.getAttribute("cart")==null)
            {
                response.sendRedirect("Home");
            }
            else
            {
                User user = (User)session.getAttribute("user");
                int pointwilluse = Integer.parseInt(request.getParameter("pointuse"));
                ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
                float pointwillearn = Float.parseFloat(request.getParameter("totalpricehidden"));
                int pointwillearnint = (int) pointwillearn;
                BookDao bookdao = new BookDao();
                OrderDao dao = new OrderDao();
                int newOrderId = dao.getNewOrderID();
                boolean isAvailabilityOver = false;
                boolean notEnoughLoyaltyPoints = false;
                UserDao userdao = new UserDao();
                int latestLoyaltyPoints = userdao.getUserLoyaltyPoints(user.getUserId());
                if(latestLoyaltyPoints-pointwilluse<0)
                    notEnoughLoyaltyPoints = true;
                for(CartBook b:cart.getShoppingCart())
                {
                    Book dbbook = bookdao.getBook(b.getBook().getBookID());
                    if(dbbook.getAvailability()<b.getQuantity())//check order quantity exceeds avilability
                    {
                        isAvailabilityOver = true;
                    }
                }
                if(isAvailabilityOver||notEnoughLoyaltyPoints)
                {
                    response.sendRedirect("ShoppingCart.jsp?error=1");
                }
                else
                {
                    for(CartBook b:cart.getShoppingCart())
                    {
                        Book dbbook = bookdao.getBook(b.getBook().getBookID());
                        int newAvailability = dbbook.getAvailability()-b.getQuantity();
                        bookdao.updateBookAvailability(b.getBook().getBookID(), newAvailability);
                        
                        dao.insertOrderRecord(newOrderId, b.getBook().getBookID(), b.getQuantity()); 
                    }
                    
                    int userremainsloyaltypoints = latestLoyaltyPoints - pointwilluse + (pointwillearnint/10);
                    userdao.updateUserPoint(user.getUserId(), userremainsloyaltypoints);
                    dao.insertOrderPoint(newOrderId, pointwilluse,cart.getTotalPrice(),user.getUserId());
                    session.setAttribute("cart", null);
                    response.sendRedirect("OrderSuccessful.jsp");
                }
            }
        }finally {
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
