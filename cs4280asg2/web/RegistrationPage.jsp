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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function checksubmit()
            {
                var username = $("#username").val();
                var password = $("#password").val();
                var password_confirm = $("#pw_confirm").val();
                if(password != password_confirm)
                {
                    alert("The password not match!");
                    return false;
                }
                if(!username || username.replace(/ /g,'').length==0)
                {
                    alert("Username cannot be empty");
                    return false;
                }
                else if (!password || password.replace(/ /g,'').length==0)
                {
                    alert("Password cannot be empty");
                    return false;
                }
            }
        </script>
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
            <Form action="Register" onsubmit="return checksubmit()" method="POST">
                <table style="background-color: #F1F6F7; margin: auto">
                    <tr>
                        <td colspan="2" style="background-color: #1A6781; color: #FFFFFF; text-align: center"><b>Register</b></td>
                    </tr>
                    <tr>
                        <td><label for='username'>Username:</label></td>
                        <td><input type="text" id="username" name="username" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for='password'>Password:</label></td>
                        <td><input type="password" id="password" name="password" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for='password'>Confirm Password:</label></td>
                        <td><input type="password" id="pw_confirm" name="pw_confirm" value=""/></td>
                    </tr>    
                    <tr>
                        <td><label for='realname'>Real Name:</label></td>
                        <td><input type="text" id="realname" name="realname" value=""/></td>                   
                    </tr>                    
                    <tr>
                        <td><input type="submit" value="Register"/></td>
                    </tr>
                </table>
            </Form>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
