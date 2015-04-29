/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Billy
 */
public class AllOrder {
    private ArrayList<OrderList> allList;
    
    public void setAllOrderList(ArrayList<OrderList> allList)
    {
        this.allList = allList;
    }
    
    public ArrayList<OrderList> getAllOrderList()
    {
        return allList;
    }
    
    public String getAllOrderListToHtml()
    {
        
        String printList = "";
        for(OrderList o:allList)
        {
            Calendar datenow = Calendar.getInstance();
            Date startDate = o.getOrderDate().getTime();
            Date endDate = datenow.getTime();
            long startTime = startDate.getTime();
            long endTime = endDate.getTime();
            long diffTime = endTime - startTime;
            long diffDays = diffTime / (1000 * 60 * 60 * 24);
            SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
            String orderdate = dateformat.format(o.getOrderDate().getTime()); 
            printList += "<form action='RequestRefund' method='post'>";
            printList += "<table width='90%' cellspacing='0' cellpadding='0'>";
            printList += "<tr>";
            printList += "<th colspan='5'>";
            printList += "<label class='orderinfo'>Order Date: "+orderdate+"</label>";
            printList += "<label class='orderinfo'>Order ID: "+o.getOrderID()+"</label>";
            printList += "<input type='hidden' name='orderID' value='"+o.getOrderID()+"'/>";
            printList += "<label class='orderinfo'>Purchase Status: "+o.getStatusString()+"</label>";
            printList += "</th>";
            printList += "</tr>";
            printList +=  "<tr>";
            printList +=  "<td class='orderheader' width='40%'>Item</td>";
            printList +=  "<td class='orderheader' width='10%'>Price</td>";
            printList +=  "<td class='orderheader' width='10%'>Quantity</td>";
            printList +=  "<td class='orderheader' width='10%'>Net Price</td>";
            printList +=  "<td class='orderheader' width='30%'></td>";
            printList +=  "</tr>";
            int counter = 1;
            if (o.getOrderList().isEmpty())
            {
                printList += "<tr>";
                printList += "<td colspan='5'>";
                printList += "<label>No purchase history found</label>";
                printList += "</td>";
                printList += "</tr>";
            }
            else
            {
                for(Order od:o.getOrderList())
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
                    printList += "<td>"+od.getQuantity()+"</td>";
                    NumberFormat f = NumberFormat.getNumberInstance();
                    f.setMaximumFractionDigits(2);
                    f.setMinimumFractionDigits(2);
                    printList += "<td>$"+f.format(book.getPrice()*od.getQuantity())+"</td>";
                    printList += "<td rowspan="+o.getOrderList().size()+" class='ordertotal'>";
                    if(counter==1)
                    {
                        printList += "<table width='90%'>";
                        printList += "<tr>";
                        printList += "<td>Item Total</td>";
                        printList += "<td>"+o.getTotalPrice()+"</td>";
                        printList += "</tr>";
                        printList +=  "<tr>";
                        printList +=  "<td>Point Used</td>";
                        printList +=  "<td>"+o.getPointUse()+"</td>";
                        printList +=  "</tr>";
                        printList +=  "<tr>";
                        if(diffDays<=7&&o.getStatus()==1)
                        {
                            printList +=  "<td colspan='2'>";
                            printList +=  "<input type='submit' value='Refund' />";
                            printList +=  "<p>Refund should be done in 7 days</p>";
                            printList +=  "</td>";
                        }
                        printList +=  "</tr>";
                        printList += "</table>"; 
                    }
                    printList += "</td>";
                    printList += "</tr>";
                    counter++;
                }
            }
            printList += "</table>";
            printList += "</form>";
        }
        return printList;
    }
    
    public String getRefundListHtml()
    {
        String printList = "";
        if (allList.isEmpty())
        {
            printList += "<tr>";
            printList += "<td colspan='4'>";
            printList += "<label>No pending refund request found</label>";
            printList += "</td>";
            printList += "</tr>";
        }
        else
        {
            for(OrderList o:allList)
            {
                printList += "<table width='90%' cellspacing='0' cellpadding='0'>";
                printList += "<tr>";
                printList += "<th width='20%'>Order ID</th>";
                printList += "<th width='25%'>Order Details</th>";
                printList += "<th width='25%'>Request User</th>";
                printList += "<th width='30%'>Status</th>";
                printList += "</tr>";
                printList += "<tr>";
                printList += "<td>"+o.getOrderID()+"</td>";
                printList += "<td><a href='OrderDetail?orderID="+o.getOrderID()+"'>Order Details</a></td>";
                printList += "<td>"+o.getUserID()+"</td>";
                printList += "<td>"+o.getStatusString()+"</td>";
                printList += "</tr>";
                printList += "</table>";
            }
        }
        return printList;
    }
    
    public String getUserRefundListHtml()
    {
        String printList = "";
        if (allList.isEmpty())
        {
            printList += "<tr>";
            printList += "<td colspan='3'>";
            printList += "<label>No refund history found</label>";
            printList += "</td>";
            printList += "</tr>";
        }
        else
        {
            for(OrderList o:allList)
            {
                printList += "<table width='90%' cellspacing='0' cellpadding='0'>";
                printList += "<tr>";
                printList += "<th width='20%'>Order ID</th>";
                printList += "<th width='40%'>Order Details</th>";
                printList += "<th width='40%'>Status</th>";
                printList += "</tr>";
                printList += "<tr>";
                printList += "<td>"+o.getOrderID()+"</td>";
                printList += "<td><a href='OrderDetail?orderID="+o.getOrderID()+"'>Order Details</a></td>";
                printList += "<td>"+o.getStatusString()+"</td>";
                printList += "</tr>";
                printList += "</table>";
            }
        }
        return printList;
    }
}
