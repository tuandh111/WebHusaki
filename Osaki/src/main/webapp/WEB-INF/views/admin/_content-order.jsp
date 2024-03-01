<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/admin/__topbar.jsp" %>

<div class="row mb-4 p-3 order-manager-title">
    <h2 class="text-center">Quản lý đơn hàng</h2>
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
                           <td><img src="../imagesProduct/${item.imageProduct}" class="img-thumbnail" title="Ảnh sản phẩm"
                                     style="width: 50px;height: 50px">
                            </td>
                            <td>${item.nameProduct}</td> 
                            <td>${item.nameCustomer}</td>
                            <td style="max-width: 200px;">${item.addressCustomer}</td>
                            <td>${item.phoneCustomer}</td>                           
                            <td>
                                 <fmt:formatNumber value="${item.totalAmount}" pattern="#,###.00 vnd"></fmt:formatNumber>                           
                            </td>                                                       
                            <td style="max-width: 150px;">                    
                                    <input type="hidden" name="invoiceId" value="${item.invoiceID}">
                                    <select name="selectedValue" class="form-select order-select-form <c:if test="${item.status eq 'Đặt hàng'}">text-primary</c:if>
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
                            </td>                             
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>           
        </div>
    </div>
</div>

