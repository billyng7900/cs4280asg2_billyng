/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.*;
import BO.*;
import CommonFunction.ConnectionHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Billy
 */
public class PurchaseHistoryController extends HttpServlet {

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
        ConnectionHelper cm = new ConnectionHelper();
        Connection con = null;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            if(session.getAttribute("user")==null)
            {
                response.sendRedirect("Login.jsp");
            }
            else
            {
                con = cm.createConnection();
                AllOrder allOrder = new AllOrder();
                User user = (User)session.getAttribute("user");
                OrderDao dao = new OrderDao();
                BookDao bookdao = new BookDao();
                ArrayList<Integer> orderIDList = dao.getAllOrderIDByUser(user.getUserId(),con);
                ArrayList<OrderList> allList = new ArrayList<OrderList>();
                for(int i:orderIDList)
                {
                    OrderList orderlist = dao.getOrderPointByOrderID(i,con);
                    ArrayList<Order> order = dao.getOrderRecordByOrderID(i,con);
                    for(Order o:order)
                    {
                        Book book = bookdao.getBook(o.getBookID(),con);
                        o.setBook(book);
                    }
                    orderlist.setOrderList(order);
                    allList.add(orderlist);
                }
                allOrder.setAllOrderList(allList);
                request.setAttribute("allOrder", allOrder);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PurchaseHistory.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            response.sendRedirect("Home");
        } finally {
            cm.closeConnection();
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
