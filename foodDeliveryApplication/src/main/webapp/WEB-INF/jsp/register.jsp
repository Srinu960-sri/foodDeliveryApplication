<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>ZestEats - Register</title>

<style>

    body {
        margin: 0;
        padding: 0;
        background: #f7f7f7;
        font-family: 'Poppins', sans-serif;
    }

    /* ---- CONTAINER ---- */
    .container {
        width: 380px;
        margin: 80px auto;
        background: #ffffff;
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        font-size: 28px;
        font-weight: 700;
        color: #ff7a00;
        margin-bottom: 25px;
    }

    /* ---- INPUT FIELDS ---- */
    input {
        width: 100%;
        padding: 13px;
        margin-bottom: 15px;
        border-radius: 10px;
        border: 1.5px solid #ddd;
        font-size: 15px;
        transition: 0.3s ease;
    }

    input:focus {
        border-color: #ff7a00;
        outline: none;
        box-shadow: 0 0 6px rgba(255,122,0,0.35);
    }

    /* ---- BUTTON ---- */
    button {
        width: 100%;
        padding: 14px;
        background: #ff7a00;
        border: none;
        border-radius: 10px;
        color: #fff;
        font-size: 17px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s ease;
    }

    button:hover {
        background: #e56900;
    }

    /* ---- FOOTER LINK ---- */
    p {
        text-align: center;
        margin-top: 18px;
        font-size: 14px;
    }

    a {
        color: #ff7a00;
        text-decoration: none;
        font-weight: 600;
    }

    a:hover {
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

<div class="container">

<h2>Create Account</h2>

<c:if test="${not empty error}">
    <div class="error-msg">${error}</div>
    </c:if>

<form action="${pageContext.request.contextPath}/register" method="post">
    <input type="text" name="name" placeholder="Full Name" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="text" name="mobile" placeholder="Mobile Number" required>

    <button type="submit">Register</button>
</form>

<p>
    Already have an account? 
    <a href="${pageContext.request.contextPath}/login">Login</a>
</p>

</div>

</body>
</html>

