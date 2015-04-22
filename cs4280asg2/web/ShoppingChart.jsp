<%-- 
    Document   : ShoppingChart
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
    </head>
    
    <body>
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="common/Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">
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
            <table class="shoppingCart">
                <form action="Purchase" method="POST">
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
                </form>
            </table>
            <%
                }
            %>
            
            
            
            
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
