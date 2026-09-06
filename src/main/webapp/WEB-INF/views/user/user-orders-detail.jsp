<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Chi tiết đơn hàng #${order.id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table { width: 80%; border-collapse: collapse; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f0f0f0; }
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
	                <c:if test="${loggedInUser.role == 'ADMIN'}">
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>	       
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Quản trị</a></li>
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Đơn hàng</a></li>
	                </c:if>
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
	            </ul>
	            <div class="d-flex">
	                <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-outline-light me-2" style="margin: auto; margin-top: 1px">
	                    Giỏ hàng
	                </a>
	               <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
					    <button type="submit" class="btn btn-danger">Đăng xuất</button>
				   </form>
	            </div>
	        </div>
	    </div>
	</nav>
<h2 style="text-align:center;">Chi tiết đơn hàng #${order.id}</h2>

<p>Ngày đặt: <fmt:formatDate value="${order.order_date}" pattern="dd/MM/yyyy HH:mm"/></p>
<p>Trạng thái: ${order.status}</p>
<p>Tổng tiền: 
    <fmt:formatNumber value="${order.total_amount}" type="currency" maxFractionDigits="0" currencySymbol="₫"/>
</p>


<h3>Sản phẩm trong đơn hàng</h3>
<c:if test="${empty items}">
    <p>Không có sản phẩm nào.</p>
</c:if>

<c:if test="${not empty items}">
    <table>
        <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>            
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
            <tr>
                <td>${item.product.name}</td>
                <td>${item.quantity}</td>                           
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<p style="text-align:center;"><a href="${pageContext.request.contextPath}/userOrders/list">Quay lại danh sách đơn hàng</a></p>

</body>
</html>
