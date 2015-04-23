/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import BO.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.util.Calendar;
/**
 *
 * @author billyng
 */
public class OrderDao {
    public int insertOrderRecord(int orderID,int userID,int bookID,int quantity,int pointuse)
    {
        try{
            Calendar datenow = Calendar.getInstance();
            Timestamp timestamp = new Timestamp(datenow.getTimeInMillis());
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("insert into [Order] values (?,?,?,?,?,1,?)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, orderID);
            pstmt.setInt(2, userID);
            pstmt.setInt(3, bookID);
            pstmt.setInt(4, quantity);
            pstmt.setTimestamp(5, timestamp);
            pstmt.setInt(6, pointuse);
            pstmt.executeUpdate();
            return 1;
        }catch(SQLException e){
            return 0;
        }catch (ClassNotFoundException e) {
            return 0;
        }
    }
    
    public int getNewOrderID()
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = smt.executeQuery("Select [orderID] from [Order] order by [orderID] desc");
            int latestorderid = -1;
            if(rs!= null)
            {
                if(rs.next()!=false)
                {
                    latestorderid = rs.getInt("orderID");
                    return ++latestorderid;
                }
                else
                {
                    return 1;//no previous order id.
                }
            }
            else
            {
                return -1;
            }
        }catch(SQLException e){
            return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }
    }
}
