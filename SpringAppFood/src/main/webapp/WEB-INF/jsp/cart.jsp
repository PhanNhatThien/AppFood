<%-- 
    Document   : cart
    Created on : 31 Aug 2022, 16:21:11
    Author     : thien thien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger">GIỎ HÀNG</h1>

<c:if test="${carts == null}">
    <h4 class="text-center text-danger">Khong co san pham nao trong gio</h4>
</c:if>


<c:if test="${carts != null}">
    <table class="table">
        <tr>
            <th>Ma san pham</th>
            <th>Ten san pham</th>
            <th>Don gia</th>
            <th>So luong</th>
            <th></th>
        </tr>
        <c:forEach items="${carts}" var="c">
            <tr id="product${c.productId}">
                <td>${c.productId}</td>
                <td>${c.productName}</td>
                <td>${c.price} VND</td>
                <td>
                    <div class="form-group">
                        <input type="number"
                               onblur="updateCart(this,${c.productId})"
                               value="${c.quantity}" 
                               class="form-control" />
                    </div>
                </td>
                <td>
                    <input type="button"
                       value="Xoa" 
                       onclick="deleteCart(${c.productId})"
                       class="btn btn-danger"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <h4 class="text-info">Tong tien:    <span id="amountCart">${cartStats.amount}</span> VND</h4>
    </div>
        <input type="button" onclick="pay()" value="THANH TOAN" class="btn btn-danger"/>
</c:if>

