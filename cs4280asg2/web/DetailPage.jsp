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
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript">
            function loadData()
            {
                var bookID = getQueryVariable("bookID");
                var bookDiv = "book_" + bookID;
                document.getElementById(bookDiv).style.display = "block";
            }
    
            function getQueryVariable(variable)
            {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i=0;i<vars.length;i++) {
                    var pair = vars[i].split("=");
                    if(pair[0] == variable)
                        return pair[1];
                }
                return(false);
            }
        </script>
    </head>
    <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("Login.jsp?requestURL="+request.getRequestURI()+"?"+request.getQueryString());
        }
    %>
        
    <body onload="loadData()">
        
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
        
        <div id="leftPanel">           
            <jsp:include page="common/Menu.html" flush="true" />  
        </div>
        
        <div id="mainPanel">
            <!--Book ID:1-->
            <div id="book_1" class="detailItem" style="display: none;">
                <div style="float: left; width: 300px; text-align: center">
                    <img src="image\book_1.jpg" alt="Java: A Beginner's Guide Paperback">
                </div>
                <div style="float: left; width: 60%">
                    <table>
                        <tr>                            
                            <td style="text-decoration: bold; font-size: 20px">
                                Java: A Beginner's Guide
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
                                <form>
                                <fieldset>
                                <legend>Book Description</legend>
                                    <p>
                                        <b>Essential Java Programming Skills--Made Easy!</b><br><br>
                                        Fully updated for Java Platform, Standard Edition 8 (Java SE 8), Java: A Beginner's Guide, Sixth Edition gets you started programming in Java right away. Bestselling programming author Herb Schildt begins with the basics, such as how to create, compile, and run a Java program. He then moves on to the keywords, syntax, and constructs that form the core of the Java language. This Oracle Press resource also covers some of Java's more advanced features, including multithreaded programming, generics, and Swing. Of course, new Java SE 8 features such as lambda expressions and default interface methods are described. An introduction to JavaFX, Java's newest GUI, concludes this step-by-step tutorial.<br><br>

                                        <b>Designed for Easy Learning:</b><br>

                                        <li>Key Skills & Concepts -- Chapter-opening lists of specific skills covered in the chapter</li>
                                        <li>Ask the Expert -- Q&A sections filled with bonus information and helpful tips</li>
                                        <li>Try This -- Hands-on exercises that show you how to apply your skills</li>
                                        <li>Self Tests -- End-of-chapter quizzes to reinforce your skills</li>
                                        <li>Annotated Syntax -- Example code with commentary that describes the programming techniques being illustrated</li><br>
                                        
                                        The book's code examples are available FREE for download.
                                    </p>
                                </fieldset>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <form>
                                <input type="hidden" name="bookID" value="1"/>
                                <input type="submit" value="Add to cart" />
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <!--Book ID:2-->
            <div id="book_2" class="detailItem" style="display: none">
                <div style="float: left; width: 300px; text-align: center">
                    <img src="image\book_2.jpg" alt="Effective Java (2nd Edition)">
                </div>
                <div style="float: left; width: 60%">
                    <table>
                        <tr>                            
                            <td style="text-decoration: bold; font-size: 20px">
                                Effective Java (2nd Edition)
                            </td>                                
                        </tr>
                        <tr>
                            <td style="font-size: 12px;">
                                by Joshua Bloch  (Author)<br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: $41.51
                            </td>                                
                        </tr>
                        <tr>
                            <td>
                                <form>
                                <fieldset>
                                <legend>Book Description</legend>
                                    <p>
                                        Are you looking for a deeper understanding of the Java™ programming language so that you can write code that is clearer, 
                                        more correct, more robust, and more reusable? Look no further! <b><i>Effective Java™, Second Edition,</i></b> brings 
                                        together seventy-eight indispensable programmer’s rules of thumb: working, best-practice solutions for the programming 
                                        challenges you encounter every day.<br><br>

                                        This highly anticipated new edition of the classic, Jolt Award-winning work has been thoroughly updated to cover Java 
                                        SE 5 and Java SE 6 features introduced since the first edition. Bloch explores new design patterns and language idioms, 
                                        showing you how to make the most of features ranging from generics to enums, annotations to autoboxing.<br><br>

                                        Each chapter in the book consists of several “items” presented in the form of a short, standalone essay that provides 
                                        specific advice, insight into Java platform subtleties, and outstanding code examples. The comprehensive descriptions 
                                        and explanations for each item illuminate what to do, what not to do, and why.<br><br>

                                        Highlights include:<br>

                                        <li>New coverage of generics, enums, annotations, autoboxing, the for-each loop, varargs, concurrency utilities, and much more</li>
                                        <li>Updated techniques and best practices on classic topics, including objects, classes, libraries, methods, and serialization</li>
                                        <li>How to avoid the traps and pitfalls of commonly misunderstood subtleties of the language</li>
                                        <li>Focus on the language and its most fundamental libraries: java.lang, java.util, and, to a lesser extent, java.util.concurrent and java.io</li><br>

                                        Simply put, <b><i>Effective Java™, Second Edition,</i></b> presents the most practical, authoritative guidelines available 
                                        for writing efficient, well-designed programs.
                                    </p>
                                </fieldset>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <form>
                                <input type="hidden" name="bookID" value="2"/>
                                <input type="submit" value="Add to cart" />
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <!--Book ID:3-->
            <div id="book_3" class="detailItem" style="display: none">
                <div style="float: left; width: 300px; text-align: center">
                    <img src="image\book_3.jpg" alt="Head First Java">
                </div>
                <div style="float: left; width: 60%">
                    <table>
                        <tr>                            
                            <td style="text-decoration: bold; font-size: 20px">
                                Head First Java (2nd Edition)
                            </td>                                
                        </tr>
                        <tr>
                            <td style="font-size: 12px;">
                                by Kathy Sierra, Bert Bates  (Author)<br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: $28.95
                            </td>                                
                        </tr>
                        <tr>
                            <td>
                                <form>
                                <fieldset>
                                <legend>Book Description</legend>
                                    <p>
                                        Learning a complex new language is no easy task especially when it s an object-oriented computer programming language 
                                        like Java. You might think the problem is your brain. It seems to have a mind of its own, a mind that doesn't always 
                                        want to take in the dry, technical stuff you're forced to study.<br><br>

                                        The fact is your brain craves novelty. It's constantly searching, scanning, waiting for something unusual to happen. 
                                        After all, that's the way it was built to help you stay alive. It takes all the routine, ordinary, dull stuff and filters 
                                        it to the background so it won't interfere with your brain's real work--recording things that matter. How does your brain 
                                        know what matters? It's like the creators of the Head First approach say, suppose you're out for a hike and a tiger jumps 
                                        in front of you, what happens in your brain? Neurons fire. Emotions crank up. Chemicals surge. That's how your brain knows.<br><br>

                                        And that's how your brain will learn Java. Head First Java combines puzzles, strong visuals, mysteries, and soul-searching 
                                        interviews with famous Java objects to engage you in many different ways. It's fast, it's fun, and it's effective. And, 
                                        despite its playful appearance, Head First Java is serious stuff: a complete introduction to object-oriented programming 
                                        and Java. You'll learn everything from the fundamentals to advanced topics, including threads, network sockets, and 
                                        distributed programming with RMI. And the new. second edition focuses on Java 5.0, the latest version of the Java language 
                                        and development platform. Because Java 5.0 is a major update to the platform, with deep, code-level changes, even more careful 
                                        study and implementation is required. So learning the Head First way is more important than ever.<br><br>

                                        If you've read a Head First book, you know what to expect--a visually rich format designed for the way your brain works. If 
                                        you haven't, you're in for a treat. You'll see why people say it's unlike any other Java book you've ever read.<br><br>

                                        By exploiting how your brain works, Head First Java compresses the time it takes to learn and retain--complex information. 
                                        Its unique approach not only shows you what you need to know about Java syntax, it teaches you to think like a Java programmer. 
                                        If you want to be bored, buy some other book. But if you want to understand Java, this book's for you.
                                    </p>
                                </fieldset>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <form>
                                <input type="hidden" name="bookID" value="3"/>
                                <input type="submit" value="Add to cart" />
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <!--Book ID:4-->
            <div id="book_4" class="detailItem" style="display: none;">
                <div style="float: left; width: 300px; text-align: center">
                    <img src="image\book_4.jpg" alt="Java in 24 Hours, Sams Teach Yourself">
                </div>
                <div style="float: left; width: 60%">
                    <table>
                        <tr>                            
                            <td style="text-decoration: bold; font-size: 20px">
                                Java in 24 Hours, Sams Teach Yourself (Covering Java 8) (7th Edition)
                            </td>                                
                        </tr>
                        <tr>
                            <td style="font-size: 12px;">
                                by Rogers Cadenhead  (Author)<br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: $24.88
                            </td>                                
                        </tr>
                        <tr>
                            <td>
                                <form>
                                <fieldset>
                                    <legend>Book Description</legend>
                                    <p>
                                        <b>Sams Teach Yourself Java in 24 Hours, Seventh Edition</b><br>
                                        <i>Covers Java 8 and Android Development</i><br><br>

                                        In just 24 lessons of one hour or less, you can learn the fundamentals of Java programming.<br><br>

                                        In this book's straightforward, step-by-step approach, each lesson builds on everything that's come 
                                        before, helping readers learn Java's core features and techniques from the ground up.<br><br>

                                        Friendly, accessible, and conversational, this book offers a practical grounding in the language, 
                                        without ever becoming overwhelming or intimidating. Full-color figures and clear instructions visually 
                                        show you how to program with Java.<br><br>

                                        Popular author Rogers Cadenhead helps you master the skills and technology you need to create desktop 
                                        and web programs, web services, and even an Android app in Java.<br><br>

                                        Learn how to…<br>

                                        <li>Set up your Java programming environment</li>
                                        <li>Write your first working program in just minutes</li>
                                        <li>Control program decisions and behavior</li>
                                        <li>Store and work with information</li>
                                        <li>Build straightforward user interfaces</li>
                                        <li>Create interactive web programs</li>
                                        <li>Use threading to build more responsive programs</li>
                                        <li>Read and write files and XML data</li>
                                        <li>Master best practices for object-oriented programming</li>
                                        <li>Create flexible, interoperable web services with JAX-WS</li>
                                        <li>Use Java to create an Android app</li>
                                        <li>Expand your skills with closures, the powerful new capability introduced in Java 8</li>
                                    </p>
                                </fieldset>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <form>
                                <input type="hidden" name="bookID" value="4"/>
                                <input type="submit" value="Add to cart" />
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <!--Book ID:5-->
            <div id="book_5" class="detailItem" style="display: none;">
                <div style="float: left; width: 300px; text-align: center">
                    <img src="image\book_5.jpg" alt="Beginning Programming with Java For Dummies">
                </div>
                <div style="float: left; width: 60%">
                    <table>
                        <tr>                            
                            <td style="text-decoration: bold; font-size: 20px">
                                Beginning Programming with Java For Dummies
                            </td>                                
                        </tr>
                        <tr>
                            <td style="font-size: 12px;">
                                by Burd  (Author)<br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: $22.22
                            </td>                                
                        </tr>
                        <tr>
                            <td>
                                <form>
                                <fieldset>
                                    <legend>Book Description</legend>
                                    <p>
                                        A practical introduction to programming with Java Beginning 
                                        Programming with Java For Dummies, 4 th Edition is a 
                                        comprehensive guide to learning one of the most popular 
                                        programming languages worldwide. This book covers basic 
                                        development concepts and techniques through a Java lens. 
                                        You'll learn what goes into a program, how to put the pieces 
                                        together, how to deal with challenges, and how to make it work. 
                                        The new Fourth Edition has been updated to align with Java 8, 
                                        and includes new options for the latest tools and techniques. 
                                        Java is the predominant language used to program Android and 
                                        cloud apps, and its popularity is surging as app demand rises. 
                                        Whether you're just tooling around, or embarking on a career, 
                                        Beginning Programming with Java For Dummies, 4 th Edition is 
                                        a great place to start. Step-by-step instruction, easy-to-read 
                                        language, and quick navigation make this book the perfect 
                                        resource for new programmers. You'll begin with the basics 
                                        before moving into code, with simple, yet detailed explanations 
                                        every step of the way. Topics include: Learn the language with 
                                        sample programs and the Java toolkit Familiarize yourself with 
                                        decisions, conditions, statements, and information overload 
                                        Differentiate between loops and arrays, objects and classes, 
                                        methods and variables The book also contains links to additional 
                                        resources, other programming languages, and guidance as to the 
                                        most useful classes in the Java API. If you're new to programming 
                                        languages, Beginning Programming with Java For Dummies, 4 th 
                                        Edition provides the instruction and practice you need to become 
                                        a confident Java programmer.
                                    </p>
                                </fieldset>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <form>
                                <input type="hidden" name="bookID" value="5"/>
                                <input type="submit" value="Add to cart" />
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <!--Book ID:6-->
            <div id="book_6" class="detailItem" style="display: none;">
                <div style="float: left; width: 300px; text-align: center">
                    <img src="image\book_6.jpg" alt="Core Java Volume I--Fundamentals">
                </div>
                <div style="float: left; width: 60%">
                    <table>
                        <tr>                            
                            <td style="text-decoration: bold; font-size: 20px">
                                Core Java Volume I--Fundamentals (9th Edition) (Core Series)
                            </td>                                
                        </tr>
                        <tr>
                            <td style="font-size: 12px;">
                                by Cay S. Horstmann  (Author)<br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: $35.13
                            </td>                                
                        </tr>
                        <tr>
                            <td>
                                <form>
                                <fieldset>
                                    <legend>Book Description</legend>
                                    <p>
                                        Fully updated to reflect Java SE 7 language changes, <b><i>Core Java™, 
                                        Volume I—Fundamentals, Ninth Edition,</i></b> is the definitive guide 
                                        to the Java platform.<br><br>
                                        
                                        Designed for serious programmers, this reliable, unbiased, no-nonsense 
                                        tutorial illuminates key Java language and library features with thoroughly 
                                        tested code examples. As in previous editions, all code is easy to understand, 
                                        reflects modern best practices, and is specifically designed to help jumpstart 
                                        your projects.<br><br>
                                        
                                        Volume I quickly brings you up-to-speed on Java SE 7 core language enhancements, 
                                        including the diamond operator, improved resource handling, and catching of 
                                        multiple exceptions. All of the code examples have been updated to reflect these 
                                        enhancements, and complete descriptions of new SE 7 features are integrated with 
                                        insightful explanations of fundamental Java concepts. You’ll learn all you need 
                                        to be productive with <br>
                                        
                                        <li>The Java programming environment</li>
                                        <li>Objects, classes, and inheritance</li>
                                        <li>Interfaces and inner classes</li>
                                        <li>Reflection and proxies</li>
                                        <li>Graphics programming</li>
                                        <li>Event handling and the event listener model</li>
                                        <li>Swing-based user interface components</li>
                                        <li>Application and applet deployment</li>
                                        <li>Exceptions, logging, assertions, and debugging</li>
                                        <li>Generic programming</li>
                                        <li>Collections</li>
                                        <li>Concurrency, and more</li><br>
                                        
                                        For detailed coverage of advanced features, including the new API for file input/output 
                                        and enhancements to the concurrency utilities, look for <b><i>Core Java™, Volume II—Advanced 
                                        Features, Ninth Edition</i><b>.
                                    </p>
                                </fieldset>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <form>
                                <input type="hidden" name="bookID" value="6"/>
                                <input type="submit" value="Add to cart" />
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />           
        </div>
    </body>
</html>
