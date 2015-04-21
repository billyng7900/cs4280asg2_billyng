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
 * @author Billy
 */
public class BookList {
    private ArrayList<Book> booklist;
    
    public void setBookList(ArrayList<Book> booklist)
    {
        
        this.booklist = booklist;
    }
    
    public String getHomeBookList()
    {
        String printlist = "";
        for(Book b:booklist)
        {
            printlist+="<div class='contentItem'>";
            printlist+="<a href='DetailPage?bookID="+b.getBookID()+"'>";
            printlist+="<img src='image\\"+b.getImageURL()+".jpg' alt='image' height='150px'>";
            printlist+="</a>";
            printlist+="<br><br>";
            printlist+="<a href='DetailPage?bookID="+b.getBookID()+"'>";
            printlist+=b.getBookName();
            printlist+="</a>";
            printlist+="</div>";
        }
        return printlist;
    }
    
    public ArrayList<Book> getBookList()
    {
        return booklist;
    }
}
