<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="comment" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Oder -->
<div class="details">
    <div class="recentOrders" style="width: 900px">
        <div class="row">
            <div class="col l-8 m-12 s-12">
                <div class="main__cart">
                    <div class="row title">
                        <div class="col l-4 m-4 s-8">Sản phẩm</div>
                        <div class="col l-2 m-2 s-0">Giá</div>
                        <div class="col l-1 m-1 s-0">Xóa</div>
                    </div>
                    <c:forEach var="listLike" items="${listLike}">
                        <div class="row item">
                            <div class="col l-4 m-4 s-8">
                                <div class="main__cart-product">
                                    <img src="./images/product/product2.jpg" alt="">
                                    <div class="name">${listLike.productID.name}</div>
                                </div>
                            </div>
                            <div class="col l-2 m-2 s-0">
                                <div class="main__cart-price">${listLike.productID.price}</div>
                            </div>
                            <div class="col l-1 m-1 s-0">
                                <span class="main__cart-icon">
                                <i class="far fa-times-circle "></i>
                            </span>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart -->