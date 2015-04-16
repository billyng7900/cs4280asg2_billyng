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
            <Form action="Register">
                <table style="background-color: #F1F6F7; margin: auto">
                    <tr>
                        <td colspan="2" style="background-color: #1A6781; color: #FFFFFF; text-align: center"><b>Register</b></td>
                    </tr>
                    <tr>
                        <td>Login Username:</td>
                        <td><input type="text" id="username" name="username" value=""/></td>
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
                        <td>First Name:</td>
                        <td><input type="text" id="firstname" name="firstname" value=""/></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" id="lastname" name="lastname" value=""/></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            Male<input type="radio" id="gender" name="gender" value="Male"/>
                            Female<input type="radio" id="gender" name="gender" value="Female"/>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </Form>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
