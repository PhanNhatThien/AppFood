/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.service.impl;

import com.appfood.pojo.Cart;
import com.appfood.pojo.SaleOrder;
import com.appfood.repository.OrderRepository;
import com.appfood.service.OrderService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author thien thien
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderRepository orderRepository;
    
    @Override
    public boolean addReceipt(Map<Integer, Cart> cart) {
        if(cart != null)
            return this.orderRepository.addReceipt(cart);
        
        return false;
    }

    @Override
    public List<SaleOrder> getByActive(int active) {
        return this.orderRepository.getByActive(active);
    }

    @Override
    public SaleOrder getOrderById(int orderId) {
        return this.orderRepository.getOrderById(orderId);
    }
}
