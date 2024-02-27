<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

    
    
    <div class="col-8 d-flex justify-content-end">
                 
                <input class="form-control me-2" value="${totalElements} sản phẩm" style="max-width: 15%;background-color: #b7a888;" disabled="disabled">               
                <c:if test="${not booleanFirst}">
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-product.jsp&p=0">Đầu</a>
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-product.jsp&p=${prevPage}">Trước</a>
                </c:if>                
                <input class="form-control" name="currentPage" value="${currentPage}" style="max-width: 8%;background-color: #b7a888;" disabled="disabled">
                <input class="form-control me-2" value="of ${totalPages}" style="max-width: 12%; background-color: #b7a888;" disabled="disabled">
                <c:if test="${not booleanLast}">
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-product.jsp&p=${nextPage}">Tiếp</a>
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-product.jsp&p=${totalPages}">Cuối</a>
                </c:if>                      
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
                                      
                                      <c:forEach var="item" items="${item}">
                        <tr>
                            <td> alshda</td>
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
                                ${item.price}
                            </td>
                            <td>
                               ${item.quantity}
                            <td>Đang hoạt động</td>
                            <td>Sữa rửa mặt</td>
                            <td>
                                <a href="/admin/add-or-edit-product?action=edit" class="btn btn-outline-primary">Edit</a>
                                |
                                <a href="#" class="btn btn-outline-danger">Delete</a>
                            </td>
                        </tr>      </c:forEach>            
                   </tbody>
               </table>
           </div>
</div>
