package com.example.foodDeliveryApplication.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "restaurant")
public class Restaurant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RESTAURANT_ID")
    private Integer id;

    @Column(name = "NAME", nullable = false)
    private String name;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "CITY")
    private String city;

    @Column(name = "RATING")
    private java.math.BigDecimal rating;

    @Column(name = "IMAGE_URL")
    private String imageUrl;

    @Column(name = "OPENING_TIME")
    private java.time.LocalTime openingTime;

    @Column(name = "CLOSING_TIME")
    private java.time.LocalTime closingTime;

    public Restaurant() {
    }

    public Restaurant(Integer id, String name, String description, String address,
                      String city, java.math.BigDecimal rating, String imageUrl,
                      java.time.LocalTime openingTime, java.time.LocalTime closingTime) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.address = address;
        this.city = city;
        this.rating = rating;
        this.imageUrl = imageUrl;
        this.openingTime = openingTime;
        this.closingTime = closingTime;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public java.math.BigDecimal getRating() {
        return rating;
    }

    public void setRating(java.math.BigDecimal rating) {
        this.rating = rating;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public java.time.LocalTime getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(java.time.LocalTime openingTime) {
        this.openingTime = openingTime;
    }

    public java.time.LocalTime getClosingTime() {
        return closingTime;
    }

    public void setClosingTime(java.time.LocalTime closingTime) {
        this.closingTime = closingTime;
    }
}
