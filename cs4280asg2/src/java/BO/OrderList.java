/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.util.ArrayList;

/**
 *
 * @author Billy
 */
public class OrderList {
    private ArrayList<Order> orderList;
    
    public void setOrderList(ArrayList<Order> orderList)
    {
        this.orderList = orderList;
    }
    
    public ArrayList<Order> getOrderList()
    {
        return orderList;
    }
}
