<%-- 
    Document   : RefundPage
    Created on : 2015/4/26, 上午 12:14:38
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Refund</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            #refundPageContainer
            {
                padding-bottom: 50px;
            }
            
            #refundPageContainer h2
            {
                padding-left: 50px;
            }
            
            #refundItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
                text-align: center;
                padding-bottom: 50px;
            }
            
            #refundItemContainer table
            {
                margin: auto;
                font-size: 14px;
                text-align: center;
                padding-bottom: 50px;
            }
            
            #refundItemContainer th
            {
                background-color: #828282;
                color: #FFFFFF;
                height: 50px;
            }
          
            #refundItemContainer td
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
            <div id="refundPageContainer" class="left">
                <h2><label for="history">Refund</label></h2>
                <div id="refundItemContainer">
                    <form action="ProcessRefund" method="POST">
                    <h3 class="center">ORDER HISTORY</h3>
                    ${orderList.orderRefundRequestHtml}
                    <p>
                        Reason for refund:
                    </p>
                        <textarea name="reason" rows="5" style="width: 500px"></textarea>                   
                    <p style='color: red'>
                        Confirm to refund?                       
                    </p>
                    <input type='submit' value="Refund">
                    </form>
                </div>
            </div>       
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>
