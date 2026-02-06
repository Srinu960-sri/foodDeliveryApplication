package com.example.foodDeliveryApplication.model;

import com.example.foodDeliveryApplication.entity.MenuItem;

import java.math.BigDecimal;

public class CartItem {

    /**
     * Menu item id, used by JSP as item.id
     */
    private Integer id;

    private String name;

    private BigDecimal price;

    private int quantity;

    public CartItem() {
    }

    public CartItem(Integer id, String name, BigDecimal price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public CartItem(MenuItem menuItem, int quantity) {
        this.id = menuItem.getId();
        this.name = menuItem.getName();
        this.price = menuItem.getPrice();
        this.quantity = quantity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getSubtotal() {
        return price.multiply(BigDecimal.valueOf(quantity));
    }
}

