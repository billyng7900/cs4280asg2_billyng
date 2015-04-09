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
    
    public Book(int bookID, String bookName, String bookDescription, int availability)
    {
        this.bookID = bookID;
        this.bookName = bookName;
        this.bookDescription = bookDescription;
        this.availability = availability;
    }
}
