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
    private Menu shoppingcart = new Menu();
    
    public void setMenuList(ArrayList<Menu> menuList)
    {
        this.menuList = menuList;
    }
    
    public String getMenuList(int type){
        
        String printlist = "";
               
        printlist += "<div id='menuarea'>";
        printlist += "<ul>";
        printlist += "<li>";
        printlist += "<a href='#'><img src='image/ui-icon-login.png' alt=''></a>";
        printlist += "<ul>";
        if (type==1)
        {
            for (Menu m:menuList)
            {    
                if (m.getMenuAccessType().contains("V"))
                {
                   loginList.add(m);
                }
                if (m.getMenuName().toUpperCase().contains("CART"))
                {
                    shoppingcart = m;
                }
            }            
            for(Menu m:loginList)
            {
                printlist += "<li><a href='" + m.getMenuPath() + "'>" + m.getMenuName() + "</a></li>" ;
            }
            printlist += "</ul>";
            printlist += "</li>";
            printlist += "<li><a href='" + shoppingcart.getMenuPath() + "'><img src='image/ui-icon-shoppingcart.png' alt=''></li></a>";
            printlist += "</ul>";
            printlist += "</div>";
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
                if (m.getMenuName().toUpperCase().contains("CART"))
                {
                    shoppingcart = m;
                }
            }
            printlist += "<li><a href='Logout'.jsp'>Logout</a></li>" ;
            printlist += "</ul>";
            printlist += "</li>";
            printlist += "<a href='" + shoppingcart.getMenuPath() + "'><li><img src='image/ui-icon-shoppingcart.png' alt=''></li></a>";
            printlist += "<li>";
            printlist += "<a href='#'><img src='image/ui-icon-advance.png' alt=''></a>";
            printlist += "<ul>";
            for(Menu m:advanceList)
            {
                printlist += "<li><a href='" + m.getMenuPath() + "'>" + m.getMenuName() + "</a></li>" ;
            }
            printlist += "</ul>";
            printlist += "</li>";
            printlist += "</ul>";
            printlist += "</div>";
        }
        
        return printlist;
    }
}
