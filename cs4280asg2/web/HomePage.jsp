<%-- 
    Document   : HomePage
    Created on : 2015/4/3, 下午 08:55:00
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <div id="header" class="banner">
            This web site exists to fulfill the coursework requirement of CS4280.<br>
            Do not use your real personal data as input.           
        </div>
        
        <div id="leftPanel">           
            <a href="DetailPage.jsp">
                <div class="menuItem">
                    <ul>
                        <p>Detail Page</p>
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
            <div class="contentItem">
                <table>
                    <tr>
                        <td>
                            <a href="DetailPage.jsp">
                                <img src="image\image1.jpg" alt="image1">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="DetailPage.jsp">
                                Java: A Beginner's Guide Paperback
                            </a>
                        </td>
                    </tr>
                </table>               
            </div>
            <div class="contentItem">
                <table>
                    <tr>
                        <td>
                            <img src="image\image2.jpg" alt="image2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Book Name
                        </td>
                    </tr>
                </table>               
            </div>
            <div class="contentItem">
                <table>
                    <tr>
                        <td>
                            <img src="image\image3.jpg" alt="image3">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Book Name
                        </td>
                    </tr>
                </table>               
            </div>
        </div>
        
        <div id="footer" class="banner">
            This web site exists to fulfill the coursework requirement of CS4280.<br>
            Do not use your real personal data as input.           
        </div>
    </body>
</html>
