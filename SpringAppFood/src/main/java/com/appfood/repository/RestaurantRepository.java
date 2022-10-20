package com.appfood.repository;


import com.appfood.pojo.Restaurant;
import com.appfood.pojo.User;

import java.util.List;
import java.util.Map;

public interface RestaurantRepository {
    Restaurant getByUserId(int userId);

}


