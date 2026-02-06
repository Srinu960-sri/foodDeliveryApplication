<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>My Orders - ZestEats</title>
<meta charset="UTF-8">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: #f7f7f7;
    margin: 0;
    padding: 0;
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
.navbar a:hover { color: #ff7a00; }

/* ORDER CARD */
.order-card {
    width: 70%;
    margin: 25px auto;
    padding: 22px;
    background: white;
    border-radius: 14px;
    box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
    border-left: 6px solid #ff7a00;
    animation: fadeIn 0.4s ease-in-out;
}

.order-card h2 {
    margin: 0 0 5px 0;
    font-size: 22px;
    color: #ff7a00;
}

.order-details p {
    margin: 6px 0;
    font-size: 15px;
    color: #444;
}

.items-box {
    background: #fff4e6;
    padding: 12px;
    border-radius: 10px;
    margin-top: 12px;
}

.items-box p {
    margin: 4px 0;
}

.amount {
    font-size: 20px;
    font-weight: bold;
    color: #ff7a00;
    margin-top: 10px;
}

/* FADE ANIMATION */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

.no-orders {
    text-align: center;
    margin-top: 70px;
    font-size: 22px;
    color: #777;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">ZestEats</div>
    <div>
        <a href="${pageContext.request.contextPath}/restaurants">Home</a>
        <a href="${pageContext.request.contextPath}/myorders">My Orders</a>
        <a href="${pageContext.request.contextPath}/profile">Profile</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<h1 style="text-align:center; margin-top:25px; color:#ff7a00;">
    My Orders
</h1>

<c:if test="${empty orders}">
    <p class="no-orders">You have no orders yet.</p>
</c:if>

<c:forEach var="order" items="${orders}">

    <div class="order-card">

        <h2>🍽️ ${order.restaurant.name}</h2>

        <div class="order-details">
            <p><b>Order ID:</b> ${order.id}</p>
            <p><b>Date:</b> ${order.orderDate}</p>
            <p><b>Status:</b> ${order.status}</p>
            <p><b>Delivery Address:</b> ${order.address}</p>
            <p><b>Payment Method:</b> ${order.paymentMethod}</p>
        </div>

        <div class="items-box">
            <b>Items Ordered:</b><br>
            <c:forEach var="it" items="${order.items}">
                <p>• ${it.menuItem.name} × ${it.quantity} — ₹ ${it.price}</p>
            </c:forEach>
        </div>

        <p class="amount">Total Paid: ₹ ${order.totalAmount}</p>

    </div>

</c:forEach>

</body>
</html>

