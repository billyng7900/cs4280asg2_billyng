<%-- 
    Document   : PurchaseHistory
    Created on : Apr 24, 2015, 4:34:04 PM
    Author     : waihingli3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase History</title>
        <style>
            #historyPageContainer
            {
                padding-bottom: 50px;
            }
            
            #historyPageContainer h2
            {
                padding-left: 50px;
            }
            
            #historyItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
                padding-bottom: 50px;
            }
            
            #historyItemContainer table
            {
                margin: auto;
                font-size: 14px;
                text-align: center;
                padding-bottom: 50px;
            }
            
            #historyItemContainer th
            {
                background-color: #828282;
                color: #FFFFFF;
                height: 50px;
            }
          
            #historyItemContainer td
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
            <div id="historyPageContainer" class="left">
                <h2><label for="history">Purchase History</label></h2>
                <div id="historyItemContainer">
                    <h3 class="center">ORDER HISTORY</h3>
                    ${allOrder.allOrderListToHtml}
                </div>
            </div>       
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>
