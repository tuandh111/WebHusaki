<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="comment" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Oder -->
<div class="details">
    <div class="recentOrders">
        <div class="cardHeader d-flex flex-row justify-content-between">
            <h2>Địa chỉ của tôi</h2>

        </div>
        <jsp:include page="./_address.jsp"/>
        <table class="table table-hover table-custom">
            <thead>
            <tr>
                <th>STT</th>
                <th>SDT</th>
                <th>Dia chi</th>
                <th>Trang thai</th>
            </tr>
            </thead>
            <tbody id="tbAddress">
            <c:forEach var="address" items="${address}" varStatus="i">
                <tr >
                    <td>${i.index+1}</td>
                    <td>${address.phoneID}</td>
                    <td>${address.address}</td>
                    <td class="removeAddress">X</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="/js/removeAddress.js"></script>
<!-- Chart -->