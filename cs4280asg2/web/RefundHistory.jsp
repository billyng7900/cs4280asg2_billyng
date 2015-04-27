<%-- 
    Document   : RefundHistory
    Created on : 27-Apr-2015, 09:54:49
    Author     : WaiHing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Refund History</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            #refundPageContainer
            {
                width: 90%;
                margin: auto;
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
                padding-bottom: 50px;
            }
            
            #refundItemContainer table
            {
                margin: auto;
                text-align: center;
            }
            
            #refundItemContainer td
            {
                border-top: 1px solid #E8E8E8;
                padding: 20px 0px;
            }
                      
            #refundItemContainer a
            {
                color: #2490D0;
            }
            
            #refundItemContainer a:hover
            {
                text-decoration: underline;
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
                <h2><label for="history">Refund History</label></h2>
                <div id="refundItemContainer">
                    <h3 class="center">ALL HISTORY</h3>
                    ${refundlist.userRefundListHtml}
                </div>
            </div>       
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>
