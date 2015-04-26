/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import java.util.*;

/**
 *
 * @author billyng
 */
public class Order {
    private int orderID;
    private int bookID;
    private int quantity;
    private Book book;
    
    
    
    public void setOrderID(int orderID)
    {
        this.orderID = orderID;
    }
    
    public int getOrderID()
    {
        return orderID;
    }
    
    public void setBookID(int bookID)
    {
        this.bookID = bookID;
    }
    
    public int getBookID()
    {
        return bookID;
    }
    
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
