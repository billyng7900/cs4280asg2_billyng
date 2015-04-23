/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.util.*;

/**
 *
 * @author billyng
 */
public class Order {
    private int orderID;
    private int bookID;
    private int quantity;
    private Calendar orderdate;
    private int status;
    private int pointuse;
    
    public Order(int orderID,int bookID,int quantity,Calendar order_date,int status,int pointuse)
    {
        
    }
    
    public void setOrderID(int orderID)
    {
        this.orderID = orderID;
    }
    
    public int getOrderID()
    {
        return orderID;
    }
    
    public void setBookID(int bookID)
    {
        this.bookID = bookID;
    }
    
    public int getBookID()
    {
        return bookID;
    }
    
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }
    
    public int getQuantity()
    {
        return quantity;
    }
    
    public void setOrderDate(Calendar orderdate)
    {
        this.orderdate = orderdate;
    }
    
    public Calendar getOrderDate()
    {
        return orderdate;
    }
    
    public void setStatus(int status)
    {
        this.status = status;
    }
    
    public int getStatus()
    {
        return status;
    }
    
    public void setPointUse()
    {
        this.pointuse = pointuse;
    }
    
    public int getPointUse()
    {
        return pointuse;
    }
}
