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
            #myPageContainer
            {
                padding-bottom: 50px;
            }
            
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
                padding-bottom: 50px;
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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function checksubmit()
            {               
                var password = $("#password").val();               
                var errorBox = $("#errorContainer");               
                var contact = $("#contact");
                if(!password || password.replace(/ /g,'').length==0)
                {
                    errorBox.css('display','block');
                    errorBox.html("<image src='image/ui-icon-error.png' alt='error' /> Please enter your password");        
                    return false;
                }
                else if(!contact || contact.replace(/ /g,'').length==0)
                {
                    errorBox.css('display','block');
                    errorBox.html("<image src='image/ui-icon-error.png' alt='error' /> Please enter your contact information");        
                    return false;
                }    
            }
            
            $(document).ready(function()
            {
                $.urlParam = function(name)
                {
                    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
                    return results[1] || 0;
                }
                              
                if ($.urlParam('error')!=null)
                {                   
                    if ($.urlParam('error')=="1")
                    {
                        var errorBox = $("#errorContainer");
                        errorBox.css('display','block');
                        errorBox.html("<image src='image/ui-icon-error.png' alt='error' /> Password is not correct. Please try again.");
                    }
                }
            });
        </script>
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
                <div id="errorContainer"></div>
                <div id="myItemContainer">                   
                    <Form action="MyPageSave" method="Post" onsubmit="return checksubmit()">
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
                                <td><input type='password' name='password' id="password" value=''></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Real Name</label></td>
                                <td><input type="text" id="realname" name="realname" value="${user.realName}"/></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Contact Number</label></td>
                                <td><input type="text" id="contact" name="contact" value="${user.contact}"/></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Loyalty Points</label></td>
                                <td>${user.loyaltyPoints}</td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Purchase History</label></td>
                                <td><a href='PurchaseHistory'>Purchase History</a></td>
                            </tr>
                            <tr>
                                <td><label for='mypage'>Change Password</label></td>
                                <td><a href='ChangePassword.jsp'>Change Password</a></td>
                            </tr>                           
                            <tr>
                                <td colspan="2" class="center">
                                    <label style="font-size: 14px">Do not use your real personal data as input.</label><br><br>
                                    <input type="submit" value="Save"/>
                                </td>
                            </tr>
                        </table>
                    </Form>
                </div>
            </div>                          
        </div>        
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
