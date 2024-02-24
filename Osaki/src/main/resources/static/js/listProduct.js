$(document).ready(function () {
    // Sự kiện thay đổi checkbox category hoặc brand
    $('.category-checkbox').change(function () {
        var selectedCategories = [];

        // Lấy danh sách các category được chọn
        $('.category-checkbox:checked').each(function () {
            selectedCategories.push($(this).val());
        });
        $.ajax({
            type: 'GET',
            url: '/product/search-all-category',
            success: function (response) {

                $('.product').each(function () {
                    var productCategory = $(this).find('.category').text();
                    if (selectedCategories.includes(productCategory)) {
                        $(this).parent('.col-lg-3').show(); // Hiển thị sản phẩm
                    } else {
                        $(this).parent('.col-lg-3').hide(); // Ẩn sản phẩm
                    }
                });
                updatePagination();
            },
            error: function (xhr, status, error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Xóa sản phẩm thất bại',
                    text: "Có lỗi xảy ra, vui lòng thử lại !",
                    showConfirmButton: false,
                    timer: 2000
                });
            }
        });
        // Hiển thị hoặc ẩn sản phẩm tùy thuộc vào category được chọn
    });

    function updatePagination() {
        // Ẩn tất cả các nút phân trang
        $('.pagination__item').hide();

        // Hiển thị các nút phân trang cho trang hiện tại
        var currentPage = parseInt('${productPage.number}');
        var totalPages = parseInt('${productPage.totalPages}');
        var maxPagesToShow = 5; // Số lượng nút phân trang tối đa muốn hiển thị
        var startPage = Math.max(0, currentPage - Math.floor(maxPagesToShow / 2));
        var endPage = Math.min(totalPages - 1, startPage + maxPagesToShow - 1);

        for (var i = startPage; i <= endPage; i++) {
            $('.pagination__item').eq(i).show();
        }

        // Hiển thị nút Previous nếu không phải trang đầu tiên
        if (currentPage > 0) {
            $('.pagination__item').first().show();
        }

        // Hiển thị nút Next nếu không phải trang cuối cùng
        if (currentPage < totalPages - 1) {
            $('.pagination__item').last().show();
        }
    }
});
