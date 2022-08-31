<%-- 
    Document   : login
    Created on : 30 Aug 2022, 16:13:29
    Author     : thien thien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger">ĐĂNG NHẬP</h1>

<c:if test="${param.error !=null}">
    <div class="alert alert-danger">
        Da co loi xay ra! Vui Long Thu Lai!
    </div>
    
</c:if>
<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger">
        Ban khong co quyen
    </div>
    
</c:if>



<c:url value="/login" var="action" />
<form method="post" action="${action}">
    <div class="form-group" >
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="form-control" />
    </div>
    <div class="form-group" >
        <label for="password">Password</label>
        <input type="password" id="password" name="password" class="form-control" />
    </div>
    <div class="form-group" >

        <input type="submit" value="Dang Nhap" class="btn btn-danger"/>
    </div>

</form>
