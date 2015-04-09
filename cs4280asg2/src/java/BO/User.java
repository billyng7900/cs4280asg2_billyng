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
    
    public User(String username)
    {
        this.username = username;
    }
    
    public String getUserName()
    {
        return username;
    }
}
