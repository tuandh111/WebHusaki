<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row mb-3">
      <div class="d-flex flex-row">
        <h4 class="me-2">Product</h4>
        <a href="/admin/add-or-edit-product" class="btn btn-outline-primary">Add new product</a>
      </div>
</div>
<div class="row">
    <div class="filer-category d-flex flex-row mb-3">
        <select class="form-select me-2" style="max-width: 30%;">
		  <option selected>All Categories</option>
		  <option value="1">One</option>
		  <option value="2">Two</option>
		  <option value="3">Three</option>
		</select>
		<button class="btn btn-outline-primary">Filer</button>
    </div>
    <div class="control-product d-flex flex-row mb-3">
         <!-- <jsp:include page="__navigation-button.jsp" /> -->
         <input class="form-control me-2" value="135 items ${totalElement}" style="max-width: 10%;background-color: #c5c6b9;" disabled="disabled">
         <button class="btn btn-outline-secondary me-2">First</button>
         <button class="btn btn-outline-secondary me-2">Prev</button>
         <input class="form-control" name="currentPage" value="${currentPage}" placeholder="1" style="max-width: 5%;background-color: #c5c6b9;">
         <input class="form-control me-2" value="of 5 ${totalPage}" style="max-width: 5%; background-color: #c5c6b9;" disabled="disabled">
         <button class="btn btn-outline-secondary me-2">Next</button>
         <button class="btn btn-outline-secondary me-2">Last</button>    
    </div>
    <div class="table-responsive">
               <table class="table table-hover">
                   <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
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
                            <td>
                                <img src="/images/product-item1.jpg" class="img-thumbnail" alt="Ảnh đại diện" style="width: 50px;height: 50px">
                            </td>
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
