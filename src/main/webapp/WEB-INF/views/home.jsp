<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>		
		b {
			font-size: 30px;
		}   	
    </style>
</head>
<body>
	<!-- Navbar -->
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
    <div class="row">
        <!-- Sidebar trái -->
        <div class="col-md-3">
            <div class="list-group">
            	<form action="${pageContext.request.contextPath}/products/search" method="get" class="d-flex">
				    <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm kiếm sản phẩm" value="${keyword}">
				    <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
				</form>
            	<b>Danh mục</b>
                <a href="${pageContext.request.contextPath}/products?category=fashion" class="list-group-item list-group-item-action">Thời Trang</a>
                <a href="${pageContext.request.contextPath}/products?category=phones_and_accessories" class="list-group-item list-group-item-action">Điện Thoại & Phụ Kiện</a>
                <a href="${pageContext.request.contextPath}/products?category=tools_and_gadgets" class="list-group-item list-group-item-action">Dụng cụ và thiết bị tiện ích</a>
                <a href="${pageContext.request.contextPath}/products?category=electronic_equipment" class="list-group-item list-group-item-action">Thiết Bị Điện Tử</a>
                <a href="${pageContext.request.contextPath}/products?category=health" class="list-group-item list-group-item-action">Sức Khỏe</a>
                <a href="${pageContext.request.contextPath}/products?category=computers_and_laptops" class="list-group-item list-group-item-action">Máy Tính & Laptop</a>
                <a href="${pageContext.request.contextPath}/products?category=cameras_and_camcorders" class="list-group-item list-group-item-action">Máy ảnh & Máy quay phim</a>
                <a href="${pageContext.request.contextPath}/products?category=watch" class="list-group-item list-group-item-action">Đồng Hồ</a>
                <a href="${pageContext.request.contextPath}/products?category=shoes" class="list-group-item list-group-item-action">Giày Dép</a>
                <a href="${pageContext.request.contextPath}/products?category=household_electrical_appliances" class="list-group-item list-group-item-action">Thiết Bị Điện Gia Dụng</a>
                <a href="${pageContext.request.contextPath}/products?category=sports_and_travel" class="list-group-item list-group-item-action">Thể Thao & Du Lịch</a>
                <a href="${pageContext.request.contextPath}/products?category=cars_and_motorbikes_and_bicycles" class="list-group-item list-group-item-action">Ô Tô & Xe Máy & Xe Đạp</a>
                <a href="${pageContext.request.contextPath}/products?category=backpacks_and_purses" class="list-group-item list-group-item-action">Balo & Túi Ví</a>
                <a href="${pageContext.request.contextPath}/products?category=toys" class="list-group-item list-group-item-action">Đồ Chơi</a>
                <a href="${pageContext.request.contextPath}/products?category=pet_care" class="list-group-item list-group-item-action">Chăm Sóc Thú Cưng</a>
                <a href="${pageContext.request.contextPath}/products?category=mother_and_baby" class="list-group-item list-group-item-action">Mẹ & Bé</a>
                <a href="${pageContext.request.contextPath}/products?category=home_and_life" class="list-group-item list-group-item-action">Nhà Cửa & Đời Sống</a>
                <a href="${pageContext.request.contextPath}/products?category=beauty" class="list-group-item list-group-item-action">Sắc Đẹp</a>
                <a href="${pageContext.request.contextPath}/products?category=accessories_and_jewelry" class="list-group-item list-group-item-action">Phụ Kiện & Trang Sức</a>
                <a href="${pageContext.request.contextPath}/products?category=online_department_store" class="list-group-item list-group-item-action">Bách Hóa Online</a>
                <a href="${pageContext.request.contextPath}/products?category=online_bookstore" class="list-group-item list-group-item-action">Nhà Sách Online</a>
                <a href="${pageContext.request.contextPath}/products?category=laundry_and_housekeeping" class="list-group-item list-group-item-action">Giặt Giũ & Chăm Sóc Nhà Cửa</a>
            </div>
        </div>

        <!-- Nội dung phải -->
        <div class="col-md-9">
            <!-- Banner -->
            <div class="p-5 mb-4 bg-light rounded-3">
                <div class="container-fluid py-5">
                    <h1 class="display-5 fw-bold">Chào mừng đến với SolShop</h1>
                    <p class="col-md-8 fs-4">Mua sắm thông minh - Sản phẩm chất lượng, giao hàng nhanh</p>
                </div>
            </div>
        </div>
    </div>
</div>
	
</body>
</html>