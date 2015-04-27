<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            #loginPageContainer h2
            {
                padding-left: 50px;
            }
            
            #loginItemContainer
            {
                width: 500px;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
                padding-bottom: 50px;
            }
            
            #loginItemContainer table
            {
                margin: auto;
                font-size: 14px;
            }
          
            #loginItemContainer td
            {
                height: 50px;
            }
            
            #username
            {
                width: 100%;
                padding: 10px;
            }
            
            #password
            {
                width: 100%;
                padding: 10px;
            }
            
            #loginItemContainer a
            {
                color: #2490D0;
            }
            
            #loginItemContainer a:hover
            {
                text-decoration: underline;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function checksubmit()
            {
                var username = $("#username").val();
                var password = $("#password").val();
                var errorBox = $("#errorContainer");
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
            <div id="loginPageContainer" class="left">              
                <h2><label for="login">Login</label></h2>
                <div id="errorContainer">
                    <image src='image/ui-icon-error.png' alt='error' />
                <%
                    if(request.getParameter("error")!=null)
                    {
                        if(request.getParameter("error").equals("1"))
                        {
                           out.println("Wrong username or password");
                        }
                    }
                %>
                </div>
                <div id="loginItemContainer">
                    <h3 class="center">MEGABOOK ID</h3>
                    <Form action="ProcessLogin" method="POST" onsubmit="return checksubmit()">
                        <table width="60%" cellspacing="0" cellpadding="0">                           
                            <tr>
                                <td colspan="2"><input type="text" id="username" name="username" value="" placeholder="Username"/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="password" id="password" name="password" value="" placeholder="Password"/></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Login"/></td>
                                <td><a href="RegistrationPage.jsp"><label for="login">Register for new members!</label></a></td>
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