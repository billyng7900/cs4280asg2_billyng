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
            SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
            String orderdate = dateformat.format(o.getOrderDate().getTime()); 
            printList += "<table width='90%' cellspacing='0' cellpadding='0'>";
            printList += "<tr>";
            printList += "<th colspan='3'>";
            printList += "<label class='orderinfo'>Order Date: "+orderdate+"</label>";
            printList += "<label class='orderinfo'>Order ID: "+o.getOrderID()+"</label>";
            printList += "<label class='orderinfo'>Purchase Status: "+o.getStatusString()+"</label>";
            printList += "</th>";
            printList += "</tr>";
            printList +=  "<tr>";
            printList +=  "<td class='orderheader' width='50%'>Item</td>";
            printList +=  "<td class='orderheader' width='20%'>Price</td>";
            printList +=  "<td class='orderheader' width='30%'></td>";
            printList +=  "</tr>";
            int counter = 1;
            for(Order od:o.getOrderList())
            {
                Book book = od.getBook();
                printList +=  "<tr>";
                printList +=  "<td>";
                printList += "<p>";
                printList += "<img src='image/" + book.getImageURL()+ ".jpg' height='150px'><br>";
                printList +=  book.getBookName();
                printList +=  "</p>";
                printList += "</td>";
                printList += "<td>$"+book.getPrice()+"</td>";
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
                    printList +=  "<td colspan='2'>";
                    printList +=  "<input type='button' value='Refund' onclick='window.location.href='RefundPage.jsp''>";
                    printList +=  "</td>";
                    printList +=  "</tr>";
                    printList += "</table>"; 
                }
                printList += "</td>";
                printList += "</tr>";
                counter++;
           }
            printList += "</table>";
        }
        return printList;
    }
}
