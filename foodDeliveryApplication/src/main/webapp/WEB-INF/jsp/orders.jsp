<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ZestEats - Order Success</title>
<style>
body {
    font-family: Poppins, sans-serif;
    background: #f7f7f7;
}

.navbar {
    background: white;
    padding: 18px 45px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 2px solid #ff7a00;
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

.box {
    width: 450px;
    margin: 100px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    text-align: center;
    box-shadow:0 4px 15px rgba(0,0,0,0.15);
}
.btn {
    padding: 12px 20px;
    background:#ff7a00;
    color:white;
    font-weight:600;
    border-radius:8px;
    text-decoration:none;
}
.btn:hover { background:#e56d00; }
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

<c:if test="${empty lastOrderId}">
    <h2 style="text-align:center; margin-top:60px; color:#ff7a00;">
        No recent orders found!
    </h2>
    <div style="text-align:center;">
        <a href="${pageContext.request.contextPath}/restaurants" style="color:#ff7a00; font-weight:bold;">Back to Restaurants</a>
    </div>
</c:if>

<c:if test="${not empty lastOrderId}">
    <div class="box">
        <h2 style="color:#ff7a00;">Order Placed Successfully! 🎉</h2>

        <p>Your Order ID: <b>${lastOrderId}</b></p>

        <br>
        <a class="btn" href="${pageContext.request.contextPath}/restaurants">Continue Ordering</a>
    </div>
</c:if>

</body>
</html>

