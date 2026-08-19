<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Đăng nhập</title>
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
        input[type="password"] {
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
    	<form:form method="post" modelAttribute="user">
    		<h2>Đăng nhập</h2>
	        <p>Tên đăng nhập: <form:input path="username" /></p>
	        <p>Mật khẩu: <form:password path="password" /></p>
	        <p><input type="submit" value="Đăng nhập" /></p>
	        <p>Chưa có tài khoản? 
	            <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
	        </p>
    	</form:form>

    <c:if test="${not empty error}">
        <script>
	        alert("${error}");
	    </script>
    </c:if>
</body>
</html>