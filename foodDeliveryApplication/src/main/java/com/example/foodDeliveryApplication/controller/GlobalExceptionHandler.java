package com.example.foodDeliveryApplication.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.ui.Model;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        e.printStackTrace(); // Print to console for debugging
        model.addAttribute("exception", e);
        model.addAttribute("message", e.getMessage());
        return "error";
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public String handleIllegalArgument(IllegalArgumentException e, Model model) {
        e.printStackTrace();
        model.addAttribute("exception", e);
        model.addAttribute("message", e.getMessage());
        return "error";
    }
}
