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
    int userId;
    String realname;
    int contact;
    
    public User()
    {
        
    }
    
    public void setUserId(int userId)
    {
        this.userId = userId;
    }
    
    public int getUserId()
    {
        return userId;
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
    
    public void setRealName(String realname)
    {
        this.realname = realname;
    }
    
    public String getRealName()
    {
        return realname;
    }
    
    public void setContact(int contact)
    {
        this.contact = contact;
    }
    
    public int getContact()
    {
        return contact;
    }
}
