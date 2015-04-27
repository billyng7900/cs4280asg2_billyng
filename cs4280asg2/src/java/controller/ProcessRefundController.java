/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import BO.*;
import CommonFunction.CommonFunction;
import Dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author billyng
 */
public class ProcessRefundController extends HttpServlet {

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
            out.println("<title>Servlet ProcessRefundController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessRefundController at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("Home");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home");
            } else {
                con = cm.createConnection();
                User user = (User) session.getAttribute("user");
                OrderDao dao = new OrderDao();
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                boolean isUser = dao.getOrderIsUser(orderID, user.getUserId(),con);
                OrderList bo = new OrderList();
                if (isUser) {
                    ArrayList<Order> orderlist = dao.getOrderRecordByOrderID(orderID,con);
                    bo = dao.getOrderPointByOrderID(orderID,con);
                    long dayDiff = getDayDiff(bo.getOrderDate());
                    if (dayDiff <= 7) {
                        con.setAutoCommit(false);
                        int success = dao.updateOrderStatus(orderID, 2,con);
                        response.sendRedirect("RefundRequest.jsp");
                        cm.commitConnection();
                    } else {
                        response.sendRedirect("PurchaseHistory");
                    }
                } else {
                    response.sendRedirect("PurchaseHistory");
                }
            }
        } catch (Exception e) {
            cm.rollbackConnection();
        } finally {
            cm.closeConnection();
            out.close();
        }
    }

    public long getDayDiff(Calendar dateCompare) {
        Calendar datenow = Calendar.getInstance();
        Date startDate = dateCompare.getTime();
        Date endDate = datenow.getTime();
        long startTime = startDate.getTime();
        long endTime = endDate.getTime();
        long diffTime = endTime - startTime;
        long diffDays = diffTime / (1000 * 60 * 60 * 24);
        return diffDays;
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
