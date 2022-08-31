/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.utils;

import com.appfood.pojo.Cart;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author thien thien
 */
public class Utils {
    public static int countCart(Map<Integer, Cart> cart)
    {
        int q = 0;
        
        if(cart != null)
            for (Cart c:cart.values())
                q += c.getQuantity();
        
        return q;
    }
    
    public static Map<String, String> cartStats(Map<Integer, Cart> cart)
    {
        Long s = 0l;
        int q = 0;
        
        if(cart != null)
            for (Cart c:cart.values()){
                q += c.getQuantity();
                s += c.getQuantity() * c.getPrice();
            }
        
        Map<String, String> kq = new HashMap<>();
        
        kq.put("counter", String.valueOf(q));
        kq.put("amount", String.valueOf(s));
        
        return kq;
    }
}
