<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row mb-3 p-5">
      <div class="d-flex flex-row">
        <h4 class="me-2">Product</h4>
        <a href="/admin/add-or-edit-product?action=add" class="btn btn-outline-primary">Add new product</a>
      </div>
</div>
<div class="row p-5">
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
         <input class="form-control me-2" value="135 items ${totalElement}" style="max-width: 10%;background-color: #b7a888;" disabled="disabled">
         <button class="btn btn-outline-secondary me-2">First</button>
         <button class="btn btn-outline-secondary me-2">Prev</button>
         <input class="form-control" name="currentPage" value="${currentPage}" placeholder="1" style="max-width: 5%;background-color: #b7a888;">
         <input class="form-control me-2" value="of ${totalPage}" style="max-width: 5%; background-color: #b7a888;" disabled="disabled">
         <button class="btn btn-outline-secondary me-2">Next</button>
         <button class="btn btn-outline-secondary me-2">Last</button>    
    </div>
    <div class="table-responsive">
               <table class="table table-hover">
                   <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Tồn kho</th>
                            <th>Trang thái</th>
                            <th>Danh mục</th>
                            <th></th> 
                        </tr>
                   </thead>
                   <tbody>   
                        <!-- Vòng lặp c:forEach -->                
                        <tr>
                            <td>12213457</td>
                            <td>
                                <div class="d-flex">
                                    <img src="/images/product-item1.jpg" class="img-thumbnail me-3" alt="Ảnh đại diện" style="width: 50px;height: 50px">
	                                <div class="row">
	                                    <div class="col-4">
	                                        <i class="bi bi-bag"></i>
	                                        <span>100</span>                                       
	                                    </div>
	                                    <div class="col-4">
	                                        <i class="bi bi-balloon-heart-fill"></i>
	                                        <span>100</span>                                       
	                                    </div>
	                                    <div class="col-4">
	                                        <i class="bi bi-eye"></i>
	                                        <span>100</span>                                       
	                                    </div>
	                                </div>
                                </div>                                   
                            </td>
                            <td>Sữa rửa mặt Vichy</td>
                            <td>
                                <input name="price" value="${item.price}"
                                        onblur="this.form.submit()" style="width:50px;">
                            </td>
                            <td>
                                <input name="qty" value="${item.qty}"
                                        onblur="this.form.submit()" style="width:50px;">
                            </td>
                            <td>Đang hoạt động</td>
                            <td>Sữa rửa mặt</td>
                            <td>
                                <a href="/admin/add-or-edit-product?action=edit" class="btn btn-outline-primary">Edit</a>
                                |
                                <a href="#" class="btn btn-outline-danger">Delete</a>
                            </td>
                        </tr>                  
                   </tbody>
               </table>
           </div>
</div>
