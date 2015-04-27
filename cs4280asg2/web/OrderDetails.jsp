<%-- 
    Document   : OrderDetails
    Created on : 2015/4/26, 下午 11:01:52
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            #orderPageContainer
            {
                padding-bottom: 50px;
            }
            
            #orderPageContainer h2
            {
                padding-left: 50px;
            }
            
            #orderItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
                text-align: center;
                padding-bottom: 50px;
            }
            
            #orderItemContainer table
            {
                margin: auto;
                font-size: 14px;
                text-align: center;
                padding-bottom: 50px;
            }
            
            #orderItemContainer th
            {
                background-color: #828282;
                color: #FFFFFF;
                height: 50px;
            }
          
            #orderItemContainer td
            {
                height: 50px;
            }
            
            .orderinfo
            {
                padding-left: 5em;
            }
            
            .orderheader
            {
                background-color: #E0E0E0;
                text-align: center;
                width: 20%;
            }
            
            .ordertotal
            {
                background-color: #FFFFFF;
                vertical-align: top;
            }
        </style>
    </head>
    <body>
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>        
        <div id="topPanel">
            <div class="topnav">
                <jsp:include page="common/TopPanel.html" flush="true" />
                <jsp:include page="Menu" flush="true" /> 
            </div>
        </div>
        <div id="centerPanel">                   
            <div id="orderPageContainer" class="left">
                <h2><label for="history">Purchase History</label></h2>
                <div id="orderItemContainer">
                    <h3 class="center">ORDER HISTORY</h3>
                    <table width="90%" cellspacing="0" cellpadding="0">
                        <tr>
                            <th colspan="5">
                                <label class="orderinfo">Order Date: 2015/04/24 17:17</label>
                                <label class="orderinfo">Order ID: 0000000000</label>
                                <label class="orderinfo">Purchase Status: Success</label>
                            </th>
                        </tr>
                        <tr>
                            <td class="orderheader" width="40%">Item</td>
                            <td class="orderheader" width="10%">Price</td>
                            <td class="orderheader" width="10%">Quantity</td>
                            <td class="orderheader" width="10%">Net Price</td>
                            <td class="orderheader" width="30%"></td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <img src="image/book_1.jpg" height="150px"><br>
                                    Java: A Beginner's Guide Paperback
                                </p>
                            </td>
                            <td>$24.37</td>
                            <td>1</td>
                            <td>$24.37</td>
                            <td rowspan="2" class="ordertotal">
                                <table width='90%'>
                                    <tr>
                                        <td>Item Total</td>
                                        <td>$48.74</td>
                                    </tr>
                                    <tr>
                                        <td>Point Used</td>
                                        <td>0</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>                       
                    </table>                    
                    <input type='button' value="Accept">
                    <input type='button' value="Reject">
                    <br>Above: only role=manager, Below: user //please delete me<br>
                    <input type="button" value="Back" onclick="window.history.back()">
                </div>
            </div>       
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>
