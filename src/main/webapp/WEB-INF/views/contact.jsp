<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>LiÃªn há»‡</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .contact-container {
            max-width: 600px;
            margin: 60px auto;
            padding: 30px;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        .contact-container h2 {
            margin-bottom: 20px;
        }
        .contact-item {
            font-size: 18px;
            margin: 12px 0;
        }
        .contact-item a {
            text-decoration: none;
            color: #0066cc;
        }
        .contact-item a:hover {
            text-decoration: underline;
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
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chá»§</a></li>
	                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/userOrders/list">ÄÆ¡n hÃ ng cá»§a tÃ´i</a></li>
	                <c:if test="${loggedInUser.role == 'ADMIN'}">
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sáº£n pháº©m</a></li>	       
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/users">Quáº£n trá»‹</a></li>
	                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/orders/list">ÄÆ¡n hÃ ng</a></li>	                
	                </c:if>
	                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/contact">LiÃªn há»‡</a></li>
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
	
	<!-- Ná»™i dung chÃ­nh -->
	<div class="contact-container">
	    <h2>ThÃ´ng tin liÃªn há»‡</h2>
	    <div class="contact-item">ðŸ“§ Gmail: <a href="https://mail.google.com/mail/?view=cm&fs=1&to=ducletrong25122003@gmail.com">ducletrong25122003@gmail.com</a></div>
	    <div class="contact-item">ðŸ“˜ Facebook: <a href="https://facebook.com/tducneee" target="_blank">facebook.com/tducneee</a></div>
	    <div class="contact-item">ðŸ“¸ Instagram: <a href="https://www.instagram.com/tducneee/" target="_blank">@tducneee</a></div>
	    <div class="contact-item">ðŸ¦ X: <a href="https://x.com/LetrongducHUS" target="_blank">@LetrongducHUS</a></div>
	</div>
</body>
</html>
