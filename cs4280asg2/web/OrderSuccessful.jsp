<%-- 
    Document   : OrderSuccessful
    Created on : 2015/4/25, 下午 11:00:57
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Successful</title>
        <style>
            #successfulItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;    
                padding-bottom: 50px;
                text-align: center;
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
            <div id="successfulItemContainer">                    
                    <h2>Thank You For Ordering</h2>
                    <input type="button" value="View My History" onclick="window.location.href='PurchaseHistory'">
                    <input type="button" value="Go To Home Page" onclick="window.location.href='Home'">
            </div>                       
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
