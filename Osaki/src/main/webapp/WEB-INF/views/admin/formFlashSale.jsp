<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<c:set var="action" value="${param.action}" />

<div class="container mt-5">
	<h3>${action=='add' ? 'Thêm' : 'Sửa'}sản phẩm</h3>
	<form method="post">
		<div class="row">
		
			<div class="col-md-6">
			
			<div class="mb-3">
					<label for="productName" class="form-label">Ngày bắt đầu</label> 
						<input type="date" class="form-control"
						id="productName" value="" name="startDay"
						placeholder="Ngày bắt đầu">
				</div>
				
				<div class="mb-3">
					<label for="productName" class="form-label">Ngày kết thúc</label> 
						<input type="date" class="form-control"
						id="productName" value="" name="endDay"
						placeholder="Ngày kết thúc">
				</div>
			
			</div>
			
		</div>

		<div class="d-flex justify-content-start">
			<button type="submit" class="btn btn-primary me-2">Lưu</button>
		</div>
	</form>
</div>
