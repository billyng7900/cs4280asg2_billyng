/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import BO.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author billyng
 */
public class OrderController extends HttpServlet {

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
            HttpSession session = request.getSession();
            if(session.getAttribute("user")==null)
            {
                response.sendRedirect("Login.jsp?requestURL=ShoppingCart.jsp");
            }
            else
            {
                if(session.getAttribute("cart")==null)
                {
                    response.sendRedirect("Home");
                }
                else
                {
                    ShoppingCart shoppingcart = (ShoppingCart)session.getAttribute("cart");
                    ArrayList<CartBook> booklist = shoppingcart.getShoppingCart();
                    int counter = 1;
                    String quantitywithnumber = "quantity";
                    for(int i=0;i<booklist.size();i++)
                    {
                        quantitywithnumber = "quantity";
                        quantitywithnumber += counter;
                        int quantity = Integer.parseInt(request.getParameter(quantitywithnumber));
                        if(booklist.get(i).getQuantity()!=quantity)
                        {
                            booklist.get(i).setQuantity(quantity);
                        }
                        counter++;
                    }
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CheckoutPage.jsp");
                    dispatcher.forward(request, response);
                }
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
