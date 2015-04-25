<%-- 
    Document   : MaintenanceCreate
    Created on : 2015/4/25, 下午 06:08:59
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
            #createPageContainer {
                padding-bottom: 50px;
            }
            
            #createPageContainer h2{
                padding-left: 50px;
            }
            
            #createItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;    
                padding-bottom: 50px;
            }
            
            #createItemContainer table
            {
                width: 80%;
                margin: auto;
            }
            
            #createItemContainer textarea
            {
                width: 100%;
                padding: 10px;
            }
            
            #createItemContainer input[type=text]
            {
                width: 100%;
                padding: 10px;
            }
            
            #createItemContainer td
            {
                border-top: 1px solid #E8E8E8;
                padding: 20px 0px;
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
            <div id="createPageContainer" class="left">
                <h2><label for="login">Create Book</label></h2>
                <div id="createItemContainer">                    
                    <Form action="">
                        <table cellspacing="0" cellpadding="0"> 
                            <tr>
                                <td colspan="2"><h3 class="center">BOOK DETAILS<h3><td>
                            </tr>                            
                            <tr>
                                <td><label for='mypage'>Book Name</label></td>
                                <td><input type="text" value="" name="bookname"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Author</label></td>
                                <td><input type="text" value="" name="author"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Description</label></td>
                                <td><textarea rows="10" name="description"></textarea></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Price ($)</label></td>
                                <td><input type="text" value="" name="price"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Availablity</label></td>
                                <td><input type="text" value="" name="availability"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Cover Picture</label></td>
                                <td><input type="text" value="" name="bookcover"></td>
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
