<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    
    <style>
        body { 
            padding: 20px; 
            background-color: #f8f9fa; 
            font-family: Arial, sans-serif;
        }
        .container {
            width: 70%;
            margin: 0 auto;
            text-align: center;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        h2, h3 { margin-bottom: 15px; color: #0d6efd; }
        .table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        .table th {
            background-color: #0d6efd;
            color: white;
        }
        .table tr:hover { background-color: #f1f1f1; }
        a.back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 8px 15px;
            background-color: #198754;
            color: #fff;
            border-radius: 5px;
        }
        a.back-link:hover {
            background-color: #157347;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Chi tiết đơn hàng #${order.id}</h2>
    <p><b>Người đặt:</b> ${order.user.username}</p>
    <p><b>Ngày tạo:</b> ${order.order_date}</p>
    <p><b>Tổng tiền:</b> 
        <fmt:formatNumber value="${order.total_amount}" type="currency" maxFractionDigits="0" currencySymbol="₫"/>
    </p>
    
    <h3>Sản phẩm trong đơn</h3>
    <table class="table">
        <tr>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
        </tr>
        <c:forEach var="item" items="${items}">
            <tr>
                <td>${item.product.name}</td>
                <td>${item.quantity}</td>
            </tr>
        </c:forEach>
    </table>

    <a href="${pageContext.request.contextPath}/orders/list" class="back-link">Quay lại danh sách đơn hàng</a>
</div>
</body>
</html>