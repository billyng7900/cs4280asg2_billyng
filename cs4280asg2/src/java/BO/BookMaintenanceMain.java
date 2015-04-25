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
 * @author liwaihing
 */
public class BookMaintenanceMain {
    private ArrayList<Book> booklist;
    
    public void setBookList(ArrayList<Book> booklist)
    {
        this.booklist = booklist;
    }
    
    public String getMaintenanceBookList()
    {
        String printlist = "";
        for(Book b:booklist)
        {
            printlist += "<tr>";
            printlist += "<td>" + b.getBookID() + "</td>";
            printlist += "<td>" + b.getBookName() + "</td>";
            printlist += "<td>" + b.getAvailability() + "</td>";
            printlist += "<td><a href='MaintenanceUpdate.jsp?bookID=" + b.getBookID() + "'><input type='button' value='Update'></a></td>";
            printlist += "<td><input type='button' value='Delete'></td>";
            printlist += "</tr>";
        }
        return printlist;
    }
    
}
