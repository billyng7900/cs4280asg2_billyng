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

    public int insertOrderRecord(int orderID, int bookID, int quantity, Connection con) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("insert into [Order] values (?,?,?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        try {
            pstmt.setInt(1, orderID);
            pstmt.setInt(2, bookID);
            pstmt.setInt(3, quantity);
            int affectedRow = pstmt.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            } else {
                return -1;
            }
        } finally {
            pstmt.close();
        }
    }

    public int insertOrderPoint(int orderID, int pointuse, float totalprice, int userID, Connection con) throws SQLException {
        Calendar datenow = Calendar.getInstance();
        Timestamp timestamp = new Timestamp(datenow.getTimeInMillis());
        PreparedStatement pstmt = con.prepareStatement("insert into [Order_Point] values (?,?,?,?,1,?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        try {
            pstmt.setInt(1, orderID);
            pstmt.setInt(2, pointuse);
            pstmt.setTimestamp(3, timestamp);
            pstmt.setFloat(4, totalprice);
            pstmt.setInt(5, userID);
            int affectedRow = pstmt.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            } else {
                return -1;
            }
        } finally {
            pstmt.close();
        }
    }

    public ArrayList<Integer> getAllOrderIDByUser(int userID, int status, Connection con) throws SQLException {
        ArrayList<Integer> orderIDList = new ArrayList<Integer>();
        PreparedStatement pstmt = con.prepareStatement("select distinct orderID from [Order_Point] where userID = ? and status = ? order by OrderID desc", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        try {
            pstmt.setInt(1, userID);
            pstmt.setInt(2, status);
            ResultSet rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    orderIDList.add(orderID);
                }
                return orderIDList;
            }
            return null;
        } finally {
            pstmt.close();
        }
    }

    public boolean getOrderIsUser(int orderID, int userID, Connection con) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("select * from [Order_Point] where orderID = ? and userID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        try {
            pstmt.setInt(1, orderID);
            pstmt.setInt(2, userID);
            ResultSet rs = pstmt.executeQuery();
            if (rs != null && rs.next() != false) {
                return true;
            } else {
                return false;
            }
        } finally {
            pstmt.close();
        }
    }

    public ArrayList<Order> getOrderRecordByOrderID(int orderID, Connection con) throws SQLException {
        ArrayList<Order> orderList = new ArrayList<Order>();
        PreparedStatement pstmt = con.prepareStatement("select * from [Order] where orderID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        try {
            pstmt.setInt(1, orderID);
            ResultSet rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    Order order = new Order();
                    int bookID = rs.getInt("bookID");
                    int quantity = rs.getInt("quantity");
                    order.setOrderID(orderID);
                    order.setBookID(bookID);
                    order.setQuantity(quantity);
                    orderList.add(order);
                }
                rs.close();
                return orderList;
            }
            return null;
        } finally {
            pstmt.close();
        }
    }

    public OrderList getOrderPointByOrderID(int orderID, Connection con) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("select * from [Order_Point] where orderID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        try {
            pstmt.setInt(1, orderID);
            ResultSet rs = pstmt.executeQuery();
            if (rs != null && rs.next() != false) {
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
                rs.close();
                return orderList;
            } else {
                return null;
            }
        } finally {
            pstmt.close();
        }
    }

    public ArrayList<OrderList> getRefundList(Connection con) throws SQLException {
        ArrayList<OrderList> orderList = new ArrayList<OrderList>();
        Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = smt.executeQuery("Select * from [Order_Point] where status = 2 order by [orderID] desc");
        if (rs != null) {
            while (rs.next()) {
                OrderList order = new OrderList();
                int orderID = rs.getInt("orderID");
                int orderStatus = rs.getInt("status");
                int userID = rs.getInt("userID");
                order.setOrderID(orderID);
                order.setUserID(userID);
                order.setStatus(orderStatus);
                orderList.add(order);
            }
            return orderList;
        }
        return null;
    }

    public ArrayList<OrderList> getUserRefundList(int userID, Connection con) throws SQLException {
        ArrayList<OrderList> orderList = new ArrayList<OrderList>();
        PreparedStatement pstmt = con.prepareStatement("Select * from [Order_Point] where (status = 2 or status = 3 or status = 4) and userID = ? order by [orderID] desc", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        pstmt.setInt(1, userID);
        ResultSet rs = pstmt.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                OrderList order = new OrderList();
                int orderID = rs.getInt("orderID");
                int orderStatus = rs.getInt("status");
                order.setOrderID(orderID);
                order.setUserID(userID);
                order.setStatus(orderStatus);
                orderList.add(order);
            }
            return orderList;
        }
        return null;
    }

    public int getNewOrderID(Connection con) throws SQLException {
        Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = smt.executeQuery("Select [orderID] from [Order_Point] order by [orderID] desc");
        int latestorderid = -1;
        if (rs != null) {
            if (rs.next() != false) {
                latestorderid = rs.getInt("orderID");
                return ++latestorderid;
            } else {
                return 1;//no previous order id.
            }
        } else {
            return -1;
        }
    }

    public int updateOrderStatus(int orderID, int newStatus, Connection con) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("update [Order_Point] set status = ? where orderID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        pstmt.setInt(1, newStatus);
        pstmt.setInt(2, orderID);
        int affectedRow = pstmt.executeUpdate();
        if (affectedRow > 0) {
            return 1;
        } else {
            return -1;
        }
    }
}
