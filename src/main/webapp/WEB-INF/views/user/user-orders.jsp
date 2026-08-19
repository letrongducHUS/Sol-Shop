<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Đơn hàng của tôi</title>
    <style>
        table { width: 80%; border-collapse: collapse; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f0f0f0; }
        a { text-decoration: none; color: blue; }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
	                <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-outline-light me-2" style="margin: auto; margin-top: 1px">
	                    Giỏ hàng
	                </a>
	               <form action="${pageContext.request.contextPath}/login/logout" method="post" style="display:inline;">
					    <button type="submit" class="btn btn-danger">Đăng xuất</button>
				   </form>
	            </div>
	        </div>
	    </div>
	</nav>
<h2 style="text-align:center;">Đơn hàng của tôi</h2>

<c:if test="${empty orders}">
    <p style="text-align:center;">Bạn chưa có đơn hàng nào.</p>
    <div style="text-align:center; margin-top: 20px;">
	    <a href="${pageContext.request.contextPath}/home">
	        <button type="button" class="btn" style="background-color: #4CAF50; color: white; padding: 10px 20px; font-size:16px;">
	            Quay về trang chủ
	        </button>
	    </a>
	</div>
</c:if>

<c:if test="${not empty orders}">
    <table>
        <thead>
        <tr>
            <th>Mã đơn hàng</th>
            <th>Ngày đặt</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Chi tiết</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.id}</td>
                <td><fmt:formatDate value="${order.order_date}" pattern="dd/MM/yyyy HH:mm"/></td>
                <td><fmt:formatNumber value="${order.total_amount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>            
                <td>${order.status}</td>
                <td>
                	<a href="${pageContext.request.contextPath}/userOrders/detail?id=${order.id}">Xem</a>
                	<c:if test="${order.status eq 'Đang xử lý'}">
				        <form action="${pageContext.request.contextPath}/userOrders/delete" method="post" style="display:inline;">
				            <input type="hidden" name="id" value="${order.id}">
				            <button type="submit" onclick="return confirm('Bạn có chắc muốn hủy đơn này?')">Hủy</button>
				        </form>
				    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    <div style="text-align:center; margin-top: 20px;">
	    <a href="${pageContext.request.contextPath}/home">
	        <button type="button" class="btn" style="background-color: #4CAF50; color: white; padding: 10px 20px; font-size:16px;">
	            Quay về trang chủ
	        </button>
	    </a>
	</div>
</c:if>

</body>
</html>