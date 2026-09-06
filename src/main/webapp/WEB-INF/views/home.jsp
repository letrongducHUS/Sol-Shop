<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Trang chá»§</title>
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
	                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/home">Trang chá»§</a></li>
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/userOrders/list">ÄÆ¡n hÃ ng cá»§a tÃ´i</a></li>
	                <c:if test="${loggedInUser.role == 'ADMIN'}">
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sáº£n pháº©m</a></li>	       
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Quáº£n trá»‹</a></li>
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/orders/list">ÄÆ¡n hÃ ng</a></li>	                
	                </c:if>
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">LiÃªn há»‡</a></li>
	            </ul>
	            <div class="d-flex">
	                <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-outline-light me-2">
	                    Giá» hÃ ng
	                </a>
	               <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
					    <button type="submit" class="btn btn-danger">ÄÄƒng xuáº¥t</button>
				   </form>
	            </div>
	        </div>
	    </div>
	</nav>
	
	<div class="container mt-4">
    <div class="row">
        <!-- Sidebar trÃ¡i -->
        <div class="col-md-3">
            <div class="list-group">
            	<form action="${pageContext.request.contextPath}/products/search" method="get" class="d-flex">
				    <input class="form-control me-2" type="search" name="keyword" placeholder="TÃ¬m kiáº¿m sáº£n pháº©m" value="${keyword}">
				    <button class="btn btn-outline-success" type="submit">TÃ¬m kiáº¿m</button>
				</form>
            	<b>Danh má»¥c</b>
                <a href="${pageContext.request.contextPath}/products?category=fashion" class="list-group-item list-group-item-action">Thá»i Trang</a>
                <a href="${pageContext.request.contextPath}/products?category=phones_and_accessories" class="list-group-item list-group-item-action">Äiá»‡n Thoáº¡i & Phá»¥ Kiá»‡n</a>
                <a href="${pageContext.request.contextPath}/products?category=tools_and_gadgets" class="list-group-item list-group-item-action">Dá»¥ng cá»¥ vÃ  thiáº¿t bá»‹ tiá»‡n Ã­ch</a>
                <a href="${pageContext.request.contextPath}/products?category=electronic_equipment" class="list-group-item list-group-item-action">Thiáº¿t Bá»‹ Äiá»‡n Tá»­</a>
                <a href="${pageContext.request.contextPath}/products?category=health" class="list-group-item list-group-item-action">Sá»©c Khá»e</a>
                <a href="${pageContext.request.contextPath}/products?category=computers_and_laptops" class="list-group-item list-group-item-action">MÃ¡y TÃ­nh & Laptop</a>
                <a href="${pageContext.request.contextPath}/products?category=cameras_and_camcorders" class="list-group-item list-group-item-action">MÃ¡y áº£nh & MÃ¡y quay phim</a>
                <a href="${pageContext.request.contextPath}/products?category=watch" class="list-group-item list-group-item-action">Äá»“ng Há»“</a>
                <a href="${pageContext.request.contextPath}/products?category=shoes" class="list-group-item list-group-item-action">GiÃ y DÃ©p</a>
                <a href="${pageContext.request.contextPath}/products?category=household_electrical_appliances" class="list-group-item list-group-item-action">Thiáº¿t Bá»‹ Äiá»‡n Gia Dá»¥ng</a>
                <a href="${pageContext.request.contextPath}/products?category=sports_and_travel" class="list-group-item list-group-item-action">Thá»ƒ Thao & Du Lá»‹ch</a>
                <a href="${pageContext.request.contextPath}/products?category=cars_and_motorbikes_and_bicycles" class="list-group-item list-group-item-action">Ã” TÃ´ & Xe MÃ¡y & Xe Äáº¡p</a>
                <a href="${pageContext.request.contextPath}/products?category=backpacks_and_purses" class="list-group-item list-group-item-action">Balo & TÃºi VÃ­</a>
                <a href="${pageContext.request.contextPath}/products?category=toys" class="list-group-item list-group-item-action">Äá»“ ChÆ¡i</a>
                <a href="${pageContext.request.contextPath}/products?category=pet_care" class="list-group-item list-group-item-action">ChÄƒm SÃ³c ThÃº CÆ°ng</a>
                <a href="${pageContext.request.contextPath}/products?category=mother_and_baby" class="list-group-item list-group-item-action">Máº¹ & BÃ©</a>
                <a href="${pageContext.request.contextPath}/products?category=home_and_life" class="list-group-item list-group-item-action">NhÃ  Cá»­a & Äá»i Sá»‘ng</a>
                <a href="${pageContext.request.contextPath}/products?category=beauty" class="list-group-item list-group-item-action">Sáº¯c Äáº¹p</a>
                <a href="${pageContext.request.contextPath}/products?category=accessories_and_jewelry" class="list-group-item list-group-item-action">Phá»¥ Kiá»‡n & Trang Sá»©c</a>
                <a href="${pageContext.request.contextPath}/products?category=online_department_store" class="list-group-item list-group-item-action">BÃ¡ch HÃ³a Online</a>
                <a href="${pageContext.request.contextPath}/products?category=online_bookstore" class="list-group-item list-group-item-action">NhÃ  SÃ¡ch Online</a>
                <a href="${pageContext.request.contextPath}/products?category=laundry_and_housekeeping" class="list-group-item list-group-item-action">Giáº·t GiÅ© & ChÄƒm SÃ³c NhÃ  Cá»­a</a>
            </div>
        </div>

        <!-- Ná»™i dung pháº£i -->
        <div class="col-md-9">
            <!-- Banner -->
            <div class="p-5 mb-4 bg-light rounded-3">
                <div class="container-fluid py-5">
                    <h1 class="display-5 fw-bold">ChÃ o má»«ng Ä‘áº¿n vá»›i SolShop</h1>
                    <p class="col-md-8 fs-4">Mua sáº¯m thÃ´ng minh - Sáº£n pháº©m cháº¥t lÆ°á»£ng, giao hÃ ng nhanh</p>
                </div>
            </div>
        </div>
    </div>
</div>
	
</body>
</html>
