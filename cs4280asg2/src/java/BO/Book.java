/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

/**
 *
 * @author billyng
 */
public class Book {
    private int bookID;
    private String bookName;
    private String bookDescription;
    private int availability;
    private String imageURL;
    
    public Book(int bookID, String bookName, String bookDescription, int availability, String imageURL)
    {
        this.bookID = bookID;
        this.bookName = bookName;
        this.bookDescription = bookDescription;
        this.availability = availability;
        this.imageURL = imageURL;
        
    }
    
    public String getBookName()
    {
        return bookName;
    }
    
    public String getBookDescription()
    {
        return bookDescription;
    }
    
    public int getAvailability()
    {
        return availability;
    }
    
    public String getImageURL()
    {
        return imageURL;
    }
    
    public int getBookID()
    {
        return bookID;
    }
}
