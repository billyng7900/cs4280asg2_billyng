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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
/**
 *
 * @author billyng
 */
public class OrderDao {
    public int insertOrderRecord(int orderID,int userID,int bookID,int quantity)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("insert into [Order] values (?,?,?,?)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, orderID);
            pstmt.setInt(2, userID);
            pstmt.setInt(3, bookID);
            pstmt.setInt(4, quantity);
            int affectedRow = pstmt.executeUpdate();
            if(affectedRow>0)
                return 1;
            else
                return -1;
        }catch(SQLException e){
            return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }
    }
    
    public int insertOrderPoint(int orderID,int pointuse,float totalprice)
    {
        try{
            Calendar datenow = Calendar.getInstance();
            Timestamp timestamp = new Timestamp(datenow.getTimeInMillis());
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("insert into [Order] values (?,?,?,?,?,1)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt = con.prepareStatement("insert into [Order_Point] values (?,?,?,?,1)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, orderID);
            pstmt.setInt(2, pointuse);
            pstmt.setTimestamp(3, timestamp);
            pstmt.setFloat(4, totalprice);
            int affectedRow = pstmt.executeUpdate();
            if(affectedRow>0)
                return 1;
            else
                return -1;
        }catch(SQLException e){
            return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }
    }
    
    public ArrayList<Integer> getAllOrderIDByUser(int userID)
    {
        try{
            ArrayList<Integer> orderIDList = new ArrayList<Integer>();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("select distinct orderID from [Order] where userID = ? order by OrderID desc",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, userID);
            ResultSet rs = pstmt.executeQuery();
            if(rs!=null)
            {
                while(rs.next())
                {
                    int orderID = rs.getInt("orderID");
                    orderIDList.add(orderID);
                }
                return orderIDList;
            }
            return null;
        }catch(SQLException e){
            return null;
        }catch (ClassNotFoundException e) {
            return null;
        }
    }
    
    public ArrayList<Order> getOrderRecordByUser(int orderID)
    {
        try{
            ArrayList<Order> orderList = new ArrayList<Order>();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("select * from [Order] where orderID = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, orderID);
            ResultSet rs = pstmt.executeQuery();
            if(rs!=null)
            {
                while(rs.next())
                {
                   Order order = new Order();
                   int bookID = rs.getInt("bookID");
                   int quantity = rs.getInt("quantity");
                   order.setOrderID(orderID);
                   order.setBookID(bookID);
                   order.setQuantity(quantity);
                   orderList.add(order);
                }
                return orderList;
            }
            return null;
        }catch(SQLException e){
            return null;
        }catch (ClassNotFoundException e) {
            return null;
        }
    }
    
    public OrderList getOrderPointByUser(int orderID)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("select * from [Order_Point] where orderID = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, orderID);
            ResultSet rs = pstmt.executeQuery();
            if(rs!=null && rs.next()!=false)
            {
                Timestamp orderdate = rs.getTimestamp("order_date");
                int status = rs.getInt("status");
                int pointuse = rs.getInt("point_use");
                float totalprice = rs.getFloat("total_price");
                GregorianCalendar calendar = new GregorianCalendar();
                calendar.setTimeInMillis(orderdate.getTime());
                OrderList orderList = new OrderList();
                orderList.setOrderDate(calendar);
                orderList.setOrderID(orderID);
                orderList.setPointUse(pointuse);
                orderList.setTotalPrice(totalprice);
                orderList.setStatus(status);
                return orderList;
            }
            else
                return null;
        }catch(SQLException e){
            return null;
        }catch (ClassNotFoundException e) {
            return null;
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
