<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row mb-4 p-5">
    <h2>Quản lý danh mục</h2>
</div>

<div class="row p-5">

    <div class="col-4 custom-add-new-category">
        <!--  <button class="btn btn-primary mb-3" data-bs-toggle="collapse" 
        data-bs-target="#collapseWidthAddCategory" aria-expanded="false" 
        aria-controls="collapseWidthAddCategory">Thêm danh mục</button> -->
        <div class="add-category">
            <form:form action="/admin/add-category" modelAttribute="category" id="add-category-form" method="post">
                <form:label path="categoryName">Tên danh mục</form:label>
                <form:input path="categoryName" class="form-control"/>                            
                <br>
                <br>
                <form:checkbox path="isDelete"/>
                <form:label path="isDelete">Kich hoạt ?</form:label>
                <br>
                <br>
                <form:button class="btn btn-outline-primary add-new-category">Thêm mới Danh mục</form:button>
            </form:form>
        </div>

    </div>
    <div class="col-8">
        <div class="row justify-content-end">
            <div class="col-8 mb-3">
                <form action="/admin/category-search" method="get">
                    <div class="d-flex flex-row justify-content-end">
                        <input class="form-control me-2" name="kwSearch" value="${keywords}" style="max-width: 60%;">
                        <button class="btn btn-outline-primary" style="max-width: 40%;">Tìm tên danh mục</button>
                    </div>
                </form>
            </div>
            <div class="col-8 d-flex justify-content-end">
                <!-- <jsp:include page="__navigation-button.jsp" /> -->
                <input class="form-control me-2" value="${totalElements} danh mục"
                       style="max-width: 25%;background-color: #b7a888;" disabled="disabled">
                <c:if test="${not booleanFirst}">
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-category.jsp&p=0">Đầu</a>
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-category.jsp&p=${prevPage}">Trước</a>
                </c:if>
                <input class="form-control" name="currentPage" value="${currentPage}"
                       style="max-width: 9%;background-color: #b7a888;" disabled="disabled">
                <input class="form-control me-2" value="of ${totalPages}"
                       style="max-width: 11%; background-color: #b7a888;" disabled="disabled">
                <c:if test="${not booleanLast}">
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-category.jsp&p=${nextPage}">Tiếp</a><a
                        class="btn btn-outline-secondary me-2"
                        href="/admin?content=_content-category.jsp&p=${totalPages}">Cuối</a>
                </c:if>
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
                                <a href="#" class="edit-category" data-bs-toggle="modal"
                                   data-bs-target="#editCategoryModal"
                                   data-info='{"id": "${item.id}", "name": "${item.name}", "isDelete": "${item.isDelete}"}'>Sửa</a>
                                |
                               <!--   <a href="/admin/delete-category/${item.id}" class="text-danger"
                                   style="${item.isDelete ? 'display: none;' : ''}">Xóa</a>  -->
                                <a href="/admin/delete-category" data-delete-id="${item.id}" class="text-danger delete-category"
                                   style="${item.isDelete ? 'display: none;' : ''}">Xóa</a>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editCategoryModalLabel">Cập nhật danh mục</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/admin/edit-category" method="post">
                <div class="modal-body">
                    <input type="hidden" class="form-control" name="categoryID" id="editCategoryId">
                    <label>Category Name</label>
                    <input class="form-control" name="categoryName" id="editCategoryName">
                    <br>
                    <input type="checkbox" name="isDelete" id="editIsDelete">
                    <label>Active ?</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button class="btn btn-primary">Cập nhật Danh mục</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const editLinks = document.querySelectorAll('.edit-category');

        editLinks.forEach(function (link) {
            link.addEventListener('click', function () {
                const infoString = this.getAttribute('data-info');
                const info = JSON.parse(infoString);

                document.getElementById('editCategoryId').value = info.id;
                document.getElementById('editCategoryName').value = info.name;
                console.log("info.isDelete==true", info.isDelete == "true");
                if (info.isDelete == "true") {
                    document.getElementById('editIsDelete').checked = false;
                } else {
                    document.getElementById('editIsDelete').checked = true;
                }            
            });
        });
    });
</script>