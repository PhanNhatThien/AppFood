<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center dark-color">TRANG QUẢN LÝ BÀI VIẾT</h1>




<table class="table table-striped mt-5">
    <thead>
        <tr>
            <!--                <th class="text-center" style="width: 15%"></th>-->
            <!--                <th class="text-center" style="width: 5%">STT</th>-->
            <th>Tên</th>
            <th>mô tả</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="p" varStatus="loop">
        <tr>
            <td> ${p.name} </td>
            <td> ${p.description} </td>
        </tr>
    </c:forEach>
</tbody>
</table>
