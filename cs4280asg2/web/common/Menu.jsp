<%-- 
    Document   : Menu
    Created on : 2015/4/17, 下午 05:56:50
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:useBean id="menuList" type="BO.MenuList" scope="request" />
        <a href="Home">
            <div id="logo" style="text-align: center">
                logologologo<br>
                logologologo<br>
                logologologo<br>
                logologologo<br>
                logologologo<br>
            </div>
        </a>
        <jsp:getProperty name="menuList" property="menuList" />
    </body>
</html>
