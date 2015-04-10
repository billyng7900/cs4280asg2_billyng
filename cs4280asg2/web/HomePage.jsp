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
            <jsp:include page="common/Header.html" flush="true" />        
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="common/Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">                    
            <%
            for(Book b:booklist)
            {
                out.println("<div class='contentItem'>");
                out.println("<a href='DetailPage.jsp?bookID="+b.getBookID()+"'>");
                out.println("<img src='image\\"+b.getImageURL()+".jpg' alt='image' height='150px'>");
                out.println("</a>");
                out.println("<br><br>");
                out.println("<a href='DetailPage.jsp?bookID="+b.getBookID()+"'>");
                out.println(b.getBookName());
                out.println("</a>");
                out.println("</div>");
            }
            %>            
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
