<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZestEats - Menu</title>

<style>
    body {
        margin: 0;
        padding: 0;
        background-color: #f4f4f7;
        font-family: 'Poppins', sans-serif;
    }

    /* ======================= WEBSITE TITLE ======================= */
    .site-title {
        text-align: center;
        padding: 25px 0 10px;
        font-size: 42px;
        font-weight: 800;
        color: #ff7a00;
        letter-spacing: 1px;
    }

    /* ======================= NAVBAR ======================= */
    .navbar {
        background-color: #ffffff;
        padding: 18px 45px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #333;
        font-size: 18px;
        position: sticky;
        top: 0;
        z-index: 999;
        border-bottom: 3px solid #ff7a00;
    }

    .navbar .left {
        font-size: 22px;
        font-weight: 600;
        color: #ff7a00;
    }

    .navbar .right a {
        text-decoration: none;
        margin-left: 28px;
        color: #333;
        font-weight: 500;
        transition: 0.3s ease;
    }

    .navbar .right a:hover {
        color: #ff7a00;
    }

    /* ======================= BACK BUTTON ======================= */
    .back-btn {
        margin: 25px 55px;
        display: inline-block;
        padding: 10px 22px;
        background-color: #ff7a00;
        color: #fff;
        border-radius: 8px;
        font-size: 15px;
        text-decoration: none;
        font-weight: 600;
        transition: 0.3s ease;
    }

    .back-btn:hover {
        background: #e56700;
    }

    /* ======================= MENU GRID ======================= */
    .menu-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 25px;
        padding: 25px 50px;
    }

    /* ======================= MENU CARDS ======================= */
    .card {
        background: #ffffff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 6px 14px rgba(0,0,0,0.12);
        transition: 0.3s ease;
    }

    .card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 20px rgba(0,0,0,0.25);
    }

    .card img {
        width: 100%;
        height: 180px;
        object-fit: cover;
    }

    .card-content {
        padding: 15px;
    }

    .card-content h3 {
        margin: 5px 0 8px;
        font-size: 20px;
        font-weight: 600;
        color: #333;
    }

    .price {
        font-weight: bold;
        color: #ff7a00;
        font-size: 16px;
    }

    .veg-badge {
        display: inline-block;
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: bold;
        color: #fff;
        margin-top: 8px;
    }

    .veg { background-color: #4CAF50; }
    .non-veg { background-color: #F44336; }

    /* ======================= ADD TO CART BUTTON ======================= */
    .add-btn {
        margin-top: 10px;
        padding: 10px;
        width: 100%;
        background: #ff7a00;
        color: #fff;
        border-radius: 10px;
        border: none;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s ease;
    }

    .add-btn:hover {
        background: #e56700;
    }

</style>
</head>

<body>

<!-- PAGE TITLE -->
<div class="site-title">ZestEats</div>

<!-- NAVBAR -->
<div class="navbar">
    <div class="left">Menu Items</div>

    <div class="right">
        <a href="${pageContext.request.contextPath}/restaurants">Home</a>
        <a href="${pageContext.request.contextPath}/profile">Profile</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- BACK BUTTON -->
<a class="back-btn" href="${pageContext.request.contextPath}/restaurants">← Back to Restaurants</a>

<c:if test="${empty menuItems}">
    <h2 style="text-align:center; margin-top:50px;">No menu items available</h2>
</c:if>

<!-- MENU GRID -->
<div class="menu-container">
    <c:forEach var="m" items="${menuItems}">

        <div class="card">
            <img src="${m.imageUrl}" alt="${m.name}">

            <div class="card-content">
                <h3>${m.name}</h3>

                <p>Category: ${m.category}</p>

                <p class="price">₹ ${m.price}</p>

                <c:choose>
                    <c:when test="${m.veg}">
                        <span class="veg-badge veg">Veg</span>
                    </c:when>
                    <c:otherwise>
                        <span class="veg-badge non-veg">Non-Veg</span>
                    </c:otherwise>
                </c:choose>

                <!-- ADD TO CART FORM -->
                <form action="${pageContext.request.contextPath}/cart" method="post">
                    <input type="hidden" name="restaurantId" value="${restaurant.id}">
                    <input type="hidden" name="itemId" value="${m.id}">
                    <input type="hidden" name="quantity" value="1">
                    <input type="hidden" name="action" value="add">

                    <button class="add-btn" type="submit">Add to Cart</button>
                </form>

            </div>
        </div>

    </c:forEach>
</div>

</body>
</html>

