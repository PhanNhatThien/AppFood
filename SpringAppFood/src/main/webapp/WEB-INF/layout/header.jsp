<%-- 
    Document   : header
    Created on : 17 Aug 2022, 11:42:09
    Author     : thien thien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="<c:url value="/js/product.js" />"></script>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="javascript:void(0)">&#127836; AppFood</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">

                <sec:authorize access="hasRole('ROLE_KH')">
                    <c:forEach items="${categories}" var="c">
                        <c:url value="/" var="cUrl">
                            <c:param name="cateId" value="${c.id}" />
                        </c:url>
                        <li class="nav-item">
                            <a class="nav-link" href="${cUrl}">${c.name}</a>
                        </li>
                    </c:forEach>
                    <li class="nav-item text-success" >
                        <a class="nav-link" href="<c:url value="/cart" />" >
                            <i>&#128722;</i>
                            <div class="badge badge-danger" id="cartCounter">${cartCounter}</div>
                        </a>

                    </li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/admin/products" />">Quan ly san pham</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/admin/account" />">Quan ly tai khoan</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/admin/account-permission" />">Duyet TK Nha Hang</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/admin/userStats" />">Thong ke</a>
                    </li>


                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_NH')">
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/restaurant/post/add-or-update" />">Dang tin </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/restaurant/confirm-order" />">Xac nhan don hang</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/restaurant/management" />">Quan ly bai viet </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link text-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Thong ke</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<c:url value="/restaurant/stats-cate" />">Thong ke theo</a></li>
                            <li><a class="dropdown-item" href="<c:url value="/restaurant/stats-revenue" />">Thong ke theo</a></li>
                            <li><a class="dropdown-item" href="#">A third link</a></li>
                        </ul>
                    </li>

                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <!--                    <li class="nav-item">
                                            <a class="nav-link text-info" href="<c:url value="/login" />">Dang nhap</a>
                                        </li>-->
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item active">
                            <a class="nav-link text-danger" href="<c:url value="/login" />">&#128119; Đăng Nhập</a>
                        </li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item active">
                            <a class="nav-link text-danger" href="<c:url value="/" />">${pageContext.request.userPrincipal.name}</a>
                        </li>
                    </c:if>

                    <li class="nav-item">
                        <a class="nav-link text-info" href="<c:url value="/register" />">Dang ky</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="<c:url value="/login" />">
                            ${pageContext.session.getAttribute("currentUser").firstName}
                            ${pageContext.session.getAttribute("currentUser").lastName}
                            <c:if test="${currentUser.avatar != null}">
                                <img style="width: 30px;" src="${currentUser.avatar}" class="rounded-circle" />
                            </c:if>
                            <c:if test="${currentUser.avatar == null}">
                                &#128119;
                            </c:if>
                            (<sec:authentication property="principal.username" />)
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-danger" href="<c:url value="/logout" />">Dang xuat</a>
                    </li>
                </sec:authorize>
            </ul>
            <c:url value="/" var="action" />
            <form method="get" action="${action}" class="d-flex">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhap tu khoa de tim...">
                <button type="submit" class="btn btn-primary" type="button">Tim</button>
            </form>
        </div>
    </div>
</nav>
