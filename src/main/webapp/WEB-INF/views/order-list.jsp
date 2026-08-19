<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding: 20px; background-color: #f8f9fa; }
        h2 { margin-bottom: 20px; }
        .table thead { background-color: #0d6efd; color: white; }
        .table tbody tr:hover { background-color: #e9ecef; }
        .btn-detail { text-decoration: none; color: #fff; background-color: #198754; padding: 5px 10px; border-radius: 5px; }
        .btn-detail:hover { background-color: #157347; }
        .btn-update { background-color: #ffc107; color: #000; padding: 5px 10px; border-radius: 5px; border: none; }
        .btn-update:hover { background-color: #e0a800; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	    <div class="container">
	        <a class="navbar-brand" href="#">SolShop</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
	                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
	                aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarNav">
	            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/userOrders/list">Đơn hàng của tôi</a></li>
	                <c:if test="${loggedInUser.role == 'ADMIN'}">
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>	       
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Quản trị</a></li>
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/orders/list">Đơn hàng</a></li>
	                </c:if>
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
	            </ul>
	            <div class="d-flex">
	                <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-outline-light me-2">
	                    Giỏ hàng
	                </a>
	               <form action="${pageContext.request.contextPath}/login/logout" method="post" style="display:inline;">
					    <button type="submit" class="btn btn-danger">Đăng xuất</button>
				   </form>
	            </div>
	        </div>
	    </div>
	</nav>
<div class="container">
    <h2>Danh sách đơn hàng</h2>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Người đặt</th>
                <th>Ngày tạo</th>
                <th>Tổng tiền</th>            
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="o" items="${orders}">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.name}</td>
                    <td><fmt:formatDate value="${o.order_date}" pattern="dd/MM/yyyy HH:mm"/></td>
                    <td><fmt:formatNumber value="${o.total_amount}" type="currency" maxFractionDigits="0" currencySymbol="₫"/></td>
                    <td><a class="btn-detail" href="${pageContext.request.contextPath}/orders/detail?id=${o.id}">Xem chi tiết</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>