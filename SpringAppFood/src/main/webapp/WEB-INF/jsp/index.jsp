<%-- 
    Document   : index
    Created on : 15 Aug 2022, 13:22:02
    Author     : thien thien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">




<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div>
        <a href="<c:url value="/admin/products" />" class="btn btn-danger">Quan Ly San Pham</a>
    </div>
</sec:authorize>



<section class="container" >
    <div id="demo1" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#demo1" data-slide-to="0" class="active"></li>
          <li data-target="#demo1" data-slide-to="1"></li>
          <li data-target="#demo1" data-slide-to="2"></li>
          <li data-target="#demo1" data-slide-to="3"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<c:url value="/resources/images/Banner1.png" />">
            </div>
            <div class="carousel-item">
              <img src="<c:url value="/resources/images/Banner2.png" />">
            </div>
            <div class="carousel-item">
              <img src="<c:url value="/resources/images/Banner3.png" />">
            </div>
            <div class="carousel-item">
              <img src="<c:url value="/resources/images/Banner4.png" />">
            </div>
        </div>
              
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo1" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo1" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>

      </div>
</section>

<div class="container">
    <div class="row">
        <div class="splide">
            <div class="splide__track">
                <div class="splide__list">
                      <c:forEach items="${products}" var="p">
                          <div class="col-md-3 col-xs-12 col-sm-4 splide__slide m-2" >
                              <div class="card">
                                  <img class="card-img-top" src="https://res.cloudinary.com/dtswvj7fd/image/upload/v1660674827/samples/food/fish-vegetables.jpg" alt="Card image">
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
            </div>
        </div>
    </div>
</div>







<div class="row">
    <c:forEach items="${products}" var="p">
        <div class="col-md-3 col-xs-12 " style="padding:10px;">
            <div class="card">
                <img class="card-img-top" src="https://res.cloudinary.com/dtswvj7fd/image/upload/v1660674849/cld-sample-4.jpg" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">${p.name}</h4>
                    <p class="card-text">
                        <fmt:formatNumber value="${p.price}" maxFractionDigits="3" type = "number" /> VND
                    </p>
                    <div class="detail-buy">
                        <div class="bt-buy">
                            <div>
                                <a href="<c:url value="/products/${p.id}" />" >
                                    <input type="button" value="Xem chi tiet"/>
                                </a>
                            </div>
                            <div>
                                <a href="#" onclick="addToCart(${p.id}, '${p.name}', ${p.price})">
                                    <input type="button" value="Thêm vào giỏ"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<c:if test="${products.size() == 0}">
    <p>
        <strong>Không có sản phẩm nào!!!</strong>
    </p>
</c:if>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="${u} aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <c:forEach begin="1" end="${Math.ceil(productCounter/pageSize)}" var="i">
            <c:url value="/" var="u">
                <c:param name="page" value="${i}" />
            </c:url>
            <li class="page-item"><a class="page-link" href="${u}">${i}</a></li>
        </c:forEach>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
<script src="<c:url value="/resources/js/product.js" />"></script>
<script src="<c:url value="/resources/js/index.js" />"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/js/splide.min.js"></script>

