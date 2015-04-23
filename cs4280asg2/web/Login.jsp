<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function checksubmit()
            {
                var username = $("#username").val();
                var password = $("#password").val();
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
            <%
               if(request.getParameter("error")=="1")
               {
                   out.println("Username exist,please use another one to register.");
               }
            %>            
            <Form action="ProcessLogin" method="Get" onsubmit="return checksubmit()">
                <table style="background-color: #F1F6F7; margin: auto;" >
                    <tr>
                        <td colspan="2" style="background-color: #1A6781; color: #FFFFFF; text-align: center"><b>Login</b></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="username" name="username" value="" placeholder="Username"/></td>
                    </tr>
                    <tr>
                        <td><input type="password" id="password" name="password" value="" placeholder="Password"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login"/></td>
                        <td style="font-size: 10px; text-align: right"><a href="RegistrationPage.jsp">[Register]</a></td>
                    </tr>
                </table>
                <input type="hidden" name="requestURL" value="<%= request.getParameter("requestURL") %>" /> 
            </Form>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>