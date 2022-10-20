<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="container">
    <h1 class="text-center dark-color">QUẢN LÝ BAI VIET</h1>

    <section class="d-flex justify-content-center">
        <form class="mt-3 w-50">
            <div class="form-group">
                <label for="name">Ten</label>
                <input class="form-control" name="name" id="name" value="${name}">
            </div>

            <div class="form-group">
                <label for="description">Mo ta</label>
                <input class="form-control" name="description" id="description" value="${description}">
            </div>

            <div class="form-group">
                <label for="price">Gia</label>
                <input class="form-control" name="price" id="price" value="${price}">
            </div>
            <button type="submit" class="btn btn-info">Tra cứu</button>
            <input type="button" class="btn btn-dark" onclick="removeFilter()" value="Loại bỏ bộ lọc"/>
        </form>
    </section>
</div>

<div class="container">
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

    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/product-post/add-or-update"/>">
                <i class="fa-solid fa-plus"></i>
                Thêm
            </a>
        </li>
    </ul>

    <table class="table table-striped">
        <thead>
        <tr>
            <th class="text-center" style="width: 15%">Thực thi</th>

            <th>Ten</th>
            <th>Mo ta</th>
            <th>Nhà hang</th>
            <th>Đăng bởi</th>
            <th>Loai</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="p" varStatus="loop">
            <tr>
                <td style="text-align: center">
                    <a style="margin-right: 10px" href="<c:url value="/admin/product-post/view" />?id=${p.id}"
                       title="Xem chi tiết">
                        <i class="fa-solid fa-eye"></i>
                    </a>
                    <a style="margin-right: 10px" href="<c:url value="/admin/product-post/add-or-update" />?id=${p.id}"
                       title="Sửa">
                        <i class="fa-solid fa-pen"></i>
                    </a>
                    <a style="margin-right: 10px" href="<c:url value="/admin/product-post/delete" />?id=${p.id}"
                       class="confirmation" title="Xoá">
                        <i class="fa-solid fa-trash"></i>
                    </a>
                </td>

                <td> ${p.name} </td>
                <td> ${p.description} </td>
                <td> ${restaurantService.getByUserId(p.postedByUser.id).name} </td>
                <td> ${userService.getUserById(p.postedByUser.id).username} </td>
                <td> ${categoryService.getById(p.categoryId.id).name} </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <ul class="pagination d-flex justify-content-center mt-4">
        <c:forEach begin="1" end="${Math.ceil(counter/4)}" var="page">
            <li class="page-item">
                <a class="page-link" onclick="updateQueryStringParameter('page', ${page})">${page}</a>
            </li>
        </c:forEach>
    </ul>
</div>

<script>
    $(document).ready(function () {
        $("form").submit(function () {
            $("input, select").each(function (index, obj) {
                if ($(obj).val() === "" || $(obj).val() === "-1") {
                    $(obj).remove();
                }
            });
        });
    });
</script>