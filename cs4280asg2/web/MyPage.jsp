<%-- 
    Document   : MyPage
    Created on : 2015/4/12, 下午 07:24:39
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Page</title>
    </head>
    <body>
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />        
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="common/Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">  
            <Form action="">
                <table style="background-color: #F1F6F7; margin: auto">
                    <tr>
                        <td colspan="2" style="background-color: #1A6781; color: #FFFFFF; text-align: center"><b>My Account Details</b></td>
                    </tr>
                    <tr>
                        <td><label for='username'>Username:</label></td>
                        <td>${user.userName}</td>
                    </tr>
                    <tr>
                        <td><label for='realname'>Real Name:</label></td>
                        <td><input type="text" id="realname" name="realname" value="//from db"/></td>
                    </tr>                    
                    <tr>
                        <td><label for='points'>Loyalty Points:</label></td>
                        <td>${user.loyaltyPoints}</td>
                    </tr>
                    <tr>
                        <td><label for='history'>Purchase History:</label></td>
                        <td><a href='#' ><u>Purchase History</u></a></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color: #1A6781; color: #FFFFFF; text-align: center"><b>Change Password</b></td>
                    </tr>
                    <tr>
                        <td><label for='password'>Old Password:</label></td>
                        <td><input type='text' name='oldpw' value=''></td>
                    </tr>
                    <tr>
                        <td><label for='password'>New Password:</label></td>
                        <td><input type='text' name='newpw' value=''></td>
                    </tr>
                    <tr>
                        <td><label for='password'>Confirm New Password:</label></td>
                        <td><input type='text' name='confirm_newpw' value=''></td>
                    </tr>
                    <tr>
                        <td><input type="submit" id="save" name="save" value="Save"/></td>
                    </tr>
                </table>
            </Form>
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
