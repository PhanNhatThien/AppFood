/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.service;

import com.appfood.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author thien thien
 */
public interface UserService extends UserDetailsService{
    boolean addUser(User user);
    User getUserByUsername(String username);
    User getUserById(int userId);
    List<User> getByRole(String role, int active);
}
