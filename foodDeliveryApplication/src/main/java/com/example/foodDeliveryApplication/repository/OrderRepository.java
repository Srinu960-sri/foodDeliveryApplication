package com.example.foodDeliveryApplication.repository;

import com.example.foodDeliveryApplication.entity.Order;
import com.example.foodDeliveryApplication.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    List<Order> findByUserOrderByOrderDateDesc(User user);
}


