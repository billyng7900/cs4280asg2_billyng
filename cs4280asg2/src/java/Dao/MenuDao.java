/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import BO.Menu;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author liwaihing
 */
public class MenuDao {
    
    //Get menu list for visitor
    public ArrayList<Menu> getMenu(int type)
    {
        try{
            ArrayList<Menu> menuList = new ArrayList<Menu>();
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/aiad039_db");
            Connection  con = ds.getConnection();
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String getMenuSql = "";
            if (type == 1)
                getMenuSql = "Select * from [Menu] where access_type in ('V','A')";
            else if (type == 2)
                getMenuSql = "Select * from [Menu] where access_type in ('C','A')";
            else if (type == 3)
                getMenuSql = "Select * from [Menu] where access_type in ('C','M','A')";
            ResultSet rs = stmt.executeQuery(getMenuSql);
            if(rs != null)
            {
                while(rs.next())
                {
                    String name = rs.getString("name");
                    String urlPath = rs.getString("path");
                    String accessType = rs.getString("access_type");                
                    Menu menu = new Menu();
                    menu.setMenuName(name);
                    menu.setMenuPath(urlPath);
                    menu.setMenuAccessType(accessType);                       
                    menuList.add(menu);
                }
                rs.close();
                if(con!=null)
                    con.close();
                return menuList;
            }
            else
               return null;
        }catch (SQLException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        } catch (NamingException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        } 
        return null;
    }
}
