<%-- 
    Document   : HomePage
    Created on : 2015/4/3, 下午 08:55:00
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BO.*,java.util.*,function.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            ArrayList<Book> booklist = new ArrayList<Book>();
            BookDao bookdao = new BookDao();
            booklist = bookdao.getBookList();
        %>
        <div id="header" class="banner">
            <jsp:include page="Header.html" flush="true" />        
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">
            <div class="contentItem">
                <table>
                    <tr>
                        <td>
                            <a href="DetailPage.jsp?bookID=1">
                                <img src="image\image1.jpg" alt="image1">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="DetailPage.jsp?bookID=1">
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
            <jsp:include page="Header.html" flush="true" />               
        </div>
    </body>
</html>
