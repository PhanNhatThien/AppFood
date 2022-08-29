/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.repository;

import com.appfood.pojo.User;

/**
 *
 * @author thien thien
 */
public interface UserRepository {
    User getUserByUsername(String username);
}
