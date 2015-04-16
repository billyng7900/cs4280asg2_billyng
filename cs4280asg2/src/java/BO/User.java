/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BO;

/**
 *
 * @author billyng
 */
public class User {
    String username;
    boolean isManager;
    int loyaltyPoints;
    
    public User()
    {
        
    }
    
    public void setUserName(String username)
    {
        this.username = username;
    }
    
    public String getUserName()
    {
        return username;
    }
    
    public void setIsManager(boolean isManager)
    {
        this.isManager = isManager;
    }
    
    public boolean getIsManager()
    {
        return isManager;
    }
    
    public void setLoyaltyPoints(int loyaltyPoints)
    {
        this.loyaltyPoints = loyaltyPoints;
    }
    
    public int getLoyaltyPoints()
    {
        return loyaltyPoints;
    }
}
