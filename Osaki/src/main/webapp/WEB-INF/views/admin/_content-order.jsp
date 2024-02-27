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
                               <form action="/admin/update-status-order" method="post" id="orderForm">
                                    <input type="hidden" name="invoiceId" value="${item.invoiceID}">
                                    <select name="selectedValue" onchange="this.form.submit()" class="form-select order-select-form <c:if test="${item.status eq 'Đặt hàng'}">text-primary</c:if>
                                    <c:if test="${item.status eq 'Thành công'}">text-success</c:if>
                                    <c:if test="${item.status eq 'Đã hủy'}">text-danger</c:if>"> 
                                        <c:choose>
                                            <c:when test="${item.status eq 'Thành công'}">
                                                <option value="Thành công" <c:if test="${item.status eq 'Thành công'}">selected</c:if>>Thành công</option>
                                            </c:when>
                                            <c:when test="${item.status eq 'Đã hủy'}">
                                               <option value="Đã hủy" <c:if test="${item.status eq 'Đã hủy'}">selected</c:if>>Đã hủy</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="Đặt hàng" <c:if test="${item.status eq 'Đặt hàng'}">selected</c:if>>Đặt hàng</option>
		                                        <option value="Thành công" <c:if test="${item.status eq 'Thành công'}">selected</c:if>>Thành công</option>
		                                        <option value="Đã hủy" <c:if test="${item.status eq 'Đã hủy'}">selected</c:if>>Đã hủy</option>
                                            </c:otherwise>                                        
                                        </c:choose>                                                                                                        
                                    </select>  
                               </form>                                                                                                                                               
                            </td> 
                            
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="cancel-order">
                <a data-bs-toggle="modal"
                   data-bs-target="#listOrderCancelModal" href="#">Xem đơn hàng đã hủy >></a>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="listOrderCancelModal" tabindex="-1" aria-labelledby="listOrderCancelModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="listOrderCancelModalLabel">Danh sách đơn hàng đã hủy</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
