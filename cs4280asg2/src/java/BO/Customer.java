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
public class Customer extends User{
    int loyaltyPoints;
    public Customer(String username,int loyaltyPoints) {
        super(username);
        this.loyaltyPoints = loyaltyPoints;
    }
    
    public int getLoyaltyPoints()
    {
        return loyaltyPoints;
    }
}
