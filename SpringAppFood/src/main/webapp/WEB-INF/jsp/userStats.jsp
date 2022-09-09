
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
    <div class="col-md-6 col-xs-12">
        <table class="table">
            <tr>
                <th>Id</th>
                <th>Ten nha hang</th>
                <th>Tong so san pham</th>
            </tr>
            <c:forEach items="${userStats}" var="c">
                <tr>
                    <td>${c[0]}</td>
                    <td>${c[1]}</td>
                    <td>${c[2]}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-md-6 col-xs-12">
        <canvas id="myChart3"></canvas>
    </div>
</div>

<script>
    window.onload = function () {

        let data3 = [];
        let labels3 = [];

        <c:forEach items="${userStats}" var="c">
        data3.push(${c[2]});
        labels3.push('$${c[1]}');
        </c:forEach>
        
        usersStats(labels3, data3);

    }
</script>  