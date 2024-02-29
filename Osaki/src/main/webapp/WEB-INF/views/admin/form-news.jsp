<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<c:set var="action" value="${param.action}" />

<div class="container mt-5">
	<h3>Bản tin</h3>
	<form method="post" action="/admin/add-product-sale">
		<div class="row">

			<div class="col-md-6">
				<div class="mb-3">
					<label for="startDay" class="form-label">Ngày tạo</label> <input
						type="text" class="form-control" id="startDay" name="startDay"
						value="" placeholder="Ngày tạo">
				</div>

				<div class="mb-3">
					<label for="startDay" class="form-label">Tiêu đề</label> <input
						type="text" class="form-control" id="startDay" name="startDay"
						value="" placeholder="Tiêu đề">
				</div>

				<div class="mb-3">
					<label for="startDay" class="form-label">Nội dung</label> <input
						type="text" class="form-control" id="startDay" name="startDay"
						value="" placeholder="Nội dung">
				</div>

				<div class="mb-3">
					<label for="startDay" class="form-label">Hình ảnh</label> <input
						type="file" class="form-control" id="startDay" name="startDay"
						value="" placeholder="Hình ảnh">
				</div>


			</div>


		</div>

		<div class="d-flex justify-content-start">
			<button type="submit" class="btn btn-primary me-2">Lưu</button>
		</div>
	</form>
</div>
