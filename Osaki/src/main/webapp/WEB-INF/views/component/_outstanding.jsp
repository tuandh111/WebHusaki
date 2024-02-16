<%--
  Created by IntelliJ IDEA.
  User: Hoang Tuan
  Date: 1/30/2024
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="main__frame">
    <div class="grid wide">
        <h3 class="category__title">Hoàng Tuấn Cometics</h3>
        <h3 class="category__heading">SẢN PHẨM BÁN CHẠY</h3>

        <div class="row">
            <c:forEach var="pdProduct" items="${listPromotionalDetail}">
                <c:forEach var="p" items="${bestSellers}" varStatus="i">
                    <c:if test="${!p[0].isDelete}">
                        <c:if test="${pdProduct.productID.productID == p[0].productID}">
                            <div class="col-lg-2 col-md-4 col-sm-6">
                                <div class="product">
                                    <div class="product__avt"
                                         style="background-image: url(images/product/product1.jpg);"></div>
                                    <div class="product__info">
                                        <h3 class="product__name">${p[0].name}</h3>
                                        <div class="product__price">
                                            <div class="price__old">
                                                <fmt:formatNumber
                                                        type="number"
                                                        pattern="###,###,###"
                                                        value="${p[0].price}"/> <span
                                                    class="price__unit"> đ</span>
                                            </div>
                                            <c:choose>
                                                <c:when test="${p[0].quantityInStock>0}">
                                                    <div class="price__new"><fmt:formatNumber
                                                            type="number"
                                                            pattern="###,###,###"
                                                            value="${pdProduct.discountedPrice}"/>
                                                        <span class="price__unit">đ</span></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="price__unit">Tạm het hang</span>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                        <div class="product__sale">
                                                              <span class="product__sale-percent">
                                                                    -<fmt:formatNumber type="number"
                                                                                       pattern="###,###,###"
                                                                                       value="${(p[0].price - pdProduct.discountedPrice)/p[0].price *100}"/>%
                                                                </span>
                                            <span class="product__sale-text">Giảm</span>
                                        </div>
                                    </div>
                                    <a href="product/${p[0].productID}" class="viewDetail">Xem chi tiết</a>
                                    <a href="#" title="cart" data-product-id="${p[0].productID}"
                                       data-user-id="${userLogin.userID}" class="addToCart">Thêm vào
                                                                                            giỏ</a>
                                    <c:set var="checkLike" value="false"/>
                                    <c:forEach items="${likeList }" var="lp" varStatus="i">
                                        <c:if test="${lp.productID.productID == p[0].productID }">
                                            <c:set var="checkLike" value="true"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${checkLike }">
                                            <a title="Wishlist" href="#"
                                               class="siteLikeProduct m-md-3"
                                               data-product-id="${p[0].productID}"
                                               data-user-id="${userLogin.userID}">
                                                <i class="bi-heart-fill"></i>
                                                <span class="title-like">Xóa yêu thích</span>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a title="Wishlist" href="#"
                                               class="siteLikeProduct m-md-3"
                                               data-product-id="${p[0].productID}"
                                               data-user-id="${userLogin.userID}">
                                                <i class="bi-heart"></i>
                                                <span class="title-like">Thêm vào yêu thích</span>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                        <%--                                             <span class="category">${c.categoryName}</span> --%>
                                </div>
                            </div>
                        </c:if>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
    </div>
</div>
