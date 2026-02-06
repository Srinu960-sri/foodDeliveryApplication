<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<meta charset="UTF-8">

<style>
body {
    font-family: 'Poppins';
    background: #f2f2f2;
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

.container {
    width: 50%;
    margin: 50px auto;
    padding: 25px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

input, select {
    width: 100%;
    padding: 12px;
    margin-top: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 12px;
    margin-top: 20px;
    background: #ff7a00;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
}
button:hover {
    background: #e56700;
}

.summary-box {
    margin-top: 25px;
    padding: 18px 22px;
    background: #fff7f0;
    border-left: 6px solid #ff7a00;
    border-radius: 10px;

    font-family: 'Poppins', sans-serif;
    font-size: 18px;
    color: #333;

    box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
    animation: fadeIn 0.4s ease-in-out;
}

.summary-box p {
    margin: 8px 0;
}

.summary-box b {
    color: #ff7a00;
    font-size: 19px;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(8px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>

</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">ZestEats</div>
    <div>
        <a href="${pageContext.request.contextPath}/restaurants">Home</a>
        <a href="${pageContext.request.contextPath}/profile">Profile</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<c:if test="${empty cartItems}">
    <h2 style="text-align:center; margin-top:50px;">Your cart is empty</h2>
    <div style="text-align:center;">
        <a href="${pageContext.request.contextPath}/cart">Go to Cart</a>
    </div>
</c:if>

<c:if test="${not empty cartItems}">

    <!-- compute summary values -->
    <c:set var="total" value="0" scope="page" />
    <c:set var="itemCount" value="${fn:length(cartItems)}" scope="page" />

    <c:forEach var="item" items="${cartItems}">
        <c:set var="lineTotal" value="${item.price * item.quantity}" />
        <c:set var="total" value="${total + lineTotal}" scope="page" />
    </c:forEach>

    <div class="container">
        <h2>Enter Delivery Details</h2>

        <!-- Order Summary -->
        <div class="summary-box">
            <p><b>Total Items:</b> ${itemCount}</p>
            <p><b>Total Amount:</b> ₹ ${total}</p>
        </div>

        <form action="${pageContext.request.contextPath}/checkout" method="post">

            <input type="hidden" name="restaurantId" value="${restaurantId}">

            <label>Delivery Address</label>
            <input type="text" name="address" value="${user.address}" required>

            <label>Payment Method</label>
            <select name="payment_method" required>
                <option value="COD">Cash On Delivery</option>
                <option value="UPI">UPI</option>
                <option value="CARD">Card</option>
            </select>

            <button type="submit">Place Order</button>
        </form>
    </div>
</c:if>

</body>
</html>

