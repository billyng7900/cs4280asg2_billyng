<%-- 
    Document   : CheckoutPage
    Created on : 22-Apr-2015, 18:12:40
    Author     : WaiHing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/toppanel.css">
        <style>
            .checkableItemContainer td label
            {
                float: left;
                margin: 1px;
                width:150px;
                
            }
            .checkableItemContainer td input
            {
                
            }
            #centerPanel h2
            {
                background-color: #DCDCDC; 
                padding:20px 20px ;
            }
            .checkableItemContainer th
            {
                background-color:#AFEEEE;
                width:400px;
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
            </div>
        </div>
            <div id="centerPanel" >
                <form>
                    <h2>Payment Method</h2>
                    <div class="checkableItemContainer">
                        <table>
                            <tr>
                                <th><input type="radio" name="payment_method"
					value="1" id="payment_method"
					class="inputRadio" checked="checked">
                                    <label for="paymentmethod">Credit Card</label>
				</th>
                                <td>
                                    <label for="cardno">Credit Card No.</label>
                                    <input type="text" id="cardno" name="cardno" value="" placeholder="Credit Card No."/><br>
                                    <label for="vailddate">Valid Date</label>
                                    <input type="text" id="vailddate" name="vailddate" value="" placeholder="Valid Date"/><br>
                                    <label for="cardholdername">Card Holder Name</label>
                                    <input type="text" id="cardholdername" name="cardholdername" value="" placeholder="Card Holder Name"/><br>
                                    <label for="cardholdername">Security Code</label>
                                    <input type="text" id="securitycode" name="securitycode" value="" placeholder="Security Code"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h2>Loyalty Points</h2>
                    <p>Your current loyalty points is : 100pt</p>
                    <div class="checkableItemContainer">
                        <table>
                            <tr>
                                <th>
                                    <input type="radio" name="loyaltypoints"
					value="1" id="loyaltypoints"
					class="inputRadio" checked="checked">
                                    <label for="loyaltypoints">Use All Loyalty Points</label>
                                </th>
                                <td>
                                    <p>100pt</p>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <input type="radio" name="loyaltypoints"
					value="2" id="loyaltypoints"
					class="inputRadio" checked="checked">
                                    <label for="loyaltypoints">Use Some of My Loyalty Points</label>
                                </th>
                                <td>
                                    <input type="text" id="loyaltypointsinput" name="loyaltypointsinput" value="" style="width:40px"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <input type="radio" name="loyaltypoints"
                                        value="3" id="loyaltypoints"
                                        class="inputRadio" checked="checked">
                                    <label for="loyaltypoints">I Would Not Use My loyalty Points</label>
                                </th>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="checkableItemContainer">
                        <table>
                            <tr>
                                <th>
				</th>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
