<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>ZestEats - Profile</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: #f5f5f5;
    }

    /* Center wrapper */
    .profile-container {
        width: 420px;
        margin: 70px auto;
        background: #ffffff;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 6px 22px rgba(0,0,0,0.18);
        text-align: center;
    }

    /* Avatar */
    .avatar {
        width: 110px;
        height: 110px;
        background: #ffe6cc;
        border-radius: 50%;
        margin: auto;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 45px;
        font-weight: 700;
        color: #ff7a00;
        box-shadow: 0 3px 10px rgba(0,0,0,0.15);
    }

    /* Name + heading */
    h2 {
        font-size: 26px;
        font-weight: 700;
        margin-top: 20px;
        color: #ff7a00;
    }

    /* Details box */
    .details {
        margin-top: 20px;
        text-align: left;
        padding-left: 25px;
    }

    .details p {
        font-size: 17px;
        margin: 10px 0;
        font-weight: 500;
        color: #333;
    }

    /* Logout button */
    .logout-btn {
        display: inline-block;
        margin-top: 28px;
        background: #ff7a00;
        padding: 12px 22px;
        border-radius: 10px;
        color: white;
        text-decoration: none;
        font-size: 17px;
        font-weight: 600;
        transition: 0.3s ease;
    }

    .logout-btn:hover {
        background: #e56900;
    }

    .login-msg {
        width: 420px;
        margin: 70px auto;
        background: #ffffff;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 6px 22px rgba(0,0,0,0.18);
        text-align: center;
        color: #333;
        font-family: 'Poppins', sans-serif;
    }

    .login-msg a {
        color: #ff7a00;
        font-weight: 700;
        text-decoration: none;
    }
    .login-msg a:hover {
        text-decoration: underline;
    }
</style>

</head>

<body>

<c:if test="${empty user}">
    <div class="login-msg">
        <h2>Login Required</h2>
        <p>Please <a href="${pageContext.request.contextPath}/login">login</a> to view your profile.</p>
    </div>
</c:if>

<c:if test="${not empty user}">
    <div class="profile-container">

        <!-- Avatar: First letter of name -->
        <div class="avatar">
            ${fn:toUpperCase(fn:substring(user.fullName, 0, 1))}
        </div>

        <h2>Your Profile</h2>

        <div class="details">
            <p><b>Name:</b> ${user.fullName}</p>
            <p><b>Email:</b> ${user.email}</p>
            <p><b>Mobile:</b> ${user.mobile}</p>
        </div>

        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>

    </div>
</c:if>

</body>
</html>

