/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;
import java.util.*;
import BO.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author billyng
 */
public class ShoppingCart {
    ArrayList<CartBook> shoppingCart;
    public void setShoppingCart(ArrayList<CartBook> shoppingCart)
    {
        this.shoppingCart = shoppingCart;
    }
    
    public ArrayList<CartBook> getShoppingCart()
    {
        return shoppingCart;
    }
    
    public String getCartBookList()
    {
        String printlist = "";
        int counter=1;
        for(CartBook b:shoppingCart)
        {
            Book book = b.getBook();
            printlist+="<tr>";
            printlist+="<td>";
            printlist+="<a href='DetailPage?bookID="+book.getBookID()+"'><image src='image/"+book.getImageURL()+".jpg' height='150px'></a>";
            printlist+="</td>";
            printlist+="<td>";
            printlist+="<a href='DetailPage?bookID="+book.getBookID()+"'>";
            printlist+="<label style='text-decoration: bold; font-size: 20px'>";
            printlist+=book.getBookName();
            printlist+="</label>";
            printlist+="<label style='font-size: 12px;'>";
            printlist+="by "+book.getAuthor()+"<br><br>";
            printlist+="</label>";
            printlist+="</a>";
            printlist+="</td>";
            printlist+="<td><label>$"+book.getPrice()+"</label></td>";
            printlist+="<td><input type='text' id='quantity"+counter+"' name='quantity"+counter+"' value='"+b.getQuantity()+"' /></td>";
            printlist+="</tr>";
            counter++;
        }
        return printlist;
    }
}
