<%-- 
    Document   : MaintenancePage
    Created on : 2015/4/25, 下午 03:59:35
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.*,java.util.*,controller.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Maintenance</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            #maintenancePageContainer{
                padding-bottom: 50px;
            }
            
            #maintenancePageContainer h2{
                padding-left: 50px;
            }
            
            #maintenanceItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;    
                padding-bottom: 50px;
            }
            
            #maintenanceItemContainer table
            {
                margin: auto;
                text-align: center;
            }
            
            #maintenanceItemContainer td
            {
                border-top: 1px solid #E8E8E8;
                padding: 20px 0px;
            }
            
            #searchbox
            {
                padding-left: 70px;
                padding-bottom: 10px;
            }
            
            #searchbook
            {
                margin: 0px;
                padding: 5px 15px;
                font-family: Arial, Helvetica, sans-serif;
                font-size:14px;
                border:1px solid #CFCFCF; 
                border-right:0px;
            }
            
            #searchbtn
            {
                margin: 0px;
                padding: 5px 15px;
                font-family: Arial, Helvetica, sans-serif;
                font-size:14px;
                border:1px solid #CFCFCF;
                background-color: #E6E6E6;
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
            <div id="maintenancePageContainer">
                <h2>Book Maintenance</h2>
                <form action="SearchMaintenance" method="get">
                <table cellspacing="0" cellpadding="0" id="searchbox">
                    <td>
                        <input id="searchbook" type="text" name="seach_query" placeholder="Search for books"> 
                    </td>
                    <td>
                        <input id="searchbtn" type="submit" value="Go">
                    </td>
                    <td style="padding-left: 50px">
                        <a href="MaintenanceCreate.jsp">Add New Book</a>
                    </td>
                </table>
                </form>
                <div id="maintenanceItemContainer">                    
                    <table cellspacing="0" cellpadding="0" width="90%">                                                        
                        <tr>
                            <th colspan="5"><h3 class="center">BOOKS</h3></th>
                            
                        </tr>
                        <tr>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Availability</th>
                            <th></th>
                            <th></th>
                        </tr>
                        ${booklist.maintenanceBookList}
                    </table>
                </div>
            </div>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>
