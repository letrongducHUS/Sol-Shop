<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form"
    uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core"%>

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
            font-size: 14px;
            margin-top: 5px;
            margin-bottom: 10px;
            text-align: left;
        }

        .success-message {
            color: #166534;
            background-color: #dcfce7;
            border: 1px solid #86efac;
            border-radius: 6px;
            padding: 12px;
            margin: 12px 0;
            text-align: center;
        }

    </style>

</head>


<body>

    <form:form
        action="${pageContext.request.contextPath}/login"
        method="post"
        modelAttribute="user">

        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}" />

        <h2>Đăng nhập</h2>

        <c:if test="${param.logout != null}">
            <div class="success-message">Bạn đã đăng xuất.</div>
        </c:if>

        <c:if test="${param.registered != null}">
            <div class="success-message">Đăng ký thành công. Hãy đăng nhập.</div>
        </c:if>


        <p>
            Tên đăng nhập:
            <br>

            <form:input path="username" />
        </p>


        <p>
            Mật khẩu:
            <br>

            <form:password path="password" />

            <%-- Error hi?n th? ngay du?i � m?t kh?u --%>
            <c:if test="${param.error != null}">
                <div class="error-message">
                    Sai tên đăng nhập, mật khẩu hoặc tài khoản đã bị vô hiệu.
                </div>
            </c:if>

        </p>


        <p>
            <input type="submit" value="Đăng nhập" />
        </p>


        <p>
            Chưa có tài khoản?
            <a href="${pageContext.request.contextPath}/register">
                Đăng ký
            </a>
        </p>

    </form:form>






</body>

</html>
