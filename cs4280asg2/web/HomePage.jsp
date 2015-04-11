<%-- 
    Document   : HomePage
    Created on : 2015/4/3, 下午 08:55:00
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.*,java.util.*,function.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
    <jsp:useBean id="booklist" type="BO.BookList" scope="request" />
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />        
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="common/Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">                    
            <jsp:getProperty name="booklist" property="bookList" />            
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
