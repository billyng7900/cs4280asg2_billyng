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
            #checkoutPageContainer h2
            {
                padding-left: 50px; 
            }
            
            #checkoutPageContainer
            {
                text-align: left;
            }
            
            #checkableItemContainer
            {
                width: 90%;
                margin: auto;
                background-color: #F8F8F8;
                border: 1px solid #E8E8E8;
                border-radius: 5px;
            }
            
            #checkableItemContainer table
            {
                margin: auto;
            }
            
            #checkableItemContainer th
            {
                border-bottom: 1px solid #E8E8E8;
            }
            
            #checkableItemContainer td
            {
                padding: 10px 0px;
            }
            
            #checkableItemContainer input[type=text]
            {
                width: 100%;
                padding: 10px;
            }
            
            #checkableItemContainer label
            {
                padding-left: 30px;
            }
                       
            .checkoutItemContainer
            {
                border: 1px solid #E8E8E8;
                border-top: 0px;
                border-right: 0px;
            }
            
            .checkoutItemContainer p
            {
                padding-left:50px;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
            $("#somepoints").change(function() {
                if(this.checked)
                {
                    $("#paysomeloyaltypoint").prop('disabled', false);
                    $("#pointwillbeuse").text(0);
                    changeTotalPrice();
                }
            });
            $("#paysomeloyaltypoint").change(function(){
                var pointwanttouse = $("#paysomeloyaltypoint").val();
                var totalpoint = parseInt($("#totalpoint").text());
                if(pointwanttouse>totalpoint)
                {
                    alert("Loyalty Point should not exceeds the total Loyalty Points");
                    $("#paysomeloyaltypoint").val(0);
                }
                else
                {
                    $("#pointwillbeuse").text(pointwanttouse);
                    var itemprice = parseFloat($("#price").text());
                    if(pointwanttouse>itemprice)
                    {
                        var inttotalpoint = Math.floor(itemprice)+1;
                        $("#pointwillbeuse").text(inttotalpoint);
                    }
                    changeTotalPrice();
                }
            });
            $("#allpoints").change(function() {
                if(this.checked)
                {
                    $("#paysomeloyaltypoint").val(0);
                    $("#paysomeloyaltypoint").prop('disabled', true);
                    var totalpoint = parseInt($("#totalpoint").text());
                    var itemprice = parseFloat($("#price").text());
                    if(totalpoint>itemprice)
                    {
                        var inttotalpoint = Math.floor(itemprice)+1;
                        $("#pointwillbeuse").text(inttotalpoint);
                    }
                    else
                    {
                        $("#pointwillbeuse").text($("#totalpoint").text());
                    }
                    changeTotalPrice();
                }
            });
            $("#nopoints").change(function(){
                if(this.checked)
                {
                    $("#pointwillbeuse").text(0);
                    changeTotalPrice();
                }
            });
        });
        function changeTotalPrice()
        {
            var itemprice = parseFloat($("#price").text());
            var pointuse = parseInt($("#pointwillbeuse").text());
            var totalprice = (itemprice-pointuse).toFixed(2);
            if(totalprice<0)
                totalprice = 0;
            $("#totalprice").text(totalprice);
            $("#pointuse").val(pointuse);
        }
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
        <div id="centerPanel" >
            <div id="checkoutPageContainer">
                <h2><label for="payment">Checkout</label></h2>              
                <div id="checkableItemContainer">
                    <form action="Checkout">
                        
                        <table width="90%" cellspacing="0" cellpadding="0">                          
                            <tr>
                                <th colspan="4"><h3 class="center">PAYMENT METHOD</h3></td>                                
                            </tr>
                            <tr>
                                <td rowspan="5" width='200'>
                                    <label for="payment">Credit Card</label>
                                </td>                                
                                <td><label for="payment">Credit Card No.</label></td>
                                <td><input type="text" name="cardno" placeholder="Credit Card No."></td>
                            </tr>
                            <tr>
                                <td><label for="payment">Valid Date</label></td>
                                <td><input type="text" name="validdateM" placeholder="MM" style="width:30px">
                                    /
                                    <input type="text" name="validdateY" placeholder="YYYY" style="width:50px">
                                </td>
                            </tr>                        
                            <tr>
                                <td><label for="payment">Card Holder's Name</label></td>
                                <td><input type="text" name="cardholder" placeholder="Card Holder's Name"></td>
                            </tr>
                            <tr>
                                <td><label for="payment">Security Code</label></td>
                                <td><input type="text" name="security code" placeholder="Security Code"></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                    <label for="payment"><b>Reminder:</b></label><br>
                                    <label for="payment">Do not use your real personal data as input.</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: left; background-color: #D9D9D9 ">
                                    <label for="payment">Your current loyalty points is: <span id="totalpoint">${user.loyaltyPoints}</span>pt </b></label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" rowspan="3" class="checkoutItemContainer">                                                                
                                    <p>
                                        <input type='radio' id="allpoints" name='loyaltypoint' value='allloyaltypoint'>
                                        Pay by All Loyalty Points
                                    </p>
                                    <p>
                                        <input type='radio' id="somepoints" name='loyaltypoint' value='someloyaltypoint'>
                                        Pay by Some of Loyalty Points: 
                                        <input type='number' style="width: 50px; padding: 5px" id='paysomeloyaltypoint' name='paysomeloyaltypoint' disabled="true" value="0" placeholder="Points">
                                    </p>
                                    <p>
                                        <input type='radio' id="nopoints" name='loyaltypoint' value='noloyaltypoint' checked="true">
                                        Pay by Credit Card Only
                                    </p>                                
                                </td>
                                <td class="checkoutItemContainer">
                                    <p><b>Items Total</b></p>
                                    <p><b>Loyalty Points</b></p>
                                </td>
                                <td class="checkoutItemContainer" style="border-right: 1px solid #E8E8E8">
                                    <p>$<span id="price">${cart.totalPrice}</span></p>
                                    <p id="pointwillbeuse">0</p>
                                    <input type="hidden" name="pointuse" id="pointuse" value=""/>
                                </td>
                            </tr>
                            <tr>
                                <td class="checkoutItemContainer"><b><p>Total</b></td>
                                <td class="checkoutItemContainer" style="border-right: 1px solid #E8E8E8"><p>$<span id="totalprice">${cart.totalPrice}</span></p></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="checkoutItemContainer" style="border-right: 1px solid #E8E8E8; text-align: center">
                                    <input type="submit" value="Confirm to Checkout" name="checkout">
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br>
                </div>
            </div>
        </div>
        <div id="footer" class="banner">
            <jsp:include page="common/Header.html" flush="true" />               
        </div>
    </body>
</html>
