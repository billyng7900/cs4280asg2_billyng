<%-- 
    Document   : MyPage
    Created on : 2015/4/12, 下午 07:24:39
    Author     : liwaihing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Page</title>
        <link rel="stylesheet" href="css/toppanel.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            #myPageContainer h2
            {             
                padding-left: 50px;
            }
            
            #myItemContainer
            {
                width: 800px;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
            }
            
            #myItemContainer table
            {
                margin: auto;
                width: 80%;
            }
          
            #myItemContainer td
            {
                padding: 20px 0px;
                border-top: 1px solid #E8E8E8;
            }
            
            #myItemContainer input[type=text]
            {
                width: 100%;
                padding: 10px;
            }
            
            #myItemContainer input[type=password]
            {
                width: 100%;
                padding: 10px;
            }
            
            #myItemContainer a
            {
                color: #2490D0;
            }
            
            #myItemContainer a:hover
            {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div id="header" class="banner">
            <jsp:include page="common/Header.html" flush="true" />        
        </div>
        <div id="topPanel">
            <div class="topnav">
                <jsp:include page="common/TopPanel.html" flush="true" />
                <jsp:include page="Menu" flush="true" />
            </div>
        </div>         
        <div id="centerPanel">
            <div id="myPageContainer" class="left">
                <h2><label for="login">My Page</label></h2>
                <div id="myItemContainer">
                    
                    <Form action="">
                        <table cellspacing="0" cellpadding="0"> 
                            <tr>
                                <td colspan="2"><h3 class="center">MY ACCOUNT DETAILS<h3><td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Username</label></td>
                                <td>${user.userName}</td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Password</label></td>
                                <td><input type='password' name='oldpw' value='' placeholder="logic: check pw if save"></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Real Name</label></td>
                                <td><input type="text" id="realname" name="realname" value="//from db"/></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Address</label></td>
                                <td><input type="text" id="address" name="address" value="//from db"/></td>
                            </tr> 
                            <tr>
                                <td><label for='mypage'>Loyalty Points</label></td>
                                <td>${user.loyaltyPoints}</td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Purchase History</label></td>
                                <td><a href='#' >Purchase History</a></td>
                            </tr>
                            <tr>
                                <td colspan="2"><h3 class="center">CHANGE PASSWORD<h3><td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>New Password</label></td>
                                <td><input type='password' name='newpw' value=''></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Confirm New Password</label></td>
                                <td><input type='password' name='confirm_newpw' value=''></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="center">
                                    <label style="font-size: 14px">Do not use your real personal data as input.</label><br><br>
                                    <input type="submit" value="Save"/>
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="requestURL" value="<%= request.getParameter("requestURL") %>" />
                    </Form>
                </div>
            </div>                          
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
