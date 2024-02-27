<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="topbar">
    <div class="toggle">
        <ion-icon name="menu-outline"></ion-icon>
    </div>
    <div class="search">
        <label>
            <input type="text" placeholder="Tìm kiếm...">
            <ion-icon name="search-outline"></ion-icon>
        </label>
    </div>
    <div class="user">
        <a href="/profile">
            <img title="${userAdminLogin.fullName}" src="/images/${userAdminLogin.image}">
        </a>       
    </div>
</div>


           