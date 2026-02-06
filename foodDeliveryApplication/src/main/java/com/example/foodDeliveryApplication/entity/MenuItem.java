package com.example.foodDeliveryApplication.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import java.math.BigDecimal;

@Entity
@Table(name = "menu")
public class MenuItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MENU_ID")
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "RESTAURANT_ID")
    private Restaurant restaurant;

    // ITEM_NAME
    @Column(name = "ITEM_NAME", nullable = false)
    private String name;

    // PRICE
    @Column(name = "PRICE", nullable = false)
    private BigDecimal price;

    // IS_VEG (tinyint)
    @Column(name = "IS_VEG")
    private Boolean veg;

    // CATEGORY
    @Column(name = "CATEGORY")
    private String category;

    // IMAGE_URL
    @Column(name = "IMAGE_URL")
    private String imageUrl;

    public MenuItem() {
    }

    public MenuItem(Integer id, Restaurant restaurant, String name, BigDecimal price,
                    Boolean veg, String category, String imageUrl) {
        this.id = id;
        this.restaurant = restaurant;
        this.name = name;
        this.price = price;
        this.veg = veg;
        this.category = category;
        this.imageUrl = imageUrl;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
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

    public Boolean getVeg() {
        return veg;
    }

    public void setVeg(Boolean veg) {
        this.veg = veg;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
