/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

/**
 *
 * @author liwaihing
 */
public class BookMaintenanceUpdate {
    private Book book;
    
    public void setBook(Book book)
    {
        this.book = book;
    }
    
    public String getBookUpdate(){
        String printlist = "";
        
        printlist += "<tr>";        
        printlist += "<td><label for='mypage'>Book ID</label></td>";
        printlist += "<td>" + book.getBookID() + "</td>";
        printlist += "</tr>";
        printlist += "<tr>";
        printlist += "<td><label for='mypage'>Book Name</label></td>";
        printlist += "<td><input type='text' value='" + book.getBookName() + "'></td>";
        printlist += "</tr>";
        printlist += "<tr>";
        printlist += "<td><label for='mypage'>Author</label></td>";
        printlist += "<td><input type='text' value='" + book.getAuthor() + "'></td>";
        printlist += "</tr>";
        printlist += "<tr>";
        printlist += "<td><label for='mypage'>Description</label></td>";
        printlist += "<td><textarea rows='10'>" + book.getBookDescription() + "</textarea></td>";
        printlist += "</tr>";
        printlist += "<tr>";
        printlist += "<td><label for='mypage'>Price ($)</label></td>";
        printlist += "<td><input type='text' value='" + book.getPrice()+ "'></td>";
        printlist += "</tr>";
        printlist += "<tr>";
        printlist += "<td><label for='mypage'>Availablity</label></td>";
        printlist += "<td><input type='text' value='" + book.getAvailability() + "'></td>";
        printlist += "</tr>";
        printlist += "<tr>";
        printlist += "<td><label for='mypage'>Cover Picture</label></td>";
        printlist += "<td><input type='text' value='/image/" + book.getImageURL() + ".jpg'></td>";
        printlist += "</tr>";
        
        return printlist;
    }
}
