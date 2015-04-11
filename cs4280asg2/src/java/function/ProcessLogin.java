package function;

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

public class ProcessLogin extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String previousURL = request.getParameter("requestURL");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Select * from [login] where [username] = ? and [password] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            int numRow = 0;
            if(rs != null&& rs.next() != false)
            {
                HttpSession session = request.getSession(true); 
                if(session.getAttribute("username")==null)
                {
                    String name = rs.getString("username");
                    if(rs.getInt("ismanager")==1)
                    {
                        int loyaltyPoints = rs.getInt("loyaltyPoints");
                        User user = new Customer(name,loyaltyPoints);
                    }
                    else
                    {
                        User user = new Manager(name);
                    }
                    session.setAttribute("username", rs.getString("username"));
                    if(previousURL.equals("null"))
                        response.sendRedirect("Home");
                    else
                        response.sendRedirect(previousURL);
                }
            }
            else
            {
                response.sendRedirect("Login.jsp?error=1&requestURL="+previousURL);
            }
            //end DB logic
            
        }catch (ClassNotFoundException e) {
            out.println("<div style='color: red'>" + e.toString() + "</div>");
        }catch (SQLException e) {
            out.println("<div style='color: red'>" + e.toString() + "</div>");
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