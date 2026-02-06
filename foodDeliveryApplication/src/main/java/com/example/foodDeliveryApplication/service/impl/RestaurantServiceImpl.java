package com.example.foodDeliveryApplication.service.impl;

import com.example.foodDeliveryApplication.entity.MenuItem;
import com.example.foodDeliveryApplication.entity.Restaurant;
import com.example.foodDeliveryApplication.repository.MenuItemRepository;
import com.example.foodDeliveryApplication.repository.RestaurantRepository;
import com.example.foodDeliveryApplication.service.RestaurantService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RestaurantServiceImpl implements RestaurantService {

    private final RestaurantRepository restaurantRepository;
    private final MenuItemRepository menuItemRepository;

    public RestaurantServiceImpl(RestaurantRepository restaurantRepository,
                                 MenuItemRepository menuItemRepository) {
        this.restaurantRepository = restaurantRepository;
        this.menuItemRepository = menuItemRepository;
    }

    @Override
    public List<Restaurant> findAll() {
        return restaurantRepository.findAll();
    }

    @Override
    public Restaurant findById(Integer id) {
        return restaurantRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Restaurant not found: " + id));
    }

    @Override
    public List<MenuItem> findMenuForRestaurant(Integer restaurantId) {
        Restaurant restaurant = findById(restaurantId);
        return menuItemRepository.findByRestaurant(restaurant);
    }
}


