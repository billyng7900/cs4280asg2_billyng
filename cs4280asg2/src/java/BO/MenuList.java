/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

import BO.Menu;
import java.util.*;

/**
 *
 * @author liwaihing
 */
public class MenuList {
    private ArrayList<Menu> menuList;
    private ArrayList<Menu> loginList = new ArrayList<Menu>();
    private ArrayList<Menu> advanceList = new ArrayList<Menu>();
    
    public void setMenuList(ArrayList<Menu> menuList)
    {
        this.menuList = menuList;
    }
    
    public String getMenuList(int type){
        
        String printlist = "";
        
        
        printlist += "<div id='menuarea'>" +
                    "<ul>" +
                    "<li>" +
                    "<a href='#'><img src='image/ui-icon-login.png' alt=''></a>" +
                    "<ul>";
        if (type==1)
        {
            for (Menu m:menuList)
            {    
                if (m.getMenuAccessType().contains("V"))
                {
                   loginList.add(m);
                }
            }
            
            for(Menu m:loginList)
            {
                printlist += "<li><a href='" + m.getMenuPath() + ".jsp'>" + m.getMenuName() + "</a></li>" ;
            }
            printlist += "</ul>" +
                        "</li>" +
                        "<li><a href='ShoppingCart.jsp'><img src='image/ui-icon-shoppingcart.png' alt=''></li></a>" +
                        "</ul>" +
                        "</div>";
        }
        else
        {
            
            for (Menu m:menuList)
            {                   
                if (m.getMenuAccessType().contains("C"))
                {
                   advanceList.add(m);
                }
                if(type==3)
                {
                    if (m.getMenuAccessType().contains("M"))
                    {
                       advanceList.add(m);
                    }
                }
                
            }
            printlist += "<li><a href='#'.jsp'>Logout</a></li>" ;
            printlist += "</ul>" +
                        "</li>" +
                        "<a href='ShoppingCart.jsp'><li><img src='image/ui-icon-shoppingcart.png' alt=''></li></a>";
            printlist += "<li>" +
                        "<a href='#'><img src='image/ui-icon-advance.png' alt=''></a>"+
                        "<ul>";
            for(Menu m:advanceList)
            {
                printlist += "<li><a href='" + m.getMenuPath() + ".jsp'>" + m.getMenuName() + "</a></li>" ;
            }
            printlist += "</ul>" +
                        "</li>" +
                        "</ul>" +
                        "</div>";
        }
         
                
        
        return printlist;
    }
}
