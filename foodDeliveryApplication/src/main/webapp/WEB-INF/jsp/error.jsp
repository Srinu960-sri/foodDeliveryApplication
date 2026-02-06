<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
        }
        h1 {
            color: #d32f2f;
            margin-top: 0;
        }
        p {
            color: #666;
            line-height: 1.6;
        }
        .error-message {
            background: #ffebee;
            border: 1px solid #ef5350;
            border-radius: 4px;
            padding: 15px;
            margin: 20px 0;
            text-align: left;
            color: #c62828;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 30px;
            background: #ff7a00;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }
        a:hover {
            background: #e67e00;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Oops! Something went wrong</h1>
        <p>An error occurred while processing your request.</p>
        <c:if test="${exception != null}">
            <div class="error-message">
                <strong>Error:</strong> ${exception.message}
            </div>
        </c:if>
        <a href="/restaurants">Back to Restaurants</a>
    </div>
</body>
</html>
