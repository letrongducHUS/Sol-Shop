<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sáº£n pháº©m theo danh má»¥c</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    	.card-img-top {
		    height: 120%;           
		    object-fit: cover;       
		    width: 80%;
		}   	
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
<h2 class="mb-4">Sáº£n pháº©m thuá»™c danh má»¥c</h2>

<div class="row row-cols-1 row-cols-md-3 g-4">
    <c:forEach var="p" items="${products}">
        <div class="col">
            <div class="card h-100">
                <img src="${pageContext.request.contextPath}/uploads/${p.image}" alt="áº¢nh sáº£n pháº©m">
                <div class="card-body">
                    <h5 class="card-title">${p.name}</h5>
                    <p class="card-text text-danger fw-bold">
                        <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true" maxFractionDigits="0" />â‚«
                    </p>
                    
                    <form action="${pageContext.request.contextPath}/cart/add" method="post" class="mb-2">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" name="productId" value="${p.id}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="btn btn-success btn-sm">ðŸ›’ ThÃªm vÃ o giá»</button>
                    </form>
                    <c:if test="${loggedInUser.role == 'ADMIN'}">
	                    <a href="${pageContext.request.contextPath}/products/form?id=${p.id}" 
	                       class="btn btn-outline-primary btn-sm">Sá»­a</a>
	                    <form action="${pageContext.request.contextPath}/products/deleteByCategory" method="post" style="display:inline;" onsubmit="return confirm('Xóa sản phẩm này?');">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" name="id" value="${p.id}" />
                        <input type="hidden" name="category" value="${p.category}" />
                        <button type="submit" class="btn btn-outline-primary btn-sm">Xóa</button>
                    </form>
	                </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</div>
</body>
</html>
