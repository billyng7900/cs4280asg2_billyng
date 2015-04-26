/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
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
public class BookDao {
    public Book getBook(int bookID)
    {
        try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
        PreparedStatement pstmt = con.prepareStatement("Select * from [book] where [bookID] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        pstmt.setInt(1, bookID);
        ResultSet rs = pstmt.executeQuery();
        if(rs != null && rs.next()!=false)
        {
            String bookName = rs.getString("book_name");
            String bookDescription = rs.getString("book_description");
            int availability = rs.getInt("availability");
            String imageURL = rs.getString("imageURL");
            float price = rs.getFloat("price");
            String author = rs.getString("author");
            Book book = new Book();
            book.setBookID(bookID);
            book.setBookName(bookName);
            book.setBookDescription(bookDescription);
            book.setAvailability(availability);
            book.setImageURL(imageURL);
            book.setAuthor(author);
            book.setPrice(price);
            rs.close();
            if(con!=null)
                con.close();
            return book;
        }
        return null;
        }catch (ClassNotFoundException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        }catch (SQLException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        }
        return null;
    }
    
    public int updateBookAvailability(int bookID, int newAvailability)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Update [book] SET [availability] = ? where [bookID] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, newAvailability);
            pstmt.setInt(2, bookID);
            int affectedRow = pstmt.executeUpdate();
            if(affectedRow>0)
                return 1;
            else
                return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }catch (SQLException e) {
            return -1;
        }
    }
    
    public int updateBook(Book book)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("Update [book] SET [book_name] = ?, [book_description] = ?, [availability] = ?, [imageURL] = ?, [price] = ?, [author] = ? where [bookID] = ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1,book.getBookName());
            pstmt.setString(2, book.getBookDescription());
            pstmt.setInt(3, book.getAvailability());
            pstmt.setString(4, book.getImageURL());
            pstmt.setFloat(5, book.getPrice());
            pstmt.setString(6, book.getAuthor());
            pstmt.setInt(7, book.getBookID());
            int affectedRow = pstmt.executeUpdate();
            if(affectedRow>0)
                return 1;
            else
                return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }catch (SQLException e) {
            return -1;
        }
    }
    
    public ArrayList<Book> getBookListBySearch(String keyword)
    {
        try{
            ArrayList<Book> bookList = new ArrayList<Book>();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            PreparedStatement pstmt = con.prepareStatement("Select * from [book] where [book_name] like ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, "%"+keyword+"%");
            ResultSet rs = pstmt.executeQuery();
            if(rs != null)
            {
                while(rs.next())
                {
                    int bookID = rs.getInt("bookID");
                    String bookName = rs.getString("book_name");
                    String bookDescription = rs.getString("book_description");
                    int availability = rs.getInt("availability");
                    String imageURL = rs.getString("imageURL");
                    float price = rs.getFloat("price");
                    String author = rs.getString("author");
                    Book book = new Book();
                    book.setBookID(bookID);
                    book.setBookName(bookName);
                    book.setBookDescription(bookDescription);
                    book.setAvailability(availability);
                    book.setImageURL(imageURL);
                    book.setAuthor(author);
                    book.setPrice(price);
                    bookList.add(book);
                }
                rs.close();
                if(con!=null)
                    con.close();
                return bookList;
            }
            else
               return null;
        }catch (ClassNotFoundException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        }catch (SQLException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        } 
        return null;
    }
    
    public ArrayList<Book> getBookList()
    {
        try{
            ArrayList<Book> bookList = new ArrayList<Book>();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String getBookSql = "Select * from [book]";
            ResultSet rs = stmt.executeQuery(getBookSql);
            if(rs != null)
            {
                while(rs.next())
                {
                    int bookID = rs.getInt("bookID");
                    String bookName = rs.getString("book_name");
                    String bookDescription = rs.getString("book_description");
                    int availability = rs.getInt("availability");
                    String imageURL = rs.getString("imageURL");
                    float price = rs.getFloat("price");
                    String author = rs.getString("author");
                    Book book = new Book();
                    book.setBookID(bookID);
                    book.setBookName(bookName);
                    book.setBookDescription(bookDescription);
                    book.setAvailability(availability);
                    book.setImageURL(imageURL);
                    book.setAuthor(author);
                    book.setPrice(price);
                    bookList.add(book);
                }
                rs.close();
                if(con!=null)
                    con.close();
                return bookList;
            }
            else
               return null;
        }catch (ClassNotFoundException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        }catch (SQLException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        } 
        return null;
    }
    
    public int insertBook(Book book)
    {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            PreparedStatement pstmt = con.prepareStatement("insert into [Book] values (?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, book.getBookName());
            pstmt.setString(2, book.getBookDescription());
            pstmt.setInt(3, book.getAvailability());
            pstmt.setString(4, book.getImageURL());
            pstmt.setFloat(5, book.getPrice());
            pstmt.setString(6, book.getAuthor());
            int affectedRow = pstmt.executeUpdate();
            if(affectedRow>0)
                return 1;
            else
                return -1;
        }catch (ClassNotFoundException e) {
            return -1;
        }catch (SQLException e) {
            return -1;
        }
    }
}
