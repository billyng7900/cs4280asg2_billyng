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
                <a href="DetailPage.jsp?bookID=1">
                    <img src="image\book_1.jpg" alt="Java: A Beginner's Guide Paperback" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=1">
                    Java: A Beginner's Guide Paperback
                </a>                                    
            </div>
            <div class="contentItem">               
                <a href="DetailPage.jsp?bookID=2">
                    <img src="image\book_2.jpg" alt="Effective Java (2nd Edition)" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=2">
                    Effective Java (2nd Edition)
                </a>                                    
            </div>
            <div class="contentItem">               
                <a href="DetailPage.jsp?bookID=3">
                    <img src="image\book_3.jpg" alt="Head First Java" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=3">
                    Head First Java (2nd Edition)
                </a>               
            </div>
            <div class="contentItem">
                <a href="DetailPage.jsp?bookID=4">
                    <img src="image\book_4.jpg" alt="Java in 24 Hours, Sams Teach Yourself" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=4">
                    Java in 24 Hours, Sams Teach Yourself
                </a>                                     
            </div>
            <div class="contentItem">                
                <a href="DetailPage.jsp?bookID=5">
                    <img src="image\book_5.jpg" alt="Beginning Programming with Java For Dummies" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=5">
                    Beginning Programming with Java For Dummies
                </a>                                    
            </div>
            <div class="contentItem">               
                <a href="DetailPage.jsp?bookID=6">
                    <img src="image\book_6.jpg" alt="Core Java Volume I--Fundamentals" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=6">
                    Core Java Volume I--Fundamentals (9th Edition)
                </a>                                    
            </div>
            <div class="contentItem">                
                <a href="DetailPage.jsp?bookID=7">
                    <img src="image\book_7.jpg" alt="Java 8 in Action" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=7">
                    Java 8 in Action: Lambdas, Streams, and functional-style programming 
                </a>                                    
            </div>
            <div class="contentItem">               
                <a href="DetailPage.jsp?bookID=8">
                    <img src="image\book_8.jpg" alt="Java 8 Preview Sampler" height="150px">
                </a>
                <br><br>
                <a href="DetailPage.jsp?bookID=8">
                    Java 8 Preview Sampler 
                </a>            
            </div>
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="Header.html" flush="true" />               
        </div>
    </body>
</html>
