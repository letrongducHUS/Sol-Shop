<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
<div class="container mt-4">
<h2 class="mb-4">Danh sách sản phẩm</h2>

<c:if test="${loggedInUser.role == 'ADMIN'}">
	<a class="btn btn-primary mb-3" href="${pageContext.request.contextPath}/products/form">Thêm sản phẩm</a>
</c:if>

<div class="row row-cols-1 row-cols-md-3 g-4">
    <c:forEach var="p" items="${products}">
        <div class="col">
            <div class="card h-100">
                <img src="${pageContext.request.contextPath}/uploads/${p.image}" alt="Ảnh sản phẩm">
                <div class="card-body">
                    <h5 class="card-title">${p.name}</h5>
                    <p class="card-text text-danger fw-bold">
					    <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true" maxFractionDigits="0" />₫
					</p>
					<form action="${pageContext.request.contextPath}/cart/add" method="post" class="mb-2">
                        <input type="hidden" name="productId" value="${p.id}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="btn btn-success btn-sm">🛒 Thêm vào giỏ</button>
                    </form>
                    <p class="card-text"><small class="text-muted">Danh mục: ${p.category}</small></p>
                    <c:if test="${loggedInUser.role == 'ADMIN'}">                 
                    <a href="${pageContext.request.contextPath}/products/form?id=${p.id}" class="btn btn-outline-primary btn-sm">Sửa</a>
	                    <a href="${pageContext.request.contextPath}/products/delete?id=${p.id}"
			               onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');" class="btn btn-outline-primary btn-sm">
			               Xóa
			            </a>
		            </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</div>
</body>
</html>