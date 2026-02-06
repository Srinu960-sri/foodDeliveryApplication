package com.example.foodDeliveryApplication.model;

import com.example.foodDeliveryApplication.entity.MenuItem;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private final Map<Integer, CartItem> items = new LinkedHashMap<>();

    public void addItem(MenuItem menuItem, int quantity) {
        CartItem existing = items.get(menuItem.getId());
        if (existing == null) {
            items.put(menuItem.getId(), new CartItem(menuItem, quantity));
        } else {
            existing.setQuantity(existing.getQuantity() + quantity);
        }
    }

    public void updateItem(Integer menuItemId, int quantity, MenuItem menuItemIfNew) {
        if (quantity <= 0) {
            items.remove(menuItemId);
            return;
        }
        CartItem existing = items.get(menuItemId);
        if (existing == null && menuItemIfNew != null) {
            items.put(menuItemId, new CartItem(menuItemIfNew, quantity));
        } else if (existing != null) {
            existing.setQuantity(quantity);
        }
    }

    public void removeItem(Integer menuItemId) {
        items.remove(menuItemId);
    }

    public Collection<CartItem> getItems() {
        return items.values();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public BigDecimal calculateTotal() {
        return items.values().stream()
                .map(CartItem::getSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public void clear() {
        items.clear();
    }
}


