<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ZestEats - Login</title>

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: #f6f6f6;
    }

    /* ---------------- NAVBAR ---------------- */
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

    /* ---------------- LOGIN CARD ---------------- */
    .login-container {
        width: 380px;
        margin: 80px auto;
        background: #ffffff;
        padding: 35px;
        border-radius: 16px;
        box-shadow: 0px 4px 20px rgba(0,0,0,0.15);
    }

    .login-container h2 {
        text-align: center;
        font-size: 26px;
        margin-bottom: 25px;
        color: #ff7a00;
        font-weight: 700;
    }

    .input-box {
        width: 100%;
        padding: 14px;
        font-size: 15px;
        border-radius: 10px;
        background: #f1f1f1;
        border: none;
        margin-bottom: 18px;
        transition: 0.3s ease;
    }

    .input-box:focus {
        background: white;
        border: 2px solid #ff7a00;
        outline: none;
        box-shadow: 0px 0px 6px rgba(255,122,0,0.4);
    }

    .login-btn {
        width: 100%;
        padding: 14px;
        border: none;
        background: #ff7a00;
        color: white;
        font-size: 18px;
        border-radius: 10px;
        cursor: pointer;
        font-weight: 600;
        transition: 0.3s ease;
    }

    .login-btn:hover {
        background: #e56d00;
        box-shadow: 0px 4px 12px rgba(255,122,0,0.4);
    }

    .register-link {
        text-align: center;
        margin-top: 18px;
        font-size: 15px;
    }

    .register-link a {
        color: #ff7a00;
        text-decoration: none;
        font-weight: 600;
    }

    .register-link a:hover {
        text-decoration: underline;
    }

    .error-msg {
        color: red;
        text-align: center;
        margin-bottom: 10px;
        font-size: 14px;
    }
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">ZestEats</div>

    <div>
        <a href="${pageContext.request.contextPath}/restaurants">Home</a>
        <a href="${pageContext.request.contextPath}/orders">Orders</a>
        <a href="${pageContext.request.contextPath}/login">Login</a>
        <a href="${pageContext.request.contextPath}/register">Register</a>
    </div>
</div>

<!-- LOGIN BOX -->
<div class="login-container">

    <h2>Login</h2>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <input type="email" name="email" class="input-box" placeholder="Enter Email" required>
        <input type="password" name="password" class="input-box" placeholder="Enter Password" required>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <p class="register-link">
        New user? <a href="${pageContext.request.contextPath}/register">Create an account</a>
    </p>

</div>

</body>
</html>

