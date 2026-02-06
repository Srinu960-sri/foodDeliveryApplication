package com.example.foodDeliveryApplication.repository;

import com.example.foodDeliveryApplication.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
}


