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
public class Menu {
    private String name;
    private String urlPath;
    private String accessType;
    
    public Menu()
    {
        
    }
    
    public void setMenuName(String name)
    {
        this.name = name;
    }
    
    public void setMenuPath(String path)
    {
        this.urlPath = path;
    }
    
    public void setMenuAccessType(String type)
    {
        this.accessType = type;
    }
    
    public String getMenuName()
    {
        return name;
    }
    
    public String getMenuPath()
    {
        return urlPath;
    }
    
    public String getMenuAccessType()
    {
        return accessType;
    }
}
