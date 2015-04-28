/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import Dao.UserDao;
import BO.*;
import CommonFunction.CommonFunction;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author yuchunng3
 */
public class RegisterController extends HttpServlet {

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
        CommonFunction cm = new CommonFunction();
        Connection con = null;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            con = cm.createConnection();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String realname = request.getParameter("realname");
            int contact = Integer.parseInt(request.getParameter("contact"));
            UserDao dao = new UserDao();
            User isUserNameRepeated = dao.getUserByUserName(username,con);
            if(isUserNameRepeated == null)
            {
                con.setAutoCommit(false);
                int success = dao.registerUser(username, password,realname, contact, con);
                if(success==1)
                {
                    cm.commitConnection();
                    response.sendRedirect("Home");
                }
                else
                {
                    cm.rollbackConnection();
                    response.sendRedirect("Login.jsp");
                }
            }
            else
            {
                response.sendRedirect("RegistrationPage.jsp?error=1");
            }
        } catch (Exception e) {
            cm.rollbackConnection();
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
