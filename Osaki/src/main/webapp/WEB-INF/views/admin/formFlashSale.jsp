<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<c:set var="action" value="${param.action}" />

<div class="container mt-5">
	<h3>Sản phẩm khuyến mãi</h3>
	<form method="post" action="/admin/add-product-sale">
		<div class="row">
		
			<div class="col-md-6">
    <div class="mb-3">
        <label for="startDay" class="form-label">Ngày bắt đầu ${sale.startDay}</label> 
        <input type="date" class="form-control" id="startDay" name="startDay" value="${sale.startDay}" placeholder="Ngày bắt đầu">
    </div>
    <div class="mb-3">
        <label for="endDay" class="form-label">Ngày kết thúc</label> 
        <input type="date" class="form-control" id="endDay" name="endDay" value="${sale.endDay}" placeholder="Ngày kết thúc">
    </div>
    <div class="mb-3">
        <label class="form-label">Trạng thái</label><br>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="status" id="active" value="true">
            <label class="form-check-label" for="active">Hoạt động</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="status" id="inactive" value="false">
            <label class="form-check-label" for="inactive">Không hoạt động</label>
        </div>
    </div>
</div>

			
		</div>

		<div class="d-flex justify-content-start">
			<button type="submit" class="btn btn-primary me-2">Lưu</button>
		</div>
	</form>
</div>
