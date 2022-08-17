/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myappfood.hibernateappfood;

import com.myappfood.hibernateappfood.HibernateUtils;
import com.myappfood.pojo.Product;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author thien thien
 */
public class Demo {
    public static void main(String[] args) {
        
        
        try(Session s = HibernateUtils.getFactory().openSession()){
            Query q = s.createNamedQuery("Product.findAll");
            List<Product> products = q.getResultList();
            products.forEach(p -> System.out.printf("%d - %s - %d VND\n", p.getId(), p.getName(), p.getPrice()));
        }
//        ProductService s = new ProductService();
//        s.getProducts(null, 0).forEach(p -> System.out.printf("%d - %s - %.1f VND\n", p.getId(), p.getName(), p.getPrice()));
    }
}
