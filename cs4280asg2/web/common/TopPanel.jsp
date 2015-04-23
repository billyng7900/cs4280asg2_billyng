<%-- 
    Document   : TopPanel
    Created on : 23-Apr-2015, 10:33:16
    Author     : WaiHing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
    </head>
    <body>
       <div style="float: left">
            <a href="Home">
                <img src="image/ui-icon-logo.png" alt=""/>   
            </a>
        </div>
        <div id="searcharea">
            <form method="get" action=""> 
                <table cellpadding="0px" cellspacing="0px" style="margin: 15px 5px"> 
                    <tr> 
                        <td >
                            <input id="searchquery" type="text" name="seach_query" placeholder="Search for books"> 
                        </td>
                        <td> 
                            <input id="search" type="image" src="image\ui-icon-search.png">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <jsp:include page="Menu" flush="true" />
    </body>
</html>
