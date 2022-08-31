<%-- 
    Document   : index
    Created on : 15 Aug 2022, 13:22:02
    Author     : thien thien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<sec:authorize access="hasRole('ROLE_ADMIN')">
<div>
    <a href="<c:url value="/admin/products" />" class="btn btn-danger">Quan Ly San Pham</a>
</div>
</sec:authorize>
<c:if test="${products.size() == 0}">
    <p>
        <strong>Không có sản phẩm nào!!!</strong>
    </p>
</c:if>
<ul class="pagination">
    <c:forEach begin="1" end="${Math.ceil(productCounter/pageSize)}" var="i">
        <c:url value="/" var="u">
            <c:param name="page" value="${i}" />
        </c:url>
        <li class="page-item"><a class="page-link" href="${u}">Trang ${i}</a></li>
    </c:forEach>
</ul>
<div class="row">
    <c:forEach items="${products}" var="p">
        <div class="col-md-3 col-xs-12" style="padding:10px;">
            <div class="card">
                <img class="card-img-top" src="https://res.cloudinary.com/dtswvj7fd/image/upload/v1660674849/cld-sample-4.jpg" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">${p.name}</h4>
                    <p class="card-text">
                        <fmt:formatNumber value="${p.price}" maxFractionDigits="3" type = "number" /> VND
                    </p>
                     <a href="<c:url value="/products/${p.id}" />" class="btn btn-primary">Xem chi tiet</a>
                     <a href="#" class="btn btn-primary" onclick="addToCart(${p.id}, '${p.name}', ${p.price})">Dat hang</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<script src="<c:url value="/js/product.js" />"></script>