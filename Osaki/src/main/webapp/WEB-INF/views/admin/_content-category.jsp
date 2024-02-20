<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row mb-4 p-5">
	<h2>Categories</h2>
</div>

<div class="row p-5">
	<div class="col-4">
		<h5>Add New Category</h5>
		<!--<form action="">
		  <label>Name</label>
		  <input class="form-control" name="categoryName">
		  <br>
		  <input type="checkbox" checked="checked">
		  <label>Active ?</label>
		  <br>
		  <button class="btn btn-outline-primary mt-4">Add New Category</button>
		</form>-->
		<form:form action="/admin/category-manager" modelAttribute="category">
		  <form:label path="categoryName">Category Name</form:label>
		  <form:input path="categoryName"/>
		  <br>
		  <form:input path="isDelete"/>
		  <form:label path="isDelete">Active ?</form:label>
		</form:form>
	</div>
	<div class="col-8">
	   <div class="row justify-content-end">
	       <div class="col-8 mb-3">
	           <form action="/admin/category-search" method="get">
	            <div class="d-flex flex-row justify-content-end">
	                <input class="form-control me-2" name="categoryNameSearch" style="max-width: 60%;">
	                <button class="btn btn-outline-primary" style="max-width: 40%;">Search Categories</button>
	            </div>
             </form>
	       </div>
	       <div class="col-8 d-flex justify-content-end">
	             <!-- <jsp:include page="__navigation-button.jsp" /> -->
	            <input class="form-control me-2" value="135 items ${totalElement}" style="max-width: 20%;background-color: #b7a888;" disabled="disabled">
                <button class="btn btn-outline-secondary me-2">First</button>
                <button class="btn btn-outline-secondary me-2">Prev</button>
                <input class="form-control" name="currentPage" value="${currentPage}" placeholder="1" style="max-width: 10%;background-color: #b7a888;">
                <input class="form-control me-2" value="of ${totalPage}" style="max-width: 10%; background-color: #b7a888;" disabled="disabled">
                <button class="btn btn-outline-secondary me-2">Next</button>
                <button class="btn btn-outline-secondary me-2">Last</button>         
           </div>	         
	   </div>
	   <div class="row">
	       <div class="table-responsive">
	           <table class="table table-hover">
                   <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên danh mục</th>
                            <th>Trạng thái</th>
                            <th>Số lượng sản phẩm</th>
                            <th></th> 
                        </tr>
                   </thead>
                   <tbody>   
                        <!-- Vòng lặp c:forEach -->  
                        <c:forEach var="item" items="${categories}">
                            <tr>
	                            <td>${item.id}</td>
	                            <td>${item.name}</td>
	                            <td>${item.isDelete?'Ngưng hoạt động':'Đang hoạt động'}</td>
	                            <td>${item.count}</td>
	                            <td>
	                                <a href="#">Edit</a> |
	                                <a href="#" class="text-danger">Delete</a>
	                            </td>
                            </tr>
                        </c:forEach> 
                        <!--              
	                        <tr>
	                            <td>1</td>
	                            <td>Sữa rửa mặt</td>
	                            <td>Đang hoạt động</td>
	                            <td>5</td>
	                            <td>
	                                <a href="#">Edit</a> |
	                                <a href="#" class="text-danger">Delete</a>
	                            </td>
	                        </tr> 
                         -->                 
                   </tbody>
               </table>
	       </div>
	   </div>	
	</div>
</div>


