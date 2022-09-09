/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.appfood.repository;

import com.appfood.pojo.Cart;
import java.util.Map;

/**
 *
 * @author thien thien
 */
public interface OrderRepository {
    boolean addReceipt(Map<Integer, Cart> cart);
}
