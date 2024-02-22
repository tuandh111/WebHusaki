<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<c:set var="action" value="${param.action}" />

<div class="container mt-5">
	<h3>${action=='add' ? 'Thêm' : 'Sửa'} sản phẩm</h3>
	<form method="post" action="/admin/add-product"
		enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-6">
				<div class="mb-3">
					<label for="productName" class="form-label">Tên sản phẩm</label> <input
						type="text" class="form-control" id="productName"
						name="productName" placeholder="Tên sản phẩm">
				</div>
				<div class="mb-3">
					<label for="price" class="form-label">Giá</label> <input
						type="number" class="form-control" id="price" name="price"
						placeholder="Giá">
				</div>
				<div class="mb-3">
					<label for="quantity" class="form-label">Số lượng trong kho</label>
					<input type="number" class="form-control" min="0" id="quantity"
						name="quantity" placeholder="Số lượng">
				</div>
				<div class="mb-3">
					<label for="uses" class="form-label">Cách sử dụng</label> <input
						type="text" class="form-control" id="uses" name="uses"
						placeholder="Cách sử dụng">
				</div>
				<div class="mb-3">
					<label for="preserve" class="form-label">Cách bảo quản</label> <input
						type="text" class="form-control" id="preserve" name="preserve"
						placeholder="Cách bảo quản">
				</div>
				<div class="mb-3">
					<label for="skinType" class="form-label">Loại da</label> <input
						type="text" class="form-control" id="skinType" name="skinType"
						placeholder="Loại da">
				</div>
				<div class="mb-3">
					<label for="certification" class="form-label">Chứng nhận</label> <input
						type="text" class="form-control" id="certification"
						name="certification" placeholder="Chứng nhận">
				</div>
			</div>
			<div class="col-md-6">
				<div class="mb-3">
					<label for="dateOfManufacture" class="form-label">Ngày sản
						xuất</label> <input type="text" class="form-control"
						id="dateOfManufacture" name="dateOfManufacture">
				</div>
				<div class="mb-3">
					<label for="expiry" class="form-label">Hạn sử dụng</label> <input
						type="text" class="form-control" id="expiry" name="expiry"
						placeholder="Hạn sử dụng">
				</div>
				<div class="mb-3">
					<label for="manufacturer" class="form-label">Nhà sản xuất</label> <input
						type="text" class="form-control" id="manufacturer"
						name="manufacturer" placeholder="Nhà sản xuất">
				</div>
				<div class="mb-3">
					<label for="ingredient" class="form-label">Thành phần</label> <input
						type="text" class="form-control" id="ingredient" name="ingredient"
						placeholder="Thành phần">
				</div>
				<div class="mb-3">
					<label for="description" class="form-label">Mô tả</label>
					<textarea class="form-control" id="description" name="description"
						placeholder="Mô tả" rows="4"></textarea>
				</div>

				<div class="mb-3">
                    <label for="categoryID" class="form-label">Danh mục sản phẩm</label>
                    <select class="form-select" id="categoryID" name="categoryID">
                        <option value="">Chọn danh mục</option>
                   
                        <c:forEach var="category" items="${cateList}">
                            <option value="${category.categoryID}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
				<div class="mb-3">
					<label for="image" class="form-label">Hình ảnh</label> <input
						type="file" class="form-control" id="image" name="image"
						placeholder="Hình ảnh">
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-end">
			<button type="submit" class="btn btn-primary me-2">${action=='add' ? 'Thêm' : 'Sửa'}</button>
		</div>
	</form>
</div>
