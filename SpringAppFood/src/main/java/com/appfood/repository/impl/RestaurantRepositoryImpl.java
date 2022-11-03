package com.appfood.repository.impl;


import com.appfood.pojo.Restaurant;
import com.appfood.repository.RestaurantRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

@Repository
@Transactional
public class RestaurantRepositoryImpl implements RestaurantRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Restaurant getByUserId(int userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Restaurant> query = builder.createQuery(Restaurant.class);
        Root root = query.from(Restaurant.class);
        query = query.select(root);

        query = query.where(builder.equal(root.join("user").get("id").as(Integer.class), userId));

        org.hibernate.query.Query q = session.createQuery(query);
        return (Restaurant) q.getSingleResult();
    }
    @Override
    public boolean addOrUpdate(Restaurant restaurant) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (restaurant.getId() > 0)
                session.update(restaurant);
            else
                session.save(restaurant);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }

        return false;
    }
}