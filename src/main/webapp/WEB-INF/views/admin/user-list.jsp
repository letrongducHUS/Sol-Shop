<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table { width: 80%; margin: auto; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        th { background-color: #f2f2f2; }
        .btn { padding: 5px 10px; border: none; cursor: pointer; }
        .btn-edit { background-color: blue; color: white; }
        .btn-delete { background-color: red; color: white; }
        .btn-add { background-color: green; color: white; margin-bottom: 15px; display: inline-block; }
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

<h2 style="text-align:center;">Danh sách người dùng</h2>

<div style="width: 80%; margin:auto; text-align:right;">
    <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-add">Thêm mới</a>
</div>

<c:if test="${empty users}">
    <p style="text-align:center;">Chưa có người dùng nào.</p>
</c:if>

<c:if test="${not empty users}">
    <table>
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>
                    <c:choose>
                        <c:when test="${user.status}">Hoạt động</c:when>
                        <c:otherwise>Vô hiệu</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/users/edit/${user.id}" class="btn btn-edit">Sửa</a>
                    <a href="${pageContext.request.contextPath}/admin/users/delete/${user.id}" class="btn btn-delete" 
                       onclick="return confirm('Bạn có chắc muốn vô hiệu hóa người dùng này?');">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>