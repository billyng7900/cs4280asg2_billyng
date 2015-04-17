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
    
    public void setMenuList(ArrayList<Menu> menuList)
    {
        this.menuList = menuList;
    }
    
    public String getMenuList(){
        
        String printlist = "";
        for (Menu m:menuList)
        {
            printlist += "<a href=\'"+ m.getMenuPath() +".jsp'>";
            printlist += "<div class=\'menuItem\'>" + m.getMenuName() + "</div>";
            printlist += "</a>";
        }
        return printlist;
    }
}
