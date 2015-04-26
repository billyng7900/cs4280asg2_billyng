<%-- 
    Document   : ChangePassword
    Created on : 2015/4/26, 下午 11:14:40
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            #changepwPageContainer h2
            {
                padding-left: 50px;
            }
            
            #changepwItemContainer
            {
                width: 700px;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
                padding-bottom: 50px;
            }
            
            #changepwItemContainer table
            {
                margin: auto;
                font-size: 14px;
            }
          
            #changepwItemContainer td
            {
                height: 50px;
            }                      
            
            #changepwItemContainer input[type=password]
            {
                width: 100%;
                padding: 10px;
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
            <div id="changepwPageContainer" class="left">               
                <h2><label for="login">Login</label></h2>
                <div id="changepwItemContainer">
                    <h3 class="center">CHANGE PASSWORD</h3>
                    <Form action="ProcessLogin" method="POST" onsubmit="return checksubmit()">
                        <table width="70%" cellspacing="0" cellpadding="0">                                                         
                            <tr>
                                <td><label for='mypage'>Old Password</label></td>
                                <td><input type='password' name='password' value=''></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>New Password</label></td>
                                <td><input type='password' name='newpw' value=''></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Confirm New Password</label></td>
                                <td><input type='password' name='confirm_newpw' value=''></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="center">                                   
                                    <input type="submit" value="Save"/>
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
