<%-- 
    Document   : HomePage
    Created on : 2015/4/3, 下午 08:55:00
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.*,java.util.*,controller.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
        .contentItem
        {
            text-align: center;
            padding: 1%;
            width: 290px;
            float: left;
        }    
        </style>
    </head>
    <body>
    <jsp:useBean id="booklist" type="BO.BookList" scope="request" />
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
                <jsp:getProperty name="booklist" property="homeBookList" />            
            </div>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
