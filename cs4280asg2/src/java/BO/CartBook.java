/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;
import java.util.*;
import BO.Book;
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
public class CartBook{
    int quantity;
    Book book;
    
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }
    
    public int getQuantity()
    {
        return quantity;
    }
    
    public void setBook(Book book)
    {
        this.book = book;
    }
    
    public Book getBook()
    {
        return book;
    }
            
}
