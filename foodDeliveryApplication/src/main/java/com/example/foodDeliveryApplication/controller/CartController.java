package com.example.foodDeliveryApplication.controller;

import com.example.foodDeliveryApplication.entity.MenuItem;
import com.example.foodDeliveryApplication.model.Cart;
import com.example.foodDeliveryApplication.model.CartItem;
import com.example.foodDeliveryApplication.repository.MenuItemRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collection;

@Controller
public class CartController {

    private final MenuItemRepository menuItemRepository;

    public CartController(MenuItemRepository menuItemRepository) {
        this.menuItemRepository = menuItemRepository;
    }

    private Cart getOrCreateCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        Cart cart = getOrCreateCart(session);
        Collection<CartItem> cartItems = cart.getItems();
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("restaurantId", session.getAttribute("restaurantId"));
        return "cart";
    }

    @PostMapping("/cart")
    public String updateCart(@RequestParam String action,
                             @RequestParam Integer itemId,
                             @RequestParam int quantity,
                             @RequestParam(required = false) Integer restaurantId,
                             HttpSession session) {
        Cart cart = getOrCreateCart(session);

        if (restaurantId != null) {
            session.setAttribute("restaurantId", restaurantId);
        }

        if ("add".equalsIgnoreCase(action)) {
            MenuItem menuItem = menuItemRepository.findById(itemId)
                    .orElseThrow(() -> new IllegalArgumentException("Menu item not found: " + itemId));
            cart.addItem(menuItem, quantity);
        } else if ("update".equalsIgnoreCase(action)) {
            MenuItem menuItem = menuItemRepository.findById(itemId)
                    .orElse(null);
            cart.updateItem(itemId, quantity, menuItem);
        } else if ("remove".equalsIgnoreCase(action)) {
            cart.removeItem(itemId);
        }

        return "redirect:/cart";
    }
}


