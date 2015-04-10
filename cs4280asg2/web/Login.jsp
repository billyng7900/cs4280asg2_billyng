<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function checksubmit()
            {
                var username = $("#username").val();
                var password = $("#password").val();
                if(!username)
                {
                    alert("Username cannot be empty");
                    return false;
                }
                else if (!password)
                {
                    alert("Password cannot be empty");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div id="header" class="banner">
            <jsp:include page="Header.html" flush="true" />           
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">
            <%
               if(request.getParameter("error")!=null)
               {
                   out.println("Username or Password incorrect. Please Try Again");
               }
             %>
            <Form action="ProcessLogin" method="Get" onsubmit="return checksubmit()">
                <table>
                    <tr>
                        <td><label for username>username:</label></td>
                        <td><input type="text" id="username" name="username" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for password>password:</label></td>
                        <td><input type="password" id="password" name="password" value=""/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login"/></td>
                    </tr>
                </table>
                <input type="hidden" name="requestURL" value="<%= request.getParameter("requestURL") %>" /> 
            </Form>
            
        </div>
        
        <div id="footer" class="banner">
            <jsp:include page="Header.html" flush="true" />           
        </div>
    </body>
</html>