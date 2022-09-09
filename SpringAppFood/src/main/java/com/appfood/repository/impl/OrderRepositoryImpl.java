/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.repository.impl;

import com.appfood.pojo.Cart;
import com.appfood.pojo.OrderDetail;
import com.appfood.pojo.SaleOrder;
import com.appfood.pojo.User;
import com.appfood.repository.OrderRepository;
import com.appfood.repository.ProductRepository;
import com.appfood.repository.UserRepository;
import com.appfood.utils.Utils;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author thien thien
 */
@Repository
public class OrderRepositoryImpl implements OrderRepository {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<Integer, Cart> cart) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            SaleOrder order = new SaleOrder();
//            order.setUserId(this.userRepository.getUserById(6));
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            order.setUserId(this.userRepository.getUserByUsername(authentication.getName()));
            order.setCreatedDate(new Date());

            Map<String, String> stats = Utils.cartStats(cart);
            order.setAmount(Long.parseLong(stats.get("amount")));

            session.save(order);

            for (Cart c : cart.values()) {
                OrderDetail d = new OrderDetail();
                d.setOrderId(order);
                d.setProductId(this.productRepository.getProductById(c.getProductId()));
                d.setUnitPrice(c.getPrice());
                d.setNum(c.getQuantity());

                session.save(d);
            }

            return true;

        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<SaleOrder> getByActive(int active) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<SaleOrder> query = builder.createQuery(SaleOrder.class);
        Root root = query.from(SaleOrder.class);
        query = query.select(root);

//        Predicate p1 = builder.equal(root.get("userRole").as(String.class), role.trim());
        Predicate p1 = builder.equal(root.get("active").as(Integer.class), active);

        query = query.where(p1);

        query = query.orderBy(builder.desc(root.get("id")));

        javax.persistence.Query q = session.createQuery(query);


        return q.getResultList();
    }

    @Override
    public SaleOrder getOrderById(int orderId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(SaleOrder.class, orderId);
    }
}


