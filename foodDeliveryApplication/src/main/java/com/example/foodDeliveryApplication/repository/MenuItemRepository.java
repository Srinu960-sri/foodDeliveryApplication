package com.example.foodDeliveryApplication.repository;

import com.example.foodDeliveryApplication.entity.MenuItem;
import com.example.foodDeliveryApplication.entity.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MenuItemRepository extends JpaRepository<MenuItem, Integer> {

    List<MenuItem> findByRestaurant(Restaurant restaurant);
}


