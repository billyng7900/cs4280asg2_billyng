/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import BO.*;
import CommonFunction.CommonFunction;
import Dao.BookDao;
import Dao.OrderDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Billy
 */
public class RefundController extends HttpServlet {

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
            out.println("<title>Servlet RefundController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RefundController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home");
            } else {
                con = cm.createConnection();
                User user = (User) session.getAttribute("user");
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                OrderDao dao = new OrderDao();
                BookDao bookdao = new BookDao();
                OrderList bo = new OrderList();
                boolean isUser = dao.getOrderIsUser(orderID, user.getUserId(),con);
                if (isUser) {
                    ArrayList<Order> orderlist = dao.getOrderRecordByOrderID(orderID,con);
                    for (Order o : orderlist) {
                        Book book = bookdao.getBook(o.getBookID(),con);
                        o.setBook(book);
                    }
                    bo = dao.getOrderPointByOrderID(orderID,con);
                    bo.setOrderList(orderlist);
                    long dayDiff = getDayDiff(bo.getOrderDate());
                    if (dayDiff <= 7) {
                        request.setAttribute("orderList", bo);
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RefundPage.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        response.sendRedirect("PurchaseHistory");
                    }
                } else {
                    response.sendRedirect("PurchaseHistory");
                }
            }
        } catch (Exception e) {
            response.sendRedirect("Home");
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
