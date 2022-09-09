/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.repository;

import com.appfood.pojo.Category;
import java.util.List;

/**
 *
 * @author thien thien
 */
public interface CategoryRepository {
    List<Category> getCategories();
    Category getById(int id);
}
