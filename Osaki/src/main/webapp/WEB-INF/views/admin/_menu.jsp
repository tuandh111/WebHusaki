<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>HASAGI</h3>
<ul class="nav flex-column bd-links">
	<li class="nav-item">
	    <button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#category-collapse">
          Quản lý danh mục
        </button>
	   <div class="collapse" id="category-collapse">
	      <ul class="list-unstyled fw-normal pb-1 small">
	           <li>
	               <a href="/admin/category-manager" class="d-inline-flex align-items-center rounded">Danh mục sản phẩm</a>
	            </li>    
	      </ul>
	   </div>	
	</li>
	
	<li class="nav-item">
        <button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-manager-collapse">
          Quản lý tài khoản
        </button>
       <div class="collapse" id="account-manager-collapse">
          <ul class="list-unstyled fw-normal pb-1 small">
                <li>
                   <a href="/admin/account-manager">Tài khoản người dùng</a>
                </li>    
          </ul>
       </div>   
    </li>
	
	<li class="nav-item">
        <button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#product-manager-collapse">
          Quản lý sản phẩm
        </button>
       <div class="collapse" id="product-manager-collapse">
          <ul class="list-unstyled fw-normal pb-1 small">
                <li>
                   <a href="/admin/product-manager">Quản lý sản phẩm</a>
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
                   <a href="/admin/revenue-statistics">Thống kê doanh thu</a>
                </li>
                <li>
                   <a href="/admin/product-statistics">Thống kê sản phẩm</a>
                </li> 
                <li>
                   <a href="/admin/account-statistics">Thống kê tài khoản</a>
                </li> 
                <li>
                   <a href="/admin/category-statistics">Thống kê danh mục sản phẩm</a>
                </li>     
          </ul>
       </div>   
    </li>

</ul>