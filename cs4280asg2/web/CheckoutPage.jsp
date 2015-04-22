<%-- 
    Document   : CheckoutPage
    Created on : 22-Apr-2015, 18:12:40
    Author     : WaiHing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />        
        </div>
        
        <div id="topPanel">
        <div class="topnav">
            <div style="float: left">
                <img src="image/ui-icon-logo.png" alt=""/>                
            </div>
            <div id="searcharea">
     <!--           <form id="searchform" action="">
                    <input type="text" id="searchvalue" placeholder="Search for books" value="">
                    <input type="submit" id="search" value="">
                </form>-->
                <form method="get" action=""> 
                    <table cellpadding="0px" cellspacing="0px" style="vertical-align: middle"> 
                        <tr> 
                            <td >
                                <input id="searchquery" type="text" name="seach_query" placeholder="Search for books"> 
                            </td>
                            <td> 
                                <input id="search" type="submit" value="" style="">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
