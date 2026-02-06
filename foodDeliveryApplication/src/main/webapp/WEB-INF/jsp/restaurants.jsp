<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ZestEats - Restaurants</title>

    <style>

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
        }

        /* ======== TITLE ======== */
        .site-title {
            text-align: center;
            padding: 30px 0 15px;
            font-size: 45px;
            font-weight: 800;
            color: #ff7a00;
        }

        /* ======== NAVBAR ======== */
        .navbar {
            background-color: #ffffff;
            padding: 18px 45px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 3px solid #ff7a00;
            position: sticky;
            top: 0;
            z-index: 999;
        }

        .navbar .left {
            color: #ff7a00;
            font-size: 24px;
            font-weight: 700;
        }

        .navbar .right a {
            text-decoration: none;
            color: #333;
            font-size: 17px;
            margin-left: 30px;
            font-weight: 600;
            transition: 0.3s;
        }

        .navbar .right a:hover {
            color: #ff7a00;
        }

        /* ======== HELLO USER ======== */
        .hello-user-container {
            width: 220%;
            margin-top: 10px;
            margin-left: 33px;
        }

        .hello-user {
            font-size: 18px;
            font-weight: 700;
            color: #ff7a00;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 8px;
            transition: 0.3s ease;
        }

        .hello-user:hover {
            background: rgba(255,122,0,0.12);
            color: #e56700;
        }

        /* ======== RESTAURANT GRID ======== */
        .restaurant-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(290px, 1fr));
            gap: 28px;
            padding: 40px 50px;
        }

        /* ======== CARD ======== */
        .card {
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 14px rgba(0,0,0,0.1);
            transition: 0.3s ease;
        }

        .card:hover {
            transform: translateY(-6px);
        }

        .card img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }

        .card-content {
            padding: 18px;
        }

        .card-content h3 {
            margin: 0;
            font-size: 21px;
            font-weight: 600;
        }

        .rating {
            background: #ff7a00;
            display: inline-block;
            padding: 4px 10px;
            border-radius: 8px;
            color: white;
            margin-top: 6px;
            font-weight: bold;
            font-size: 14px;
        }

        .view-menu-btn {
            margin: 15px 18px 18px;
            padding: 12px;
            background: #ff7a00;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 10px;
            text-align: center;
            text-decoration: none;
            display: block;
            transition: 0.3s ease;
        }

        .view-menu-btn:hover {
            background: #e56700;
        }

        /* ======== FOOTER ======== */
        .footer {
            background: #ff7a00;
            text-align: center;
            padding: 22px;
            color: white;
            font-size: 17px;
            font-weight: 600;
            margin-top: 50px;
        }

    </style>
</head>

<body>

    <!-- WEBSITE NAME -->
    <div class="site-title">ZestEats</div>

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="left">Explore Restaurants</div>

        <div class="right">
            <a href="${pageContext.request.contextPath}/restaurants">Home</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </div>


    <!-- HELLO USER POSITIONED UNDER NAVBAR -->
    <c:if test="${not empty user}">
        <div class="hello-user-container">
            <a class="hello-user" href="${pageContext.request.contextPath}/profile">Hello, ${user.fullName}</a>
        </div>
    </c:if>


    <!-- RESTAURANT CARDS -->
    <div class="restaurant-container">

        <c:forEach var="r" items="${restaurants}">

            <div class="card">

                <img src="${r.imageUrl}" alt="${r.name}">

                <div class="card-content">
                    <h3>${r.name}</h3>
                    <p>${r.description}</p>
                    <p><strong>City:</strong> ${r.city}</p>
                    <c:if test="${not empty r.rating}">
                        <div class="rating">${r.rating} ⭐</div>
                    </c:if>
                </div>

                <a class="view-menu-btn"
                   href="${pageContext.request.contextPath}/restaurants/${r.id}/menu">View Menu</a>
            </div>

        </c:forEach>

    </div>

    <!-- FOOTER -->
    <div class="footer">
        © 2025 ZestEats — Crafted with ❤ by Srinu
    </div>

</body>
</html>

