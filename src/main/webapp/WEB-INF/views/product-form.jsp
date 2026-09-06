<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f9fc;
        margin: 0;
        padding: 0;
    }
    .form-container {
        width: 500px;
        background: #fff;
        margin: 40px auto;
        padding: 25px 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
    }
    .form-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 6px;
        color: #444;
    }
    .form-group input[type="text"],
    .form-group input[type="number"],
    .form-group textarea,
    .form-group select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        box-sizing: border-box;
    }
    .form-group textarea {
        resize: vertical;
        min-height: 80px;
    }
    .form-actions {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
    .btn {
        padding: 10px 18px;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        cursor: pointer;
        font-weight: bold;
    }
    .btn-cancel {
        background-color: #ccc;
        color: #000;
    }
    .btn-save {
        background-color: #4CAF50;
        color: white;
    }
    .btn:hover {
        opacity: 0.9;
    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="form-container">
	<h2>Thông tin sản phẩm</h2>
	<form action="${pageContext.request.contextPath}/products/save" method="post" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    <input type="hidden" name="id" value="${product.id}" />
	    <p>
	        Tên: <input type="text" name="name" value="${product.name}" required/>
	    </p>
	    <p>
	        Mô tả: <textarea name="description">${product.description}</textarea>
	    </p>
	    <p>
	        Giá: <input type="number" step="0.01" name="price" value="${product.price}" required/>
	    </p>
	    <p>
	        Danh mục:
	        <select name="category" required>
	            <option value="">-- Chọn danh mục --</option>
	            <option value="fashion" ${product.category == 'fashion' ? 'selected' : ''}>Thời Trang</option>
	            <option value="phones_and_accessories" ${product.category == 'phones_and_accessories' ? 'selected' : ''}>Điện Thoại & Phụ Kiện</option>
	            <option value="tools_and_gadgets" ${product.category == 'tools_and_gadgets' ? 'selected' : ''}>Dụng cụ và thiết bị tiện ích</option>
	            <option value="electronic_equipment" ${product.category == 'electronic_equipment' ? 'selected' : ''}>Thiết Bị Điện Tử</option>
	            <option value="health" ${product.category == 'health' ? 'selected' : ''}>Sức Khỏe</option>
	            <option value="computers_and_laptops" ${product.category == 'computers_and_laptops' ? 'selected' : ''}>Máy Tính & Laptop</option>
	            <option value="cameras_and_camcorders" ${product.category == 'cameras_and_camcorders' ? 'selected' : ''}>Máy Ảnh & Máy Quay Phim</option>
	            <option value="watch" ${product.category == 'watch' ? 'selected' : ''}>Đồng Hồ</option>
	            <option value="shoes" ${product.category == 'shoes' ? 'selected' : ''}>Giày Dép</option>
	            <option value="household_electrical_appliances" ${product.category == 'household_electrical_appliances' ? 'selected' : ''}>Thiết Bị Điện Gia Dụng</option>
	            <option value="sports_and_travel" ${product.category == 'sports_and_travel' ? 'selected' : ''}>Thể Thao & Du Lịch</option>
	            <option value="cars_and_motorbikes_and_bicycles" ${product.category == 'cars_and_motorbikes_and_bicycles' ? 'selected' : ''}>Ô Tô & Xe Máy & Xe Đạp</option>
	            <option value="backpacks_and_purses" ${product.category == 'backpacks_and_purses' ? 'selected' : ''}>Balo & Túi Ví</option>
	            <option value="toys" ${product.category == 'toys' ? 'selected' : ''}>Đồ Chơi</option>
	            <option value="pet_care" ${product.category == 'pet_care' ? 'selected' : ''}>Chăm Sóc Thú Cưng</option>
	            <option value="mother_and_baby" ${product.category == 'mother_and_baby' ? 'selected' : ''}>Mẹ & Bé</option>
	            <option value="home_and_life" ${product.category == 'home_and_life' ? 'selected' : ''}>Nhà Cửa & Đời Sống</option>
	            <option value="beauty" ${product.category == 'beauty' ? 'selected' : ''}>Sắc Đẹp</option>
	            <option value="health" ${product.category == 'accessories_and_jewelry' ? 'selected' : ''}>Phụ Kiện & Trang Sức</option>
	            <option value="online_department_store" ${product.category == 'online_department_store' ? 'selected' : ''}>Bách Hóa Online</option>
	            <option value="online_bookstore" ${product.category == 'online_bookstore' ? 'selected' : ''}>Nhà Sách Online</option>
	            <option value="laundry_and_housekeeping" ${product.category == 'laundry_and_housekeeping' ? 'selected' : ''}>Giặt Giũ & Chăm Sóc Nhà Cửa</option>
	        </select>
	    </p>
	    <p>
	        Hình ảnh: <input type="file" name="imageFile" accept="image/*"/>
	    </p>
	    <c:if test="${not empty product.image}">
	        <p>Ảnh hiện tại:</p>
	        <img src="${pageContext.request.contextPath}/uploads/${product.image}" 
	             alt="Ảnh sản phẩm" style="max-width:150px; border:1px solid #ddd; padding:4px;"/>
	    </c:if>
	    <button type="button" onclick="window.history.back();" class="btn btn-outline-primary btn-sm">Hủy</button>
	    <button type="submit" class="btn btn-outline-primary btn-sm">Lưu</button>
	</form>
</div>
