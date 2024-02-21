<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<!-- https://cocoshop.vn/ -->
<!-- http://mauweb.monamedia.net/vanihome/ -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán</title>
    <!-- Font roboto -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
    <!-- Icon fontanwesome -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <!-- Reset css & grid sytem -->
    <link rel="stylesheet" href="/css/library.css">
    <!-- Owl Slider css -->
    <link rel="stylesheet" href="/owlCarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/owlCarousel/assets/owl.theme.default.min.css">
    <!-- Layout -->
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <!-- index -->
    <link rel="stylesheet" type="text/css" href="/css/contact.css">
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Owl caroucel Js-->
    <script src="/owlCarousel/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.16/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.16/dist/sweetalert2.all.min.js"></script>
</head>

<body>
<div class="header scrolling" id="myHeader">
    <jsp:include page="./component/_grid.jsp"/>
    <%--menu --%>
    <jsp:include page="./component/_header.jsp"/>
</div>
<div class="main">
    <div class="grid wide">
        <div class="main__breadcrumb">
            <div class="breadcrumb__item">
                <a href="#" class="breadcrumb__link">Trang chủ</a>
            </div>
            <div class="breadcrumb__item">
                <a href="#" class="breadcrumb__link">Giới thiệu</a>
            </div>
        </div>
        <div class="row">
            <div class="col l-6 m-12 s-12">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d245.58876575623975!2d105.75811332762875!3d9.982101591977752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a08906415c355f%3A0x416815a99ebd841e!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEZQVCBQb2x5dGVjaG5pYw!5e0!3m2!1svi!2s!4v1708336160466!5m2!1svi!2s"
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="col l-6 m-12 s-12">
                <div class="contact__wrap">
                    <div class="contact__img">
                        <img src="http://mauweb.monamedia.net/vanihome/wp-content/uploads/2018/04/logo-mona.png"
                             alt="">
                    </div>
                    <ul class="contact__info">
                        <li class="contact__text">
                            <i class="fas fa-map-marked-alt"></i> Ap khanh hoi, Thi tran nga 6, Huyen Chau Thanh, Tinh
                                                                  Hau Giang
                        </li>
                        <li>
                            <a href="tel:0383 658 814" class="contact__link">
                                <i class="fas fa-phone"></i> 0383 658 814
                            </a>
                            <a href="tel:076 922 0162" class="contact__link">
                                &#8212; 0383 658 814
                            </a>
                        </li>

                        <li>
                            <a href="#" class="contact__link">
                                <i class="fas fa-envelope"></i> tuandhpc05076@fpt.edu.vn
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="about-us">
                    <div class="about-us__heading">Liên hệ với chúng tôi</div>
                    <div class="form__group">
                        <div>
                            <input type="text" id="fullname" value="${userLogin.fullName}">
                        </div>
                        <div>
                            <input type="email" id="email" value="${userLogin.email}">
                        </div>
                    </div>
                    <textarea name="" id="message" cols="30" rows="5" placeholder="Lời nhắn"></textarea>
                    <button class="btn btn--default" id="sendMessage"
                            data-user-id="${userLogin.userID}">Gửi
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <jsp:include page="./component/_footer.jsp"/>
</div>
<div class="up-top" id="upTop" onclick="goToTop()">
    <i class="fas fa-chevron-up"></i>
</div>
<!-- Modal Form -->
<!-- Sccipt for owl caroucel -->

<!-- Script common -->
<script src="/js/commonscript.js"></script>
<script src="/js/contact.js"></script>
<script src="/js/cartCript.js"></script>
<script src="/js/checkout.js"></script>
</body>

</html>