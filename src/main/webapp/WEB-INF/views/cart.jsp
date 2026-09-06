<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giá» hÃ ng cá»§a báº¡n</title>
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
	                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/home">Trang chá»§</a></li>
	                <c:if test="${loggedInUser.role == 'ADMIN'}">
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sáº£n pháº©m</a></li>	       
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Quáº£n trá»‹</a></li>
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">ÄÆ¡n hÃ ng</a></li>
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
<h2 style="text-align:center;">Giá» hÃ ng</h2>

<c:if test="${empty cartItems}">
    <p style="text-align:center;">Giá» hÃ ng trá»‘ng.</p>
    
    <div style="text-align:center; margin-top:20px;">
        <a href="${pageContext.request.contextPath}/home">
            <button type="button" class="btn" style="background-color: #4CAF50; color: white;">Quay vá» trang chá»§</button>
        </a>
    </div>
</c:if>

<c:if test="${not empty cartItems}">
    <table>
        <tr>
            <th>Sáº£n pháº©m</th>
            <th>Sá»‘ lÆ°á»£ng</th>
            <th>NgÃ y thÃªm</th>
            <th>HÃ nh Ä‘á»™ng</th>
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
                        <button type="submit" class="btn btn-delete">XÃ³a</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div style="text-align:center;">
        <form action="${pageContext.request.contextPath}/cart/clear" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" class="btn btn-clear">XÃ³a toÃ n bá»™</button>
        </form>
    </div>
    
    <div style="text-align:center; margin-top:20px;">
    <form action="${pageContext.request.contextPath}/cart/checkout" method="get">
        <button type="submit" class="btn" style="background-color: blue; color: white;">
            Äáº·t hÃ ng
        </button>
    </form>
</div>
    
    <div style="text-align:center; margin-top:20px;">
        <a href="${pageContext.request.contextPath}/home">
            <button type="button" class="btn" style="background-color: #4CAF50; color: white;">Quay vá» trang chá»§</button>
        </a>
    </div>
</c:if>

</body>
</html>
