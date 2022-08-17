/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.service.impl;

import com.appfood.pojo.Product;
import com.appfood.repository.ProductRepository;
import com.appfood.service.ProductService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author thien thien
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;
    
    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        return this.productRepository.getProducts(params, page);
    }

    @Override
    public int countProduct() {
        return this.productRepository.countProduct();
    }

    @Override
    public boolean deleteProduct(int id) {
        return this.productRepository.deleteProduct(id);
    }

    @Override
    public boolean addProduct(Product p) {
        p.setImage("https://res.cloudinary.com/dtswvj7fd/image/upload/v1660674849/cld-sample-4.jpg");
        return this.productRepository.addProduct(p);
    }
    
}