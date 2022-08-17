/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myappfood.services;

import com.myappfood.hibernateappfood.HibernateUtils;
import com.myappfood.pojo.Product;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;

/**
 *
 * @author thien thien
 */
public class ProductService {
    public List<Product> getProducts(String kw, int page){
        try(Session session = HibernateUtils.getFactory().openSession()){
            CriteriaBuilder b = session.getCriteriaBuilder();
            CriteriaQuery<Product> q = b.createQuery(Product.class);
            Root root = q.from(Product.class);
            q.select(root);
            
            Query query = session.createQuery(q);
            return query.getResultList();
            
        }
    }
}
