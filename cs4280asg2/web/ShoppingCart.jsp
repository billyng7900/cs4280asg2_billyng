<%-- 
    Document   : ShoppingCart
    Created on : 2015/4/10, 下午 03:44:06
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            h2{
                padding-left: 50px;
            }
            
            .shoppingCart td
            {
               vertical-align: top;
               border-bottom: solid;
               border-width: 1px;
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
            <%
                if(session.getAttribute("cart")==null)
                {
            %>
                <!--If no items in cart-->
                <h2>No Items Yet</h2>
            <%
                }
                else
                {
            %>
            <form action="Order" method="POST">
            <table class="shoppingCart" cellspacing="0" cellpadding="0">              
                <tr>
                    <td width="150px" style="font-size: 20px">Shopping Cart</td>
                    <td width="500px"></td>
                    <td width="150px">Price</td>
                    <td width="150px">Quantity</td>
                </tr>
                    ${cart.cartBookList}
                <tr>
                    <td colspan="4" style="text-align: right; border-style: none">
                        <br><input type="submit" value="Checkout"/>
                    </td>
                </tr>
            </table>
            </form>
            <%
                }
            %>
         </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
