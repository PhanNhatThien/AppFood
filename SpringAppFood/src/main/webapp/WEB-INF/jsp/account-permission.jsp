<%-- 
    Document   : account-permission
    Created on : 2 Sept 2022, 21:58:37
    Author     : thien thien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<h1 class="text-center dark-color">XÁC NHẬN NHÀ HÀNG</h1>

<c:if test="${users.size() == 0}">
    <div class="alert alert-success mt-4 d-flex justify-content-center align-items-center" style="height: 80px"
         role="alert">
        <h5 class="m-0">TẤT CẢ NHÀ TUYỂN DỤNG ĐÃ ĐƯỢC XÁC NHẬN!</h5>
    </div>
</c:if>

<c:if test="${users.size() > 0}">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/account-permission/accept-all"/>">Xác nhận tất cả</a>
        </li>
    </ul>

    <table class="table table-striped">
        <thead>
            <tr>
                <th class="text-center" style="width: 10%">Xac nhan</th>
                <th class="text-center" style="width: 5%">STT</th>
                <th>Tên đăng nhập</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Loại tài khoản</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="u" varStatus="loop">
                <tr>
                    <td style="text-align: center">
                        <a style="margin-right: 10px"
                           href="<c:url value="/admin/account-permission/accept" />?id=${u.id}"
                           data-toggle="tooltip"
                           title="Duyệt">
                            <i class="fa-solid fa-check"></i>
                        </a>
                    </td>
                    <td class="text-center">${loop.index + 1}</td>
                    <td>${u.username}</td>
                    <td>${u.phone}</td>
                    <td>${u.email}</td>
                    <td>${u.userRole}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
    <c:if test="${sucMsg != null}">
        <div class="alert alert-success" role="alert">
            ${sucMsg}
        </div>
    </c:if>

    <c:if test="${errMsg != null}">
        <div class="alert alert-danger" role="alert">
            ${errMsg}
        </div>
    </c:if>
</c:if>
