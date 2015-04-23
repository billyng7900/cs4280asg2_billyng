<%-- 
    Document   : DetailPage
    Created on : 2015/4/5, 下午 11:05:02
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            .detailItem
            {
                float: left;
            }

        </style>
    </head>
    
    <body>
    <jsp:useBean id="book" type="BO.Book" scope="request" />
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
            <div id="leftPanel">           
                <jsp:include page="common/Menu.html" flush="true" />  
            </div>
            <div id="mainPanel">
                <div class="detailItem" >
                    <div style="float: left; width: 300px; text-align: center">
                        <img src="image\<jsp:getProperty name='book' property='imageURL' />.jpg" alt="<jsp:getProperty name='book' property='bookName' />">
                    </div>
                    <div style="float: left; width: 60%">
                        <table>
                            <tr>                            
                                <td style="text-decoration: bold; font-size: 20px">
                                    <jsp:getProperty name="book" property="bookName" />
                                </td>                                
                            </tr>
                            <tr>
                                <td style="font-size: 12px;">
                                    by <jsp:getProperty name="book" property="author" /><br><br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Price: $<jsp:getProperty name="book" property="price" />
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <form>
                                    <fieldset>
                                    <legend>Book Description</legend>
                                        <p>                                        
                                            <jsp:getProperty name="book" property="bookDescription" />
                                        </p>
                                    </fieldset>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <form action="ShoppingCartAddController" method="POST">
                                    <input type="hidden" name="bookID" value="<jsp:getProperty name='book' property='bookID' />"/>
                                    <input type="submit" value="Add to cart" />
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>
