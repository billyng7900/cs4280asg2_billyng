/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.text.SimpleDateFormat;
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
    
    public String getOrderRefund()
    {
        String printList = "";
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String orderDate = dateformat.format(orderdate.getTime()); 
        printList += "<table width='90%' cellspacing='0' cellpadding='0'>";
        printList += "<tr>";
        printList += "<th colspan='4'>";
        printList += "<label class='orderinfo'>Order Date: "+orderDate+"</label>";
        printList += "<label class='orderinfo'>Order ID: "+orderID+"</label>";
        printList += "<input type='hidden' name='orderID' value='"+orderID+"'/>";
        printList += "<label class='orderinfo'>Purchase Status: "+getStatusString()+"</label>";
        printList += "</th>";
        printList += "</tr>";
        printList +=  "<tr>";
        printList +=  "<td class='orderheader' width='40%'>Item</td>";
        printList +=  "<td class='orderheader' width='15%'>Price</td>";
        printList +=  "<td class='orderheader' width='15%'>Quantity</td>";
        printList +=  "<td class='orderheader' width='30%'></td>";
        printList +=  "</tr>";
        int counter = 1;
        for(Order od:orderList)
        {
            Book book = od.getBook();
            printList +=  "<tr>";
            printList +=  "<td>";
            printList += "<p>";
            printList += "<img src='" + book.getImageURL()+ "' height='150px'><br>";
            printList +=  book.getBookName();
            printList +=  "</p>";
            printList += "</td>";
            printList += "<td>$"+book.getPrice()+"</td>";
            printList += "<td>$"+od.getQuantity()+"</td>";
            printList += "<td rowspan="+orderList.size()+" class='ordertotal'>";
            if(counter==1)
            {
                printList += "<table width='90%'>";
                printList += "<tr>";
                printList += "<td>Item Total</td>";
                printList += "<td>"+totalprice+"</td>";
                printList += "</tr>";
                printList +=  "<tr>";
                printList +=  "<td>Point Used</td>";
                printList +=  "<td>"+pointuse+"</td>";
                printList +=  "</tr>";
                printList +=  "<tr>";
                printList +=  "</tr>";
                printList += "</table>"; 
            }
            printList += "</td>";
            printList += "</tr>";
            counter++;
       }
        printList += "</table>";
        return printList;
    }
}
