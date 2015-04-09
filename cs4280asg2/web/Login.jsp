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
                if(username==""||username.replace(/ /g,'').length==0)
                {
                    alert("username cannot be empty");
                    return false;
                }
                else if (password==""||password.replace(/ /g,'').length==0)
                {
                    alert("password cannot be empty");
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
                <label for username>username:</label>
                <input type="text" id="username" name="username" value=""/><BR>
                <label for password>password:</label>
                <input type="password" id="password" name="password" value=""/><BR>
                <input type="hidden" name="requestURL" value=<%= request.getParameter("requestURL") %> />
                <input type="submit" value="Login"/>
                
            </Form>
            
        </div>
        
        <div id="footer" class="banner">
            <jsp:include page="Header.html" flush="true" />           
        </div>
    </body>
</html>