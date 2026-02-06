package com.example.foodDeliveryApplication.controller;

import com.example.foodDeliveryApplication.entity.User;
import com.example.foodDeliveryApplication.service.RestaurantService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    private final RestaurantService restaurantService;

    public HomeController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }

    @GetMapping({"/", "/restaurants"})
    public String listRestaurants(@RequestParam(value = "city", required = false) String city,
                                  Model model,
                                  HttpSession session) {
        model.addAttribute("restaurants", restaurantService.findAll());
        // make logged-in user (if any) available to JSP
        Object user = session.getAttribute("user");
        if (user instanceof User) {
            model.addAttribute("user", user);
        }
        return "restaurants";
    }

    @GetMapping("/restaurants/{id}/menu")
    public String restaurantMenu(@PathVariable Integer id, Model model, HttpSession session) {
        model.addAttribute("restaurant", restaurantService.findById(id));
        model.addAttribute("menuItems", restaurantService.findMenuForRestaurant(id));
        // remember restaurant in session so cart/checkout know where it came from
        session.setAttribute("restaurantId", id);
        return "menu";
    }

    @GetMapping("/profile")
    public String profilePage(Model model, HttpSession session) {
        Object user = session.getAttribute("user");
        if (user instanceof User) {
            model.addAttribute("user", user);
        }
        return "profile";
    }
}


