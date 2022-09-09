<%-- 
    Document   : restaurant-add-post
    Created on : 4 Sept 2022, 14:22:53
    Author     : thien thien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>




<c:if test="${product.id == 0}">
    <h1 class="text-center dark-color">ĐĂNG TIN </h1>
</c:if>
<c:if test="${product.id > 0}">
    <h1 class="text-center dark-color">CHỈNH SỬA TIN ${jobPost.id}</h1>
</c:if>

<c:url value="/restaurant/post/add-or-update" var="action"/>

<form:form action="${action}" method="post" modelAttribute="product">
    <form:errors path="*" element="div" cssClass="alert alert-danger mt-3"/>
    <form:hidden path="id"/>
    <div class="form-group">
        <label>Tên</label>
        <form:input path="name" class="form-control" autofocus="autofocus"/>
    </div>
    <div class="form-group">
        <label>Mô tả</label>
        <form:textarea path="description" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Giá</label>
        <form:input path="price" class="form-control"/>
    </div>
    


    <div class="form-group">
        <label>Loại công việc</label>
        <form:select path="categoryById" class="form-select" >
            <c:forEach items="${categories}" var="c" >
                <option value="${c.id}" >${c.name}</option>
            </c:forEach>
        </form:select>
    </div>
    
    <form:hidden path="postedByUserId" value="${currentUser.id}" />

    <div class="form-group">
        <c:if test="${product.id == 0}">
            <button type="submit" name="submit" value="submit" class="btn btn-primary">Thêm</button>
        </c:if>
        <c:if test="${product.id > 0}">
            <button type="submit" name="submit" value="submit" class="btn btn-primary">Cập nhật</button>
        </c:if>
    </div>


</form:form>