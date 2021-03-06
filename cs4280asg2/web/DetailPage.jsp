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
            #detailPageContainer
            {
                width: 90%;
                margin: auto;
                padding-bottom: 50px;
            }
            
            #detailItemContainer
            {
                float: left;
                width: 100%;
                padding-bottom: 50px;
            }
            
            #detailItemContainer td
            {
                width: 100%;
                word-wrap: break-word;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">            
            $(document).ready(function()
            {
                $.urlParam = function(name)
                {
                    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
                    return results[1] || 0;
                }
                              
                if ($.urlParam('message')!=null)
                {                   
                    if ($.urlParam('message')=="1")
                    {
                        var msgBox = $("#msgContainer");
                        msgBox.css('display','block');
                        msgBox.html("<image src='image/ui-icon-error.png' alt='error' /> This item is added into your cart");
                    }
                }
            });
        </script>
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
            <div id="detailPageContainer">
                <div id="detailItemContainer" >
                    <div style="float: left; width: 35%">
                        <img src="<jsp:getProperty name='book' property='imageURL' />" alt="<jsp:getProperty name='book' property='bookName' />">
                    </div>
                    <div style="float: left; width: 65%">
                        <div id="msgContainer"></div>
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
                            <%
                                if(book.getAvailability()>0){
                            %>
                            <tr>
                                <td style="color: #477519">
                                    In Stock
                                </td>
                            </tr>
                            <%        
                                }else{
                            %>
                            <tr>
                                <td style="color: #FF3300">
                                    Out of Stock
                                </td>
                            </tr>
                            <% 
                                }
                            %>
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
                                            <jsp:getProperty name="book" property="bookDescriptionHTML" />
                                        </p>
                                    </fieldset>
                                    </form>
                                </td>
                            </tr>
                            <%
                                if(book.getAvailability()>0){
                            %>
                            <tr>
                                <td style="text-align: right">
                                    <form action="ShoppingCartAddController" method="POST">
                                    <input type="hidden" name="bookID" value="<jsp:getProperty name='book' property='bookID' />"/>
                                    <input type="submit" value="Add to cart" />
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
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
