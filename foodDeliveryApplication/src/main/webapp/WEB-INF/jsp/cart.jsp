<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZestEats - Cart</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: #f7f7f7;
    }

    .navbar {
        background: white;
        padding: 18px 45px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 2px solid #ff7a00;
        position: sticky;
        top: 0;
        z-index: 900;
    }
    .navbar .logo {
        font-size: 28px;
        font-weight: 700;
        color: #ff7a00;
    }
    .navbar a {
        text-decoration: none;
        margin-left: 25px;
        font-size: 17px;
        font-weight: 500;
        color: #333;
    }
    .navbar a:hover {
        color: #ff7a00;
    }

    .cart-container {
        width: 70%;
        margin: 40px auto;
        background: white;
        padding: 25px;
        border-radius: 16px;
        box-shadow: 0px 4px 20px rgba(0,0,0,0.15);
    }

    .cart-title {
        font-size: 26px;
        font-weight: 700;
        color: #ff7a00;
        text-align: center;
        margin-bottom: 25px;
    }

    .cart-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0;
        border-bottom: 1px solid #ddd;
    }

    .item-name {
        font-size: 18px;
        font-weight: 600;
    }

    .item-price {
        color: #ff7a00;
        font-weight: 600;
        font-size: 16px;
        margin-top: 4px;
    }

    .quantity-controls {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .qty-btn {
        background: #ff7a00;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 6px 12px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 700;
    }

    .qty-btn:disabled {
        background: #bfbfbf;
        cursor: not-allowed;
    }

    .remove-btn {
        background: #e63946;
        color: white;
        padding: 6px 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .total-box {
        text-align: right;
        font-size: 22px;
        margin-top: 20px;
        font-weight: 700;
        color: #333;
    }

    .checkout-btn {
        width: 100%;
        padding: 14px;
        background: #ff7a00;
        color: white;
        font-size: 18px;
        border: none;
        border-radius: 10px;
        margin-top: 25px;
        cursor: pointer;
        font-weight: 600;
    }
    .checkout-btn:hover {
        background: #e56d00;
    }

    .back-btn {
        display: inline-block;
        margin-top: 15px;
        text-decoration: none;
        background: #ff7a00;
        color: white;
        padding: 10px 18px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 500;
    }
    .back-btn:hover {
        background: #e56d00;
    }

</style>
</head>

<body>

<div class="navbar">
    <div class="logo">ZestEats</div>

    <div>
        <a href="${pageContext.request.contextPath}/restaurants">Home</a>
        <a href="${pageContext.request.contextPath}/orders">Orders</a>
        <a href="${pageContext.request.contextPath}/profile">Profile</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<c:if test="${empty cartItems}">
    <h2 style="text-align:center; margin-top:50px;">Your cart is empty</h2>
    <div style="text-align:center;">
        <a class="back-btn" href="${pageContext.request.contextPath}/restaurants">⬅ Back to Restaurants</a>
    </div>
</c:if>

<c:if test="${not empty cartItems}">

    <div class="cart-container">
        <div class="cart-title">Your Cart</div>

        <c:set var="total" value="0" scope="page" />

        <c:forEach var="item" items="${cartItems}">
            <!-- accumulate total: assumes item.price * item.quantity -->
            <c:set var="lineTotal" value="${item.price * item.quantity}" />
            <c:set var="total" value="${total + lineTotal}" scope="page" />

            <div class="cart-item">

                <div>
                    <div class="item-name">${item.name}</div>
                    <div class="item-price">₹ ${item.price}</div>
                </div>

                <div class="quantity-controls">

                    <!-- MINUS -->
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="itemId" value="${item.id}">
                        <input type="hidden" name="quantity" value="${item.quantity - 1}">
                        <input type="hidden" name="restaurantId" value="${restaurantId}">
                        <button type="submit" class="qty-btn"
                                ${item.quantity == 1 ? "disabled" : ""}>
                            -
                        </button>
                    </form>

                    <b>${item.quantity}</b>

                    <!-- PLUS -->
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="itemId" value="${item.id}">
                        <input type="hidden" name="quantity" value="${item.quantity + 1}">
                        <input type="hidden" name="restaurantId" value="${restaurantId}">
                        <button type="submit" class="qty-btn">+</button>
                    </form>

                    <!-- REMOVE -->
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="itemId" value="${item.id}">
                        <input type="hidden" name="restaurantId" value="${restaurantId}">
                        <button type="submit" class="remove-btn">Remove</button>
                    </form>
                </div>
            </div>

        </c:forEach>

        <div class="total-box">Total: ₹ ${total}</div>

        <!-- Proceed to Checkout -->
        <form action="${pageContext.request.contextPath}/checkout" method="get">
            <input type="hidden" name="restaurantId" value="${restaurantId}">
            <button type="submit" class="checkout-btn">Proceed to Checkout</button>
        </form>

        <a class="back-btn"
           href="${pageContext.request.contextPath}/restaurants/${restaurantId}/menu">⬅ Back to Menu</a>

    </div>
</c:if>

</body>
</html>

