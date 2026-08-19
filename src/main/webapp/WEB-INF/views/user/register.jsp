<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Đăng ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ABE2, #5563DE);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 320px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        h2 {
        	text-align: center;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"], 
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #5563DE;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #4351c5;
        }

        .register-link {
            margin-top: 15px;
            display: block;
            color: #5563DE;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <h2>Đăng ký tài khoản</h2>
        <label>Tên đăng nhập:</label><br/>
        <input type="text" name="username" required/><br/><br/>

        <label>Mật khẩu:</label><br/>
        <input type="password" name="password" required/><br/><br/>

        <label>Email:</label><br/>
        <input type="email" name="email" required/><br/><br/>

        <input type="submit" value="Đăng ký"/><br/><br/>

        <c:if test="${not empty error}">
            <div style="color:red;">${error}</div>
        </c:if>

        <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a></p>
    </form>
</body>
</html>