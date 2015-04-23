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
            #checkableItemContainer
            {
                text-align: left;
            }
            
            #checkableItemContainer th
            {
                background-color: #707070;
                color: #FFFFFF;
            }
            
            #checkableItemContainer td
            {
                height: 40px;
            }
            
            #checkableItemContainer label
            {
                padding-left: 30px; 
            }
            
            .itemHeader
            {
                width: 300px;
                background-color: #F8F8F8 ;
                padding: 0px;
                border: 1px solid #E8E8E8;
                border-top: 0px;
            }
            
            .checkoutItemContainer
            {
                border: 1px solid #E8E8E8;
                text-align: center;
                border-top: 0px;
                border-right: 0px;
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
            <div id="checkableItemContainer">
                <h2><label for="payment">Checkout</label></h2>
                <form>
                    <table width="100%" cellspacing="0" cellpadding="0">
                        <tr>
                            <th colspan="4">
                                <h3><label for="payment">Payment Method</label></h3>
                            </th>
                        </tr>
                        <tr>
                            <td rowspan="5" class="itemHeader">
                                <label for="payment">Credit Card</label>
                            </td>                                
                            <td><label for="payment">Credit Card No.</label></td>
                            <td><input type="text" name="cardno" placeholder="Credit Card No."></td>
                        </tr>
                        <tr>
                            <td><label for="payment">Valid Date</label></td>
                            <td><select>
                                    <option value="1">01</option>
                                    <option value="2">02</option>
                                    <option value="3">03</option>
                                    <option value="4">04</option>
                                    <option value="5">05</option>
                                    <option value="6">06</option>
                                    <option value="7">07</option>
                                    <option value="8">08</option>
                                    <option value="9">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                                /
                                <input type="text" name="validdateY" placeholder="YYYY" style="width:50px">
                            </td>
                        </tr>                        
                        <tr>
                            <td><label for="payment">Card Holder Name</label></td>
                            <td><input type="text" name="cardholder" placeholder="Card Holder Name"></td>
                        </tr>
                        <tr>
                            <td><label for="payment">Security Code</label></td>
                            <td><input type="text" name="security code" placeholder="Security Code"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <label><b>Reminder:</b></label>
                                <ul>
                                    <li>
                                        Do not use your real personal data as input.
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: left; background-color: #D8D8D8 ">
                                <label for="payment"><b>Your current loyalty points is: 100pt </b></label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" rowspan="3" class="checkoutItemContainer">                                                                
                                <p>
                                    <input type='radio' name='paymentmethod' value='loyaltypoint'>
                                    Pay by Loyalty Points
                                </p>
                                <p>
                                    <input type='radio' name='paymentmethod' value='creditcard'>
                                    Pay by Credit Card Only
                                </p>                                
                            </td>
                            <td class="checkoutItemContainer">
                                <p><b>Items Total</b></p>
                                <p><b>Loyalty Points</b></p>
                            </td>
                            <td class="checkoutItemContainer">
                                <p>$1000</p>
                                <p>100</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkoutItemContainer"><b>Total</b></td>
                            <td class="checkoutItemContainer">$900</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="checkoutItemContainer">
                                <input type="submit" value="Pay" name="checkout" width="200px">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
