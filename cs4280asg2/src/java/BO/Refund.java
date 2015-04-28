/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

/**
 *
 * @author billyng
 */
public class Refund {
    private OrderList orderlist;
    private String reason;
    
    public void setOrderList(OrderList orderlist)
    {
        this.orderlist = orderlist;
    }
    
    public OrderList getOrderList()
    {
        return orderlist;
    }
    
    public void setReason(String reason)
    {
        this.reason = reason;
    }
    
    public String getReason()
    {
        return reason;
    }
    
    public String getReasonHtml()
    {
        String printlist = "";
        printlist += "<p>";
        printlist += "Reason for refund:";
        printlist += "</p>";
        printlist +="<div id='refundReason'>";
        printlist += "<p>"+reason+"</p>";
        printlist += "</div>";
        return printlist;
    }
}
