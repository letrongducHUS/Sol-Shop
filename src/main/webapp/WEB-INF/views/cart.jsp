<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng của bạn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        .btn-delete {
            background-color: red;
            color: white;
        }
        .btn-clear {
            background-color: orange;
            color: white;
            margin-top: 15px;
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
	                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
	                <c:if test="${loggedInUser.role == 'ADMIN'}">
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>	       
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Quản trị</a></li>
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Đơn hàng</a></li>
	                </c:if>
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
	            </ul>
	            <div class="d-flex">
	                <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-outline-light me-2">
	                    Giỏ hàng
	                </a>
	               <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
					    <button type="submit" class="btn btn-danger">Đăng xuất</button>
				   </form>
	            </div>
	        </div>
	    </div>
	</nav>
<h2 style="text-align:center;">Giỏ hàng</h2>

<c:if test="${empty cartItems}">
    <p style="text-align:center;">Giỏ hàng trống.</p>
    
    <div style="text-align:center; margin-top:20px;">
        <a href="${pageContext.request.contextPath}/home">
            <button type="button" class="btn" style="background-color: #4CAF50; color: white;">Quay về trang chủ</button>
        </a>
    </div>
</c:if>

<c:if test="${not empty cartItems}">
    <table>
        <tr>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Ngày thêm</th>
            <th>Hành động</th>
        </tr>

        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td>${item.productName}</td>
                <td>${item.quantity}</td>
                <td>${item.created_at}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/cart/remove" method="post" style="display:inline;">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" name="id" value="${item.id}">
                        <button type="submit" class="btn btn-delete">Xóa</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div style="text-align:center;">
        <form action="${pageContext.request.contextPath}/cart/clear" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" class="btn btn-clear">Xóa toàn bộ</button>
        </form>
    </div>
    
    <div style="text-align:center; margin-top:20px;">
    <form action="${pageContext.request.contextPath}/cart/checkout" method="get">
        <button type="submit" class="btn" style="background-color: blue; color: white;">
            Đặt hàng
        </button>
    </form>
</div>
    
    <div style="text-align:center; margin-top:20px;">
        <a href="${pageContext.request.contextPath}/home">
            <button type="button" class="btn" style="background-color: #4CAF50; color: white;">Quay về trang chủ</button>
        </a>
    </div>
</c:if>

</body>
</html>
