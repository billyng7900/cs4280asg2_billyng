<%-- 
    Document   : RegistrationPage
    Created on : 2015/4/11, 下午 10:22:54
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="common/Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">
            <table>
                <tr>
                    <td>Login Username:</td>
                    <td><input type="text" id="username" name="username" value=""/></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" id="name" name="name" value=""/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" id="password" name="password" value=""/></td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td><input type="pw_confirm" id="password" name="pw_confirm" value=""/></td>
                </tr>               
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
