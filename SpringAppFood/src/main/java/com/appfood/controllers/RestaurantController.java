/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.appfood.controllers;

import com.appfood.pojo.Category;
import com.appfood.pojo.Product;
import com.appfood.pojo.SaleOrder;
import com.appfood.pojo.User;
import com.appfood.service.CategoryService;
import com.appfood.service.OrderService;
import com.appfood.service.ProductService;
import com.appfood.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author thien thien
 */
@Controller
@Transactional
public class RestaurantController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;

    private void loadAllList(Model model) {
        List<Category> categories = categoryService.getCategories();
        model.addAttribute("categories", categories);
    }

    private void loadAllService(Model model) {
        model.addAttribute("categoryService", categoryService);
//        model.addAttribute("employerService", employerService);
    }

    @RequestMapping("/restaurant")
    public String index(Model model) {
        model.addAttribute("active", "1");
        return "restaurant";
    }

    @RequestMapping("/restaurant/management")
    public String management(Model model,
            Authentication authentication,
            @RequestParam(required = false) Map<String, String> params) {

        if (this.userService.getUserByUsername(authentication.getName()).getActive() == 0) {
            return "access-denied";
        }

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String name = params.getOrDefault("name", null);
        String description = params.getOrDefault("description", null);
//        String beginningSalary = params.getOrDefault("beginningSalary", null);
//        String endingSalary = params.getOrDefault("endingSalary", null);
//        String location = params.getOrDefault("location", null);
//        String sort = params.getOrDefault("sort", null);

        Map<String, String> pre = new HashMap<>();
        if (name != null) {
            pre.put("name", name);
            model.addAttribute("name", name);
        }
        if (description != null) {
            pre.put("description", description);
            model.addAttribute("description", description);
        }
//        if (beginningSalary != null) {
//            pre.put("beginningSalary", beginningSalary);
//            model.addAttribute("beginningSalary", beginningSalary);
//        }
//        if (endingSalary != null) {
//            pre.put("endingSalary", endingSalary);
//            model.addAttribute("endingSalary", endingSalary);
//        }
//        if (location != null) {
//            pre.put("location", location);
//            model.addAttribute("location", location);
//        }
//        if (sort != null) {
//            pre.put("sort", sort);
//            model.addAttribute("sort", sort);
//        }

        int maxItems = 20;
        model.addAttribute("maxItems", maxItems);

        pre.put("postedByUserId", String.valueOf(this.userService.getUserByUsername(authentication.getName()).getId()));
        List<Product> products = productService.getProducts(pre, page);
        List<Product> productsSize = productService.getProducts(pre, 0);

        model.addAttribute("currentPage", page);
        model.addAttribute("counter", productsSize.size());
        model.addAttribute("productService", productService);

        loadAllService(model);
        model.addAttribute("products", products);
//        model.addAttribute("errMsg", model.asMap().get("errMsg"));
//        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "restaurant-management";
    }

    @GetMapping("/restaurant/post/add-or-update")
    public String addOrUpdateRestaurant(Model model,
            Authentication authentication,
            @RequestParam(name = "id", defaultValue = "0") int id) {

        if (this.userService.getUserByUsername(authentication.getName()).getActive() == 0) {
            return "access-denied";
        }

        int userId = this.userService.getUserByUsername(authentication.getName()).getId();

//        Product product = new Product();
//        product.setId(0);
//        model.addAttribute("product", product);
        if (id > 0) {
            Product product = this.productService.getProductById(id);
            if (product != null && product.getPostedByUser().getId() == userId) {
                model.addAttribute("product", product);

            } else {
                return "redirect:/access-denied";
            }
        } else {
            Product product = new Product();
            product.setId(0);
            model.addAttribute("product", product);
        }

        loadAllList(model);

        return "restaurant-add-post";
    }

    @PostMapping(value = "/restaurant/post/add-or-update")
    public String addOrUpdateRestaurant(Model model,
            Authentication authentication,
            @ModelAttribute(value = "product") @Valid Product product,
            BindingResult result,
            final RedirectAttributes redirectAttrs) throws ParseException {

        if (this.userService.getUserByUsername(authentication.getName()).getActive() == 0) {
            return "access-denied";
        }

        String errMsg = null;
        String sucMsg = null;

        loadAllList(model);

//        jobPostValidator.validate(jobPost, result);
        if (result.hasErrors()) {
            return "restaurant";
        }

        product.setPostedByUser(userService.getUserById(product.getPostedByUserId()));
        product.setCategoryId(categoryService.getById(product.getCategoryById()));
//        product.setCreatedDate(new Date());

//        if (!jobPost.getExpiredDateStr().equals(""))
//            jobPost.setExpiredDate(new SimpleDateFormat("yyyy-MM-dd").parse(jobPost.getExpiredDateStr()));
//
        boolean productAddedCheck = this.productService.addProduct(product);
        if (productAddedCheck) {

            sucMsg = String.format("Thêm thành công tin nha hang ");

        } else {
            errMsg = String.format("Thêm tin nha hang thất bại");
        }

        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "restaurant-add-post";
    }

    @GetMapping("/restaurant/stats")
    public String stats(Model model,Authentication authentication,
            @RequestParam(value = "quarter", required = false, defaultValue = "1") int quarter,
            @RequestParam(value = "month", required = false, defaultValue = "1") int month,
            @RequestParam(value = "year", defaultValue = "2022") int year) {
        
        if (this.userService.getUserByUsername(authentication.getName()).getActive() == 0) {
            return "access-denied";
        }
        model.addAttribute("catStats", this.productService.countProdsByCate());
        model.addAttribute("revenuStats", this.productService.revenueStats(quarter, year, month));
        return "stats";
    }

    @RequestMapping("/restaurant/confirm-order")
    public String confirmOrder(Model model,Authentication authentication,
            @RequestParam(required = false) Map<String, String> params) {
//        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (this.userService.getUserByUsername(authentication.getName()).getActive() == 0) {
            return "access-denied";
        }

        List<SaleOrder> orders = orderService.getByActive(0);
        List<SaleOrder> ordersSize = orderService.getByActive(0);
        model.addAttribute("orders", orders);
//
//        model.addAttribute("currentPage", page);

        model.addAttribute("counter", ordersSize.size());
        model.addAttribute("orderService", orderService);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "restaurant-confirm-order";
    }

    @RequestMapping(path = "/restaurant/confirm-order/accept")
    public String acceptOrder(Model model,Authentication authentication,
            @RequestParam(name = "id", defaultValue = "0") int id,
            final RedirectAttributes redirectAttrs) {
        
        if (this.userService.getUserByUsername(authentication.getName()).getActive() == 0) {
            return "access-denied";
        }
        
        String errMsg = null;
        String sucMsg = null;

        SaleOrder order = new SaleOrder();
        if (id != 0) {
            order = this.orderService.getOrderById(id);
            order.setActive(1);
        }

        if (order.getActive() == 1) {
            sucMsg = String.format("Xác nhận đơn hàng '%s' thành công", order.getUserId());
        } else {
            errMsg = String.format("Xác nhận đơn hàng '%s' không thành công", order.getUserId());
        }
        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/restaurant/confirm-order";
    }
}
