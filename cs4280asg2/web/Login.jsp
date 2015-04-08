<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Page</title>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <div id="header" class="banner">
            <jsp:include page="Header.html" flush="true" />           
        </div>
        
        <div id="leftPanel">           
            <a href="HomePage.jsp#1">
                <div class="menuItem">
                    <ul>
                        <p>Home Page</p>
                    </ul>
                </div>
            </a>
            <a href="HomePage.jsp#2">
                <div class="menuItem">
                    <ul>
                        <p>Item 2</p>
                    </ul>
                </div>
            </a>
            <a href="HomePage.jsp#3">
                <div class="menuItem">
                    <ul>
                        <p>Item 3</p>
                    </ul>
                </div>
            </a>
            <a href="HomePage.jsp#4">
                <div class="menuItem">
                    <ul>
                        <p>Item 4</p>
                    </ul>
                </div>
            </a>
            <a href="HomePage.jsp#5">
                <div class="menuItem">
                    <ul>
                        <p>Item 5</p>
                    </ul>
                </div>
            </a>
            <a href="HomePage.jsp#6">
                <div class="menuItem">
                    <ul>
                        <p>Item 6</p>
                    </ul>
                </div>
            </a>
        </div>
        
        <div id="mainPanel">
            <Form action="ProcessLogin" method="Get">
                <label for username>username:</label>
                <input type="text" id="username" name="username" value=""/><BR>
                <label for password>password:</label>
                <input type="password" id="password" name="password" value=""/><BR>
                <input type="hidden" name="requestURL" value=<%= request.getParameter("requestURL") %> />
                <input type="submit" value="Login" />
            </Form>
        </div>
        
        <div id="footer" class="banner">
            <jsp:include page="Header.html" flush="true" />           
        </div>
    </body>
</html>