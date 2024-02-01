<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<div class="row mb-4">
	<h2>Categories</h2>
</div>

<div class="row">
	<div class="col-4">
		<h5>Add New Category</h5>
		<form action="">
		  <label>Name</label>
		  <input class="form-control" name="categoryName">
		  <br>
		  <input type="checkbox" checked="checked">
		  <label>Active ?</label>
		  <br>
		  <button class="btn btn-outline-primary mt-4">Add New Category</button>
		</form>
	</div>
	<div class="col-8">
	   <div class="row justify-content-end">
	       <div class="col-8 mb-3">
	           <form action="" method="get">
	            <div class="d-flex flex-row justify-content-end">
	                <input class="form-control me-2" name="search" style="max-width: 60%;">
	                <button class="btn btn-outline-primary" style="max-width: 40%;">Search Categories</button>
	            </div>
             </form>
	       </div>
	       <div class="col-8 d-flex justify-content-end">
	           <jsp:include page="__navigation-button.jsp" />              
           </div>	         
	   </div>
	   <div class="row">
	       <div class="table-responsive">
	           <table class="table table-hover">
                   <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category Name</th>
                            <th>Active</th>
                            <th>Count</th>
                            <th></th> 
                        </tr>
                   </thead>
                   <tbody>   
                        <!-- Vòng lặp c:forEach -->                
                        <tr>
                            <td>1</td>
                            <td>Sữa rửa mặt</td>
                            <td>Đang hoạt động</td>
                            <td>5</td>
                            <td>
                                <a href="#" class="stretched-link">Edit</a> |
                                <a href="#" class="stretched-link text-danger">Delete</a>
                            </td>
                        </tr>                  
                   </tbody>
               </table>
	       </div>
	   </div>	
	</div>
</div>


