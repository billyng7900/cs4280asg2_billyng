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
            <h3>Shopping Cart</h3>
            <table id="shoppingCart">
                <tr>
                    <td width="150px"></td>
                    <td width="500px"></td>
                    <td width="150px">Price</td>
                    <td width="150px">Quantity</td>
                </tr>
                <tr>
                    <td>
                        <a href="DetailPage.jsp?bookID=1"><image src="image/book_1.jpg" height="150px"></a>
                    </td>
                    <td>
                        <label style="text-decoration: bold; font-size: 20px">
                            Java: A Beginner's Guide
                        </label>
                        <label style="font-size: 12px;">
                            by Herbert Schildt<br><br>
                        </label>
                    </td>
                    <td><label>$24.37</label></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <a href="DetailPage.jsp?bookID=1"><image src="image/book_1.jpg" height="150px"></a>
                    </td>
                    <td>
                        <label style="text-decoration: bold; font-size: 20px">
                            Java: A Beginner's Guide
                        </label>
                        <label style="font-size: 12px;">
                            by Herbert Schildt<br><br>
                        </label>
                    </td>
                    <td><label>$24.37</label></td>
                    <td></td>
                </tr>
            </table>
            
            
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
