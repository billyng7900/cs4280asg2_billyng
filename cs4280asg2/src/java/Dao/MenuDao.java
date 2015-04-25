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
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad039_db", "aiad039", "aiad039");
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
        }catch (ClassNotFoundException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        }catch (SQLException e) {
            System.out.println("<div style='color: red'>" + e.toString() + "</div>");
        } 
        return null;
    }
}
