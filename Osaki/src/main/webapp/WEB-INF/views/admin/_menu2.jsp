<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Menu here</h1>
<div class="accordion accordion-flush admin-menu-accordion" id="accordionFlushAdminManager">
<!-- 1111111111111111111111111111111111111 -->
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingAccount">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseAccount" aria-expanded="false" aria-controls="flush-collapseAccount">
        QUẢN LÝ TÀI KHOẢN 
      </button>
    </h2>
    <div id="flush-collapseAccount" class="accordion-collapse collapse" aria-labelledby="flush-headingAccount" data-bs-parent="#accordionFlushAdminManager">
      <div class="accordion-body">
      	<div class="mb-2">
      		<i class="bi bi-people-fill"></i>
      		<a href="/admin/account-manager">Quản lý tài khoản người dùng</a>
      	</div>
      </div>
    </div>
  </div>
  <!-- 22222222222222222222222222222222222222222 -->
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingCategory">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseCategory" aria-expanded="false" aria-controls="flush-collapseCategory">
        QUẢN LÝ DANH MỤC SẢN PHẨM
      </button>
    </h2>
    <div id="flush-collapseCategory" class="accordion-collapse collapse" aria-labelledby="flush-headingCategory" data-bs-parent="#accordionFlushAdminManager">
      <div class="accordion-body">
      	<div class="mb-2">
      		<i class="bi bi-tags-fill"></i>
      		<a href="/admin/category-manager">Quản lý danh mục sản phẩm</a>
      	</div>     	
      </div>
    </div>
  </div>
  <!-- 33333333333333333333 -->
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingProduct">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseProduct" aria-expanded="false" aria-controls="flush-collapseProduct">
        QUẢN LÝ SẢN PHẨM
      </button>
    </h2>
    <div id="flush-collapseProduct" class="accordion-collapse collapse" aria-labelledby="flush-headingProduct" data-bs-parent="#accordionFlushAdminManager">
      <div class="accordion-body">
      	<div class="mb-2">
      		<i class="bi bi-card-list"></i>
      		<a href="/admin/product-manager">Quản lý sản phẩm</a>
      	</div>
      </div>
    </div>
  </div>
  <!-- 4444444444444444 -->
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingstatistical">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsestatistical" aria-expanded="false" aria-controls="flush-collapsestatistical">
        QUẢN LÝ BÁO CÁO THỐNG KÊ
      </button>
    </h2>
    <div id="flush-collapsestatistical" class="accordion-collapse collapse" aria-labelledby="flush-headingstatistical" data-bs-parent="#accordionFlushAdminManager">
      <div class="accordion-body">
      	<div class="mb-2">
      		<i class="bi bi-currency-dollar"></i>
      		<a href="/admin/revenue-statistics">Thống kê doanh thu</a>
      	</div>
      	<div class="mb-2">
      		<i class="bi bi-bullseye"></i>
      		<a href="/admin/product-statistics">Thống kê sản phẩm</a>
      	</div>
      	<div class="mb-2">
      		<i class="bi bi-person-bounding-box"></i>
      		<a href="/admin/account-statistics">Thống kê tài khoản người dùng</a>
      	</div>
      	<div class="mb-2">
      		<i class="bi bi-bookmark-check-fill"></i>
      		<a href="/admin/category-statistics">Thống kê danh mục sản phẩm</a>
      	</div>      	
      </div>
    </div>
  </div>
  
</div>