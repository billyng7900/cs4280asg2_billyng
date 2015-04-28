package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import BO.*;
import CommonFunction.ConnectionHelper;
import Dao.UserDao;

public class ProcessLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ConnectionHelper cm = new ConnectionHelper();
        Connection con = null;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            con = cm.createConnection();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String previousURL = request.getParameter("requestURL");
            HttpSession session = request.getSession(true);
            UserDao dao = new UserDao();
            User user = dao.getUser(username, password,con);
            if (user != null) {
                if (session.getAttribute("user") == null) {
                    session.setAttribute("user", user);
                    if (previousURL.equals("null")) {
                        response.sendRedirect("Home");
                    } else {
                        response.sendRedirect(previousURL);
                    }
                }
            } else {
                response.sendRedirect("Login.jsp?error=1&requestURL=" + previousURL);
            }
        } catch (Exception e) {
            response.sendRedirect("Home");
        } finally {
            cm.closeConnection();
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
