<%--
  Created by IntelliJ IDEA.
  User: Hoang Tuan
  Date: 1/30/2024
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="grid wide">
    <div class="row">
        <div class="col l-3 m-6 s-12">
            <h3 class="footer__title">Danh muc</h3>
            <ul class="footer__list">
                <c:forEach var="c" items="${listCategories}" varStatus="i">
                    <c:if test="${i.index<5}">
                        <li class="footer__item">
                            <a href="/product/search-category/${c.categoryID}" class="footer__link">${c.categoryName}</a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="col l-3 m-6 s-12">
            <h3 class="footer__title">Thương hiệu</h3>
            <ul class="footer__list">
                <c:forEach var="listBrands" items="${listBrands}" varStatus="i">
                    <c:if test="${i.index<5}">
                        <li class="footer__item">
                            <a href="/product/search-brand/${listBrands.brandID}" class="footer__link">${listBrands.brandName}</a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="col l-3 m-6 s-12">
            <h3 class="footer__title">Liên hệ</h3>
            <ul class="footer__list">
                <li class="footer__item">
                            <span class="footer__text">
                                    <i class="fas fa-map-marked-alt"></i> Thị trấn Ngã Sáu, Huyện Châu Thành, Tỉnh Hậu Giang
                                </span>
                </li>
                <li class="footer__item">
                    <a href="#" class="footer__link">
                        <i class="fas fa-phone"></i> 0383 658 814
                    </a>
                </li>
                <li class="footer__item">
                    <a href="#" class="footer__link">
                        <i class="fas fa-envelope"></i> hoangtuan97531@gmail.com
                    </a>
                </li>
                <li class="footer__item">
                    <div class="social-group">
                        <a href="#" class="social-item"><i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-item"><i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-item"><i class="fab fa-pinterest-p"></i>
                        </a>
                        <a href="#" class="social-item"><i class="fab fa-invision"></i>
                        </a>
                        <a href="#" class="social-item"><i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col l-3 m-6 s-12">
            <h3 class="footer__title">Đăng kí</h3>
            <ul class="footer__list">
                <li class="footer__item">
                    <span class="footer__text">Đăng ký để nhận được được thông tin ưu đãi mới nhất từ chúng tôi.</span>
                </li>
                <li class="footer__item">
                    <div class="send-email">
                        <input class="send-email__input" type="email" placeholder="Nhập Email...">
                        <a href="#" class="send-email__link">
                            <i class="fas fa-paper-plane"></i>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="copyright">
    <span class="footer__text"> &copy Bản quyền thuộc về <a class="footer__link" href="#">Dang Hoang Tuan</a></span>
</div>