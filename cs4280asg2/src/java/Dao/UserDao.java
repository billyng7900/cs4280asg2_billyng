/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;


import java.util.*;

import BO.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
/**
 *
 * @author yuchunng3
 */
public class UserDao {
    public int registerUser(String username, String password,String realname)
    {
        Connection con = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("insert into [User] values (?,?,0,0,?)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, realname);
            int affectedRow = pstmt.executeUpdate();
            if(affectedRow>0)
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }catch (ClassNotFoundException e) {
            if (con != null) {
            }
            return -1;
        }catch (SQLException e) {
            return -1;
        } 
    }
    
    public User getUser(String username, String password)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Select * from [User] where [username] COLLATE Latin1_General_CS_AS = ? COLLATE Latin1_General_CS_AS and [password] COLLATE Latin1_General_CS_AS = ? COLLATE Latin1_General_CS_AS",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            int numRow = 0;
            if(rs != null&& rs.next() != false)
            {
                String name = rs.getString("username");
                int userId = rs.getInt("userid");
                String realname = rs.getString("real_name");
                User user = new User();
                user.setUserName(username);
                user.setUserId(userId);
                user.setRealName(realname);
                if(rs.getInt("ismanager")==1)
                {
                    user.setIsManager(true); 
                }
                else
                {
                    int loyaltyPoints = rs.getInt("loyaltyPoints");
                    user.setUserName(username);
                    user.setIsManager(true);
                    user.setLoyaltyPoints(loyaltyPoints);
                }
                return user;
            }
            else
                return null;
        }
        catch (ClassNotFoundException e) {
            return null;
        }catch (SQLException e) {
            return null;
        } 
    }
    
    public int updateUser(String realname,int userID)
    {
       try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Update [User] SET [Real_name] = ? where [userID] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, realname);
            pstmt.setInt(2,userID);
            int affectRows = pstmt.executeUpdate();
            if(affectRows>0)
                return 1;
            else
                return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }catch (SQLException e) {
            return -1;
        }  
    }
    
    public int updateUserPoint(int userID,int newPoint)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Update [User] SET [loyaltypoints] = ? where [userID] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, newPoint);
            pstmt.setInt(2, userID);
            int affectRows = pstmt.executeUpdate();
            if(affectRows>0)
                return 1;
            else
                return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }catch (SQLException e) {
            return -1;
        } 
    }
    
    public int getUserLoyaltyPoints(int userID)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Select [loyaltypoints] from [User] where [userID] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, userID);
            ResultSet rs = pstmt.executeQuery();
            if(rs!=null&&rs.next()!=false)
            {
                int loyaltypoints = rs.getInt("loyaltypoints");
                return loyaltypoints;
            }
            else
            {
                return -1;
            }
        }catch (ClassNotFoundException e) {
            return -1;
        }catch (SQLException e) {
            return -1;
        } 
    }
    
    public User getUserByUserName(String username)
    {
         try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Select * from [User] where [username] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if(rs != null&& rs.next() != false)
            {
               String name = rs.getString("username");
                int userId = rs.getInt("userid");
                String realname = rs.getString("real_name");
                User user = new User();
                user.setUserName(username);
                user.setUserId(userId);
                user.setRealName(realname);
                if(rs.getInt("ismanager")==1)
                {
                    user.setIsManager(true); 
                }
                else
                {
                    int loyaltyPoints = rs.getInt("loyaltyPoints");
                    user.setUserName(username);
                    user.setIsManager(true);
                    user.setLoyaltyPoints(loyaltyPoints);
                }
                return user;
            }
            else
                return null;
         }
         catch (ClassNotFoundException e) {
            return null;
        }catch (SQLException e) {
            return null;
        } 
         
    }
}
