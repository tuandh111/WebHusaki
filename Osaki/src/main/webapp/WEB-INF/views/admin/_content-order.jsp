<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="/WEB-INF/views/admin/__topbar.jsp" %>

<div class="row mb-4 p-3">
    <h2>Quản lý đơn hàng</h2>
</div>

<div class="row p-5">
    <div class="col-12">
        <div class="row justify-content-end">
            <div class="col-8 mb-3">
                <form action="/admin/order-search" method="get">
                    <div class="d-flex flex-row justify-content-end">
                        <input class="form-control me-2" placeholder="Tên sản phẩm..." name="kwSearch"
                               value="${keywords}" style="max-width: 40%;">
                        <button class="btn btn-outline-primary" style="max-width: 40%;">Tìm kiếm</button>
                    </div>
                </form>
            </div>
            <div class="col-8 d-flex justify-content-end">
             <!--     <input class="form-control me-2" value="${totalElements} tài khoản"
                       style="max-width: 15%;background-color: #b7a888;" disabled="disabled">
                <c:if test="${not booleanFirst}">
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-account.jsp&p=0">Đầu</a>
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-account.jsp&p=${prevPage}">Trước</a>
                </c:if>
                <input class="form-control" name="currentPage" value="${currentPage}"
                       style="max-width: 8%;background-color: #b7a888;" disabled="disabled">
                <input class="form-control me-2" value="of ${totalPages}"
                       style="max-width: 12%; background-color: #b7a888;" disabled="disabled">
                <c:if test="${not booleanLast}">
                    <a class="btn btn-outline-secondary me-2" href="/admin?content=_content-account.jsp&p=${nextPage}">Tiếp</a>
                    <a class="btn btn-outline-secondary me-2"
                       href="/admin?content=_content-account.jsp&p=${totalPages}">Cuối</a>
                </c:if> -->
                <%@ include file="/WEB-INF/views/admin/__navigation-button.jsp" %>
            </div>
        </div>
        <div class="row">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Ảnh sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Khách hàng</th>
                        <th>Địa chỉ</th>
                        <th>Số điện thoại</th>
                        
                        <th>Giá trị</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${orders}">
                        <tr>
                            <td>${item.invoiceID}</td>
                            <td><img src="/uploadProduct/${item.imageProduct}" class="img-thumbnail" title="Ảnh sản phẩm"
                                     style="width: 50px;height: 50px">
                            </td>
                            <td>${item.nameProduct}</td>
                            <td>${item.nameCustomer}</td>
                            <td style="max-width: 200px;">${item.addressCustomer}</td>
                            <td>${item.phoneCustomer}</td>
                            
                            <td>${item.totalAmount}</td>
                            <td style="max-width: 150px;">                           
                                <select class="form-select order-select-form">								    
								    <option value="Đặt hàng" <c:if test="${item.status eq 'Đặt hàng'}">selected</c:if>>Đặt hàng</option>
								    <option value="Thành công" <c:if test="${item.status eq 'Thành công'}">selected</c:if>>Thành công</option>
								    <option value="Đã hủy" <c:if test="${item.status eq 'Đã hủy'}">selected</c:if>>Đã hủy</option>								
								</select>                            
                            </td>
                            

                            <td>
                                
                                <a href="#" data-user-id="${item.invoiceID}">Chi tiết</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

