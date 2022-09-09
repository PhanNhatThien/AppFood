/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.appfood.service;

import com.appfood.pojo.Cart;
import java.util.Map;

/**
 *
 * @author thien thien
 */
public interface OrderService {
    boolean addReceipt(Map<Integer, Cart> cart);
}
