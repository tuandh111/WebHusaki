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
                        <div class="col l-1 m-1 s-0">Chọn</div>
                        <div class="col l-4 m-4 s-8">Sản phẩm</div>
                        <div class="col l-2 m-2 s-0">Giá</div>
                        <div class="col l-2 m-2 s-0">Số lượng</div>
                        <div class="col l-2 m-2 s-4">Tổng</div>
                        <div class="col l-1 m-1 s-0">Xóa</div>
                    </div>
                    <div class="row item">
                        <div class="col l-1 m-1 s-0">
                            <input type="checkbox" name="a">
                        </div>
                        <div class="col l-4 m-4 s-8">
                            <div class="main__cart-product">
                                <img src="./assets/img/product/product2.jpg" alt="">
                                <div class="name">Azrouel dress variable Azrouel dress variable</div>
                            </div>
                        </div>
                        <div class="col l-2 m-2 s-0">
                            <div class="main__cart-price">476.000 đ</div>
                        </div>
                        <div class="col l-2 m-2 s-0">
                            <div class="buttons_added">
                                <input class="minus is-form" type="button" value="-" onclick="minusProduct()">
                                <input aria-label="quantity" class="input-qty" max="10" min="1" name="" type="number"
                                       value="1">
                                <input class="plus is-form" type="button" value="+" onclick="plusProduct()">
                            </div>
                        </div>
                        <div class="col l-2 m-2 s-4">
                            <div class="main__cart-price">476.000 đ</div>
                        </div>
                        <div class="col l-1 m-1 s-0">
                                <span class="main__cart-icon">
                                <i class="far fa-times-circle "></i>
                            </span>
                        </div>
                    </div>
                    <div class="row item">
                        <div class="col l-1 m-1 s-0">
                            <input type="checkbox" name="a">
                        </div>
                        <div class="col l-4 m-4 s-8">
                            <div class="main__cart-product">
                                <img src="./assets/img/product/product2.jpg" alt="">
                                <div class="name">Azrouel dress variable Azrouel dress variable</div>
                            </div>
                        </div>
                        <div class="col l-2 m-2 s-0">
                            <div class="main__cart-price">476.000 đ</div>
                        </div>
                        <div class="col l-2 m-2 s-0">
                            <div class="buttons_added">
                                <input class="minus is-form" type="button" value="-" onclick="minusProduct()">
                                <input aria-label="quantity" class="input-qty" max="10" min="1" name="" type="number"
                                       value="1">
                                <input class="plus is-form" type="button" value="+" onclick="plusProduct()">
                            </div>
                        </div>
                        <div class="col l-2 m-2 s-4">
                            <div class="main__cart-price">476.000 đ</div>
                        </div>
                        <div class="col l-1 m-1 s-0">
                                <span class="main__cart-icon">
                                <i class="far fa-times-circle "></i>
                            </span>
                        </div>
                    </div>
                    <div class="row item">
                        <div class="col l-1 m-1 s-0">
                            <input type="checkbox" name="a">
                        </div>
                        <div class="col l-4 m-4 s-8">
                            <div class="main__cart-product">
                                <img src="./assets/img/product/product2.jpg" alt="">
                                <div class="name">Azrouel dress variable Azrouel dress variable</div>
                            </div>
                        </div>
                        <div class="col l-2 m-2 s-0">
                            <div class="main__cart-price">476.000 đ</div>
                        </div>
                        <div class="col l-2 m-2 s-0">
                            <div class="buttons_added">
                                <input class="minus is-form" type="button" value="-" onclick="minusProduct()">
                                <input aria-label="quantity" class="input-qty" max="10" min="1" name="" type="number"
                                       value="1">
                                <input class="plus is-form" type="button" value="+" onclick="plusProduct()">
                            </div>
                        </div>
                        <div class="col l-2 m-2 s-4">
                            <div class="main__cart-price">476.000 đ</div>
                        </div>
                        <div class="col l-1 m-1 s-0">
                                <span class="main__cart-icon">
                                <i class="far fa-times-circle "></i>
                            </span>
                        </div>
                    </div>
                    <div class="btn btn--default">
                        Cập nhật giỏ hàng
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart -->