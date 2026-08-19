<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Thanh toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            max-width: 900px;
            margin: 30px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: #fff;
            font-size: 16px;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        table th {
            background-color: #343a40;
            color: #fff;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Thông tin đặt hàng</h2>

    <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
    
        <label>Họ và tên:</label>
        <input type="text" name="name" required>
        
        <label>Địa chỉ giao hàng:</label>
        <input type="text" name="shipping_address" required>

        <label>Số điện thoại:</label>
        <input type="text" name="phone" required>

        <label>Phương thức thanh toán:</label>
        <select name="payment_method" id="payment_method" required onchange="toggleBankInfo()">
            <option value="COD">Thanh toán khi nhận hàng (COD)</option>
            <option value="BANK">Chuyển khoản ngân hàng</option>
        </select>

        <!-- Thông tin ngân hàng (ẩn mặc định) -->
        <div id="bankInfo" style="display:none; margin-top: 15px;">
            <label>Số tài khoản:</label>
            <input type="text" value="42510001491481" readonly>

            <label>Ngân hàng:</label>
            <input type="text" value="BIDV - Ngân hàng Thương mại cổ phần Đầu tư và Phát triển Việt Nam" readonly>
            
            <label>Nội dung chuyển khoản:</label>
            <input type="text" value="Số điện thoại - Họ và tên" readonly>
        </div>

        <h3>Giỏ hàng của bạn</h3>
        <table>
            <tr>
                <th>Sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Tổng</th>
            </tr>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                    <td><fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                </tr>
            </c:forEach>
        </table>

        <br>
        <button type="submit">Xác nhận đặt hàng</button>
    </form>

    <a href="${pageContext.request.contextPath}/home">
        <button type="button">Quay về trang chủ</button>
    </a>
</div>

<!-- Script xử lý hiển thị -->
<script>
    function toggleBankInfo() {
        var paymentMethod = document.getElementById("payment_method").value;
        var bankInfo = document.getElementById("bankInfo");
        if (paymentMethod === "BANK") {
            bankInfo.style.display = "block";
        } else {
            bankInfo.style.display = "none";
        }
    }
</script>

</body>
</html>