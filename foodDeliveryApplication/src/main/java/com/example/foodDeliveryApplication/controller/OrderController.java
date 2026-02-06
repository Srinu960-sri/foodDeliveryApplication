package com.example.foodDeliveryApplication.controller;

import com.example.foodDeliveryApplication.entity.MenuItem;
import com.example.foodDeliveryApplication.entity.Order;
import com.example.foodDeliveryApplication.entity.OrderItem;
import com.example.foodDeliveryApplication.entity.Restaurant;
import com.example.foodDeliveryApplication.entity.User;
import com.example.foodDeliveryApplication.model.Cart;
import com.example.foodDeliveryApplication.model.CartItem;
import com.example.foodDeliveryApplication.repository.MenuItemRepository;
import com.example.foodDeliveryApplication.repository.OrderItemRepository;
import com.example.foodDeliveryApplication.repository.OrderRepository;
import com.example.foodDeliveryApplication.repository.RestaurantRepository;
import com.example.foodDeliveryApplication.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {

    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final RestaurantRepository restaurantRepository;
    private final MenuItemRepository menuItemRepository;
    private final UserRepository userRepository;

    public OrderController(OrderRepository orderRepository,
                           OrderItemRepository orderItemRepository,
                           RestaurantRepository restaurantRepository,
                           MenuItemRepository menuItemRepository,
                           UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.orderItemRepository = orderItemRepository;
        this.restaurantRepository = restaurantRepository;
        this.menuItemRepository = menuItemRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/checkout")
    public String checkoutForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            return "redirect:/cart";
        }

        model.addAttribute("user", user);
        model.addAttribute("cartItems", cart.getItems());
        model.addAttribute("restaurantId", session.getAttribute("restaurantId"));
        return "checkout";
    }

    @PostMapping("/checkout")
    public String placeOrder(@RequestParam(value = "restaurantId", required = false) Integer restaurantIdParam,
                             @RequestParam("address") String address,
                             @RequestParam("payment_method") String paymentMethod,
                             HttpSession session,
                             Model model) {
        try {
            User user = (User) session.getAttribute("user");
            if (user == null) {
                return "redirect:/login";
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null || cart.isEmpty()) {
                return "redirect:/cart";
            }

            // If restaurantId not provided in form, get from session
            Integer restaurantId = restaurantIdParam;
            if (restaurantId == null) {
                Object sessionRestId = session.getAttribute("restaurantId");
                if (sessionRestId != null) {
                    restaurantId = Integer.parseInt(sessionRestId.toString());
                }
            }

            if (restaurantId == null) {
                model.addAttribute("error", "Restaurant information missing. Please select a restaurant.");
                return "checkout";
            }

            final Integer finalRestaurantId = restaurantId;
            Restaurant restaurant = restaurantRepository.findById(finalRestaurantId)
                    .orElseThrow(() -> new IllegalArgumentException("Restaurant not found: " + finalRestaurantId));

            // Reload user from DB (to attach managed entity)
            User managedUser = userRepository.findById(user.getId())
                    .orElseThrow(() -> new IllegalArgumentException("User not found: " + user.getId()));

            Order order = new Order();
            order.setUser(managedUser);
            order.setRestaurant(restaurant);
            order.setOrderDate(LocalDateTime.now());
            order.setAddress(address);
            order.setPaymentMethod(paymentMethod);
            order.setStatus("PLACED");

            BigDecimal total = BigDecimal.ZERO;
            List<CartItem> cartItems = new ArrayList<>(cart.getItems());

            if (cartItems.isEmpty()) {
                model.addAttribute("error", "Cart is empty");
                return "checkout";
            }

            order = orderRepository.save(order);

            for (CartItem ci : cartItems) {
                if (ci == null || ci.getId() == null) {
                    System.out.println("WARNING: Null cart item detected");
                    continue;
                }
                
                MenuItem menuItem = menuItemRepository.findById(ci.getId())
                        .orElseThrow(() -> new IllegalArgumentException("Menu item not found: " + ci.getId()));

                OrderItem oi = new OrderItem();
                oi.setOrder(order);
                oi.setMenuItem(menuItem);
                oi.setQuantity(ci.getQuantity());
                oi.setPrice(ci.getSubtotal().doubleValue());

                total = total.add(ci.getSubtotal());
                orderItemRepository.save(oi);
            }

            order.setTotalAmount(total);
            orderRepository.save(order);

            // Clear cart and remember last order id for success page
            cart.clear();
            session.setAttribute("lastOrderId", order.getId());

            return "redirect:/orders";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error processing order: " + e.getMessage());
            return "error";
        }
    }

    @GetMapping("/myorders")
    public String myOrders(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        User managedUser = userRepository.findById(user.getId())
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + user.getId()));

        model.addAttribute("orders", orderRepository.findByUserOrderByOrderDateDesc(managedUser));
        return "myorders";
    }

    @GetMapping("/orders")
    public String orderSuccess(HttpSession session, Model model) {
        Object lastOrderId = session.getAttribute("lastOrderId");
        model.addAttribute("lastOrderId", lastOrderId);
        // Optionally clear it after reading
        session.removeAttribute("lastOrderId");
        return "orders";
    }
}


