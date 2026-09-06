<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm/Sửa người dùng</title>
    <style>
        form { width: 40%; margin: auto; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; }
        .btn { padding: 8px 15px; margin-top: 15px; background-color: green; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>

<h2 style="text-align:center;">
    <c:choose>
        <c:when test="${user.id != null}">Chỉnh sửa người dùng</c:when>
        <c:otherwise>Thêm mới người dùng</c:otherwise>
    </c:choose>
</h2>

<form action="${pageContext.request.contextPath}/admin/users/save" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" name="id" value="${user.id}" />

    <label>Username:</label>
    <input type="text" name="username" value="${user.username}" required />

    <label>Password:</label>
    <input type="password" name="password" value="" ${user.id == null ? 'required' : ''} />

    <label>Email:</label>
    <input type="email" name="email" value="${user.email}" required />

    <label>Role:</label>
    <select name="role" required>
        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>USER</option>
        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
    </select>

    <label>Trạng thái:</label>
    <select name="status" required>
        <option value="true" ${user.status ? 'selected' : ''}>Hoạt động</option>
        <option value="false" ${!user.status ? 'selected' : ''}>Vô hiệu</option>
    </select>

    <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-home">Hủy</a>
    <button type="submit" class="btn">Lưu</button>
</form>

</body>
</html>
