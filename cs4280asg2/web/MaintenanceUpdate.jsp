<%-- 
    Document   : MaintenanceUpdate
    Created on : 2015/4/25, 下午 05:41:09
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Maintenance</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            #updatePageContainer {
                padding-bottom: 50px;
            }
            
            #updatePageContainer h2{
                padding-left: 50px;
            }
            
            #updateItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;    
                padding-bottom: 50px;
            }
            
            #updateItemContainer table
            {
                width: 80%;
                margin: auto;
            }
            
            #updateItemContainer textarea
            {
                width: 100%;
                padding: 10px;
            }
            
            #updateItemContainer input[type=text]
            {
                width: 100%;
                padding: 10px;
            }
            
            #updateItemContainer td
            {
                border-top: 1px solid #E8E8E8;
                padding: 20px 0px;
            }
            
            input[type=button]
            {
                border : solid 1px #2490D0;
                font-size : 20px;
                color : #ffffff;
                padding: 5px 20px;
                background-color : #2490D0;
            }
            
            #updateItemContainer a
            {
                color: #2490D0;
            }
            
            #updateItemContainer a:hover
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
            <div id="updatePageContainer" class="left">
                <h2><label for="login">Update Book</label></h2>
                <div id="updateItemContainer">                    
                    <Form action="UpdateBook" method="POST">
                        <table cellspacing="0" cellpadding="0"> 
                            <tr>
                                <td colspan="2"><h3 class="center">BOOK DETAILS<h3><td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Book ID</label></td>
                                <td>${book.bookID}</td>
                            <input type="hidden" name="bookID" value="${book.bookID}"/>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Book Name</label></td>
                                <td><input type="text" value="${book.bookName}" name="bookname"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Author</label></td>
                                <td><input type="text" value="${book.author}" name="author"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Description</label></td>
                                <td><textarea rows="10" name="description">${book.bookDescription}</textarea></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Price ($)</label></td>
                                <td><input type="text" value="${book.price}" name="price"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Availablity</label></td>
                                <td><input type="text" value="${book.availability}" name="availability"></td>
                            </tr>
                            <tr>
                                <td>
                                    <label for='mypage'>
                                        Cover Picture URL<br>
                                        <a href="https://imgur.com/">https://imgur.com/</a>
                                    </label>
                                </td>
                                <td><input type="text" value="${book.imageURL}" name="imageURL"></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="center">                                
                                    <input type="submit" value="Save"/>
                                    <input type="button" value="Cancel" onclick="window.history.back()"/>
                                </td>
                            </tr>
                        </table>
                    </Form>
                </div>
            </div>                          
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
