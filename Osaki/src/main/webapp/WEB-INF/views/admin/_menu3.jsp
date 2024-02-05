<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>HASAGI</h3>
<ul class="nav flex-column bd-links">
    <li class="nav-item">
        <button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">
          DashBoard
        </button>
       <div class="collapse" id="dashboard-collapse">
          <ul class="list-unstyled fw-normal pb-1 small">
               <li>
                   <a href="/admin" class="d-inline-flex align-items-center rounded">Dashboard</a>
                </li>
                <li>
                   <a href="#" class="d-inline-flex align-items-center rounded">Tài khoản của tôi</a>
                </li>     
          </ul>
       </div>   
    </li>
    
    <li class="nav-item">
        <button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#basic-collapse" aria-expanded="true">
          Chức năng cơ bản
        </button>
       <div class="collapse" id="basic-collapse">
          <ul class="list-unstyled fw-normal pb-1 small">
                <li>
                   <a href="/admin/account-manager">Tài khoản</a>
                </li>    
                <li>
                   <a href="/admin/category-manager">Danh mục</a>
                </li>
                <li>
                   <a href="/admin/brand-manager">Thương hiệu</a>
                </li>
                <li>
                   <a href="/admin/product-manager">Quản lý sản phẩm</a>
                </li>
                <li>
                   <a href="#">Quản lý đánh giá</a>
                </li>
                <li>
                   <a href="#">Đơn hàng</a>
                </li>
          </ul>
       </div>   
    </li>
 
    <li class="nav-item">
        <button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#marketing-collapse" aria-expanded="true">
          Marketing
        </button>
       <div class="collapse" id="marketing-collapse">
          <ul class="list-unstyled fw-normal pb-1 small">
                <li>
                   <a href="#">Mã giảm giá</a>
                </li>    
                <li>
                   <a href="#">Miến phí vận chuyển</a>
                </li>
                <li>
                   <a href="#">Combo linh hoạt</a>
                </li>                
          </ul>
       </div>   
    </li>
    
    <li class="nav-item">
        <button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#statistics-manager-collapse">
          Thống kê
        </button>
       <div class="collapse" id="statistics-manager-collapse">
          <ul class="list-unstyled fw-normal pb-1 small">
                <li>
                   <a href="/admin/revenue-statistics">Doanh Thu</a>
                </li>
                <li>
                   <a href="/admin/product-statistics">Sản phẩm tồn</a>
                </li> 
                <li>
                   <a href="/admin/account-statistics">Tài khoản đăng ký mới</a>
                </li> 
                <li>
                   <a href="/admin/category-statistics">Danh mục sản phẩm</a>
                </li>     
          </ul>
       </div>   
    </li>

</ul>

