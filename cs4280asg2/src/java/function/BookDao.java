/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;
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
        if(rs != null && rs.next() != false)
        {
            String bookName = rs.getString("book_name");
            String bookDescription = rs.getString("book_description");
            int availability = rs.getInt("availability");
            String imageURL = rs.getString("imageURL");
            Book book = new Book(bookID,bookName,bookDescription,availability,imageURL);
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
    
    public ArrayList<Book> getBookList()
    {
        try{
            ArrayList<Book> bookList = new ArrayList<Book>();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String getBookSql = "Select * from [book]";
            ResultSet rs = stmt.executeQuery(getBookSql);
            if(rs != null && rs.next() != false)
            {
                while(rs.next())
                {
                    int bookID = rs.getInt("bookID");
                    String bookName = rs.getString("book_name");
                    String bookDescription = rs.getString("book_description");
                    int availability = rs.getInt("availability");
                    String imageURL = rs.getString("imageURL");
                    Book book = new Book(bookID,bookName,bookDescription,availability,imageURL);
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
}