/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Billy
 */
public class OrderList {
    private ArrayList<Order> orderList;
    private int orderID;
    private int pointuse;
    private Calendar orderdate;
    private int status;
    private float totalprice;
    
    public void setOrderList(ArrayList<Order> orderList)
    {
        this.orderList = orderList;
    }
    
    public ArrayList<Order> getOrderList()
    {
        return orderList;
    }
    
    public void setOrderID(int orderID)
    {
        this.orderID = orderID;
    }
    
    public int getOrderID()
    {
        return orderID;
    }
    
    public void setTotalPrice(float totalprice)
    {
        this.totalprice = totalprice;
    }
    
    public float getTotalPrice()
    {
        return totalprice;
    }
    
    public void setPointUse(int pointuse)
    {
        this.pointuse = pointuse;
    }
    
    public int getPointUse()
    {
        return pointuse;
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
    
    public String getStatusString()
    {
        if(status==1)
            return "Success";
        else if(status==2)
            return "requested for refund";
        else 
            return "refund success";
    }
}
