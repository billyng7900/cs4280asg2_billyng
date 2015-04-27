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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <title>Registration</title>
        <style>
            #registerPageContainer h2
            {
                padding-left: 50px;
            }
            
            #registerItemContainer
            {
                width: 800px;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
            }
            
            #registerItemContainer table
            {
                margin: auto;
                width: 80%;
            }
          
            #registerItemContainer td
            {
                padding: 20px 0px;
                border-top: 1px solid #E8E8E8;
            }
            
            #registerItemContainer input[type=text]
            {
                width: 100%;
                padding: 10px;
            }
            
            #registerItemContainer input[type=password]
            {
                width: 100%;
                padding: 10px;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function checksubmit()
            {
                var username = $("#username").val();
                var password = $("#password").val();
                var password_confirm = $("#pw_confirm").val();
                var errorBox = $("#errorContainer");
                if(password != password_confirm)
                {
                    errorBox.css('display','block');
                    errorBox.html("<image src='image/ui-icon-error.png' alt='error' /> Password do not match");
                    return false;
                }
                if(!username || username.replace(/ /g,'').length==0)
                {
                    errorBox.css('display','block');
                    errorBox.html("<image src='image/ui-icon-error.png' alt='error' /> Username cannot be empty");        
                    return false;
                }
                else if (!password || password.replace(/ /g,'').length==0)
                {
                    errorBox.css('display','block');
                    errorBox.html("<image src='image/ui-icon-error.png' alt='error' /> Password cannot be empty");
                    return false;
                }
            }
            
            $(document).ready(function()
            {
                $.urlParam = function(name)
                {
                    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
                    return results[1] || 0;
                }
                              
                if ($.urlParam('error')!=null)
                {                   
                    if ($.urlParam('error')=="1")
                    {
                        var errorBox = $("#errorContainer");
                        errorBox.css('display','block');
                        errorBox.html("<image src='image/ui-icon-error.png' alt='error' /> Username had been used. Please use another one.");
                    }
                }
            });
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
            <div id="registerPageContainer" class="left">
                <h2><label for="login">Register</label></h2>
                <div id="errorContainer"></div>
                <div id="registerItemContainer">
                    <h3 class="center">PERSONAL INFORMATION</h3>
                     <Form action="Register" onsubmit="return checksubmit()" method="POST">                         
                        <table cellspacing="0" cellpadding="0">                           
                            <tr>
                                <td><label for='username'>Username</label></td>
                                <td><input type="text" id="username" name="username" value=""/></td>
                            </tr>
                            <tr>
                                <td><label for='password'>Password</label></td>
                                <td><input type="password" id="password" name="password" value=""/></td>
                            </tr>
                            <tr>
                                <td><label for='password'>Confirm Password</label></td>
                                <td><input type="password" id="pw_confirm" name="pw_confirm" value=""/></td>
                            </tr>    
                            <tr>
                                <td><label for='realname'>Real Name</label></td>
                                <td><input type="text" id="realname" name="realname" value=""/></td>                   
                            </tr>                    
                            <tr>
                                <td colspan="2" class="center">
                                    <label style="font-size: 14px">Do not use your real personal data as input.</label><br><br>
                                    <input type="submit" value="Register"/>
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="requestURL" value="<%= request.getParameter("requestURL") %>" />
                    </Form>
                </div>
            </div>               
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
