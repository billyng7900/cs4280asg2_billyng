/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import BO.*;
import CommonFunction.CommonFunction;
import Dao.UserDao;
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
public class MyPageSaveController extends HttpServlet {

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
            out.println("<title>Servlet MyPageSaveController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyPageSaveController at " + request.getContextPath() + "</h1>");
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
                String password = request.getParameter("password");
                String realname = request.getParameter("realname");
                int contact = Integer.parseInt(request.getParameter("contact"));
                UserDao dao = new UserDao();
                User checkUser = dao.getUser(user.getUserName(), password,con);
                if (checkUser == null) {
                    response.sendRedirect("MyPage.jsp?error=1");
                } else {
                    con.setAutoCommit(false);
                    int success = dao.updateUser(realname,contact, user.getUserId(),con);
                    if (success == 1) {
                        cm.commitConnection();
                        response.sendRedirect("MyPage");
                    } else {
                        cm.rollbackConnection();
                        response.sendRedirect("Home");
                    }
                }
            }
        } catch (Exception e) {
            cm.rollbackConnection();
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
