<%-- 
    Document   : DetailPage
    Created on : 2015/4/5, 下午 11:05:02
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Page</title>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body <!--onload="readData()"-->>
        <%
            if(session.getAttribute("username")==null)
                response.sendRedirect("Login.jsp");
        %>
        
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
            <div id="detailItem">
                <div style="float: left; width: 30%">
                    <img src="image\image1.jpg" alt="image1" height="300px">
                </div>
                <div style="float: left; width: 60%">
                        <table>
                            <tr>                            
                                <td style="text-decoration: bold; font-size: 20px">
                                    Java: A Beginner's Guide Paperback – April 15, 2014
                                </td>                                
                            </tr>
                            <tr>
                                <td style="font-size: 12px;">
                                    by Herbert Schildt  (Author)<br><br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Price: $24.37
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <b>Essential Java Programming Skills--Made Easy!</b><br><br>
                                        Fully updated for Java Platform, Standard Edition 8 (Java SE 8), Java: A Beginner's Guide, Sixth Edition gets you started programming in Java right away. Bestselling programming author Herb Schildt begins with the basics, such as how to create, compile, and run a Java program. He then moves on to the keywords, syntax, and constructs that form the core of the Java language. This Oracle Press resource also covers some of Java's more advanced features, including multithreaded programming, generics, and Swing. Of course, new Java SE 8 features such as lambda expressions and default interface methods are described. An introduction to JavaFX, Java's newest GUI, concludes this step-by-step tutorial.<br><br>

                                        <b>Designed for Easy Learning:</b><br><br>

                                        <li>Key Skills & Concepts -- Chapter-opening lists of specific skills covered in the chapter</li>
                                        <li>Ask the Expert -- Q&A sections filled with bonus information and helpful tips</li>
                                        <li>Try This -- Hands-on exercises that show you how to apply your skills</li>
                                        <li>Self Tests -- End-of-chapter quizzes to reinforce your skills</li>
                                        <li>Annotated Syntax -- Example code with commentary that describes the programming techniques being illustrated</li>
                                        The book's code examples are available FREE for download.
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right">
                                    <button>Add to chart</button>
                                </td>
                            </tr>
                        </table>
                    </div>
            </div>
        </div>
        
        <div id="footer" class="banner">
            <jsp:include page="Header.html" flush="true" />           
        </div>
    </body>
</html>

<script>
    function readData()
    {
        var id = document.URL.slice(document.URL.search("bookID"));
        var data  = "<div style='float: left; width: 30%'><img src='image\image1.jpg' alt='image1' height='300px'></div>" +
                        "<div style='float: left; width: 60%'><table><tr><td style='text-decoration: bold; font-size: 20px'> Java: A Beginner's Guide Paperback – April 15, 2014 </td> </tr>" + 
                        "<tr><td style='font-size: 12px;'>by Herbert Schildt  (Author)<br><br></td></tr>"+
                        "<tr><td>Price: $24.37</td></tr>"+
                        "<tr><td><p><b>Essential Java Programming Skills--Made Easy!</b><br><br>"+
                        "Fully updated for Java Platform, Standard Edition 8 (Java SE 8), Java: A Beginner's Guide, Sixth Edition gets you started programming in Java right away. Bestselling programming author Herb Schildt begins with the basics, such as how to create, compile, and run a Java program. He then moves on to the keywords, syntax, and constructs that form the core of the Java language. This Oracle Press resource also covers some of Java's more advanced features, including multithreaded programming, generics, and Swing. Of course, new Java SE 8 features such as lambda expressions and default interface methods are described. An introduction to JavaFX, Java's newest GUI, concludes this step-by-step tutorial.<br><br><b>Designed for Easy Learning:</b><br><br>"+
                        "<li>Key Skills & Concepts -- Chapter-opening lists of specific skills covered in the chapter</li>"+
                        "<li>Ask the Expert -- Q&A sections filled with bonus information and helpful tips</li>"+
                        "<li>Try This -- Hands-on exercises that show you how to apply your skills</li>"+
                        "<li>Self Tests -- End-of-chapter quizzes to reinforce your skills</li>"+
                        "<li>Annotated Syntax -- Example code with commentary that describes the programming techniques being illustrated</li>"+
                        "The book's code examples are available FREE for download."+
                        "</p></td></tr>"+
                        "<tr><td style='text-align: right'> <button>Add to chart</button></td></tr>"+
                        "</table>"+
                        "</div>";
        if(id == "bookID=1"){
            document.getElementById("detailItem").innerHTML = ""+data;
        }
    }
    

</script>
