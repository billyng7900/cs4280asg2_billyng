/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import BO.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
/**
 *
 * @author billyng
 */
public class OrderDao {
    public int insertRecord(int orderID,int customerID,int bookID,int quantity,Calendar orderdate,int status,int pointuse)
    {
        return 1; 
    }
}
