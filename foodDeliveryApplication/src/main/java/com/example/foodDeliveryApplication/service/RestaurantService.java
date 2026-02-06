package com.example.foodDeliveryApplication.service;

import com.example.foodDeliveryApplication.entity.MenuItem;
import com.example.foodDeliveryApplication.entity.Restaurant;

import java.util.List;

public interface RestaurantService {

    List<Restaurant> findAll();

    Restaurant findById(Integer id);

    List<MenuItem> findMenuForRestaurant(Integer restaurantId);
}


