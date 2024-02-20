<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="comment" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Oder -->
<div class="details">
    <div class="recentOrders">
        <div class="cardHeader d-flex flex-row justify-content-between">
            <h2>Cart cancel</h2>

        </div>
        <table class="table table-hover table-custom">
            <thead>
            <tr>
                <th>STT</th>
                <th>SDT</th>
                <th>Dia chi</th>
                <th>Trang thai</th>
            </tr>
            </thead>
            <tbody id="tbAddress">

            </tbody>
        </table>
    </div>
    <div class="recentCustomer">
        <div class="cardHeader">
            <h2>Tài khoản</h2>
        </div>

        <table class="table table-hover table-custom">
            <tr>
                <td width="60px">
                    <div class="img-thumbnail imgBox">
                        <img src="/images/author-item.jpg">
                    </div>
                </td>
                <td>
                    <h4>
                        Trung nguyễn
                        <br>
                        <span>An Giang</span>
                    </h4>
                </td>
            </tr>
        </table>
    </div>
</div>

<!-- Chart -->