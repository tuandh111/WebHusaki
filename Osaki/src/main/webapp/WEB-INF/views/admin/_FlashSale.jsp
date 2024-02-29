<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<div class="row mb-3 p-5">
	<div class="d-flex flex-row">
		<h4 class="me-2">Sản phẩm khuyến mãi</h4>
		<a href="/admin/add-or-edit-product-sale"
			class="btn btn-outline-primary">Thêm mới khuyến mãi</a>
	</div>
</div>
<div class="row p-5">


	<div class="col-8 d-flex justify-content-end">
		<!-- <jsp:include page="__navigation-button.jsp" /> -->
		<input class="form-control me-2" value="${totalElements} sản phẩm"
			style="max-width: 15%; background-color: #b7a888;"
			disabled="disabled">
		<c:if test="${not booleanFirst}">
			<a class="btn btn-outline-secondary me-2"
				href="/admin?content=_content-product.jsp&p=0">Đầu</a>
			<a class="btn btn-outline-secondary me-2"
				href="/admin?content=_content-product.jsp&p=${prevPage}">Trước</a>
		</c:if>
		<input class="form-control" name="currentPage" value="${currentPage}"
			style="max-width: 8%; background-color: #b7a888;" disabled="disabled">
		<input class="form-control me-2" value="of ${totalPages}"
			style="max-width: 12%; background-color: #b7a888;"
			disabled="disabled">
		<c:if test="${not booleanLast}">
			<a class="btn btn-outline-secondary me-2"
				href="/admin?content=_content-product.jsp&p=${nextPage}">Tiếp</a>
			<a class="btn btn-outline-secondary me-2"
				href="/admin?content=_content-product.jsp&p=${totalPages}">Cuối</a>
		</c:if>
	</div>


	<div class="table-responsive">
		<table class="table table-hover">

			<thead>
				<tr>
					<th>ID</th>
					<th>Ngày bắt đầu</th>
					<th>Ngày kết thúc</th>
					<th>Trạng thái</th>
					<th></th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="discount" items="${FlashSale}">
					<tr>
						<td>${discount.id}</td>
						<td>
						<fmt:formatDate pattern="dd/MM/yyyy" value="${discount.startDay}"/>
						</td>
						
						
						<td>
						<fmt:formatDate pattern="dd/MM/yyyy" value="${discount.endDay}"/>
						</td>
						<td><c:choose>
							<c:when test="${discount.status}">Ngưng hoạt động</c:when>
							<c:otherwise>Đang hoạt động</c:otherwise>
						</c:choose></td>
						<td>
						<a href="admin/add-or-edit-product/${discount.id }">Sửa</a>|
						<a href="#">Xóa</a>
						</td>
						
					
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
