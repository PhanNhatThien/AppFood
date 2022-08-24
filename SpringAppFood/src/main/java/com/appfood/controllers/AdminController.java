/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.controllers;


import com.appfood.pojo.Product;
import com.appfood.service.ProductService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author thien thien
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private ProductService productService;
    
    @GetMapping("/products")
    public String list(Model model) {
        model.addAttribute("product", new Product());
        return "products";
    }
    
    @PostMapping("/products")
    public String add(@ModelAttribute(value = "product") @Valid Product p,
            BindingResult rs) {
        if (rs.hasErrors())
            return "products";
        
        if (this.productService.addProduct(p) == true)
            return "redirect:/admin/products";
        
         return "products";
    }
    @GetMapping("/stats")
    public String stats(Model model,
            @RequestParam(value = "quarter", required = false, defaultValue = "1") int quarter,
            @RequestParam(value = "year", defaultValue = "2022") int year) {
        model.addAttribute("catStats", this.productService.countProdsByCate());
        model.addAttribute("revenuStats", this.productService.revenueStats(quarter, year));
        return "stats";
    }
    
//    @GetMapping("/products/{productId}")
//    public String productDetails( @PathVariable(value = "productId") int id) {
////        model.addAttribute("product", this.productService.getProductById(id));
//        return "details";
//    }
}
