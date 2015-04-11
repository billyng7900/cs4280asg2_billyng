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
    private String author;
    private float price;
    
    public Book()
    {

    }
    
    public void setBookID(int bookID)
    {
        this.bookID = bookID;
    }
    
    public void setBookName(String bookName)
    {
        this.bookName = bookName;
    }
    
    public void setBookDescription(String bookDescription)
    {
        this.bookDescription = bookDescription;
    }
    
    public void setAvailability(int availability)
    {
        this.availability = availability;
    }
    
    public void setImageURL(String imageURL)
    {
        this.imageURL = imageURL;
    }
    
    public void setAuthor(String author)
    {
        this.author = author;
    }
    
    public void setPrice(float price)
    {
        this.price = price;
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
    
    public String getAuthor()
    {
        return author;
    }
    
    public float getPrice()
    {
        return price;
    }
}
