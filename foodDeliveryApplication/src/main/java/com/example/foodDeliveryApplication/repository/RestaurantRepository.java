package com.example.foodDeliveryApplication.repository;

import com.example.foodDeliveryApplication.entity.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RestaurantRepository extends JpaRepository<Restaurant, Integer> {

    List<Restaurant> findByCityIgnoreCase(String city);
}


