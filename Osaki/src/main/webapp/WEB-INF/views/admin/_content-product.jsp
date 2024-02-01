<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row mb-3">
      <div class="d-flex flex-row">
        <h4 class="me-2">Product</h4>
        <a href="/admin/add-or-edit-product" class="btn btn-outline-primary">Add new product</a>
      </div>
</div>
<div class="row">
    <div class="filer-category d-flex flex-row">
        <select class="form-select me-2" style="max-width: 30%;">
		  <option selected>All Categories</option>
		  <option value="1">One</option>
		  <option value="2">Two</option>
		  <option value="3">Three</option>
		</select>
		<button class="btn btn-outline-primary">Filer</button>
    </div>
    <div class="table-responsive">
               <table class="table table-hover">
                   <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>In Stock</th>
                            <th>Active</th>
                            <th>Category</th>
                            <th></th> 
                        </tr>
                   </thead>
                   <tbody>   
                        <!-- Vòng lặp c:forEach -->                
                        <tr>
                            <td>1</td>
                            <td>Sữa rửa mặt Vichy</td>
                            <td>215.000 đ</td>
                            <td>3</td>
                            <td>Đang hoạt động</td>
                            <td>Sữa rửa mặt</td>
                            <td>
                                <a href="#" class="stretched-link">Edit</a> |
                                <a href="#" class="stretched-link text-danger">Delete</a>
                            </td>
                        </tr>                  
                   </tbody>
               </table>
           </div>
</div>
