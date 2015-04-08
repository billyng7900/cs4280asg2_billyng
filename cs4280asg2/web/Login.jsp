<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/style.css">
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
            <Form action="ProcessLogin" method="Get">
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