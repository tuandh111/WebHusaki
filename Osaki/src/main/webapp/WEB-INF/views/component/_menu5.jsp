<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="navigation">
    <ul>
        <li>
            <a href="/admin/account-manager">
                <div class="img-thumbnail imgBox mt-1">
                    <img src="/images/author-item.jpg" style="width: 100px">
                </div>
                <h5 class="title">Xin chào: ${userLogin.fullName}</h5>
            </a>
        </li>
        <li>
            <a href="/profile?content=_dashboard3">
                <span class="icon"><ion-icon name="cart-outline"></ion-icon></span>
                <span class="title">Tài khoản</span>
            </a>
        </li>
        <li>
            <a href="/profile?content=_cart">
                <span class="icon"><ion-icon name="cart-outline"></ion-icon></span>
                <span class="title">Đơn hàng</span>
            </a>
        </li>
        <li>
            <a href="/profile?content=_cartCancel">
                <span class="icon"><ion-icon name="cart-outline"></ion-icon></span>
                <span class="title">Đã hủy</span>
            </a>
        </li>
        <li>
            <a href="/profile?content=_successcart">
                <span class="icon"><ion-icon name="cart-outline"></ion-icon></span>
                <span class="title">Đơn hàng thành công</span>
            </a>
        </li>
        <li>
            <a href="/profile?content=_likeProduct">
                <span class="icon"><ion-icon name="cart-outline"></ion-icon></span>
                <span class="title">Yêu thích</span>
            </a>
        </li>
    </ul>
</div>

