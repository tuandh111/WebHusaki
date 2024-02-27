$(document).ready(function () {
    console.log("this is remove product")
    $('.cancelCart').click(function (e) {
        e.preventDefault();
        let invoiceID = $(this).data('invoice-id');
        Swal.fire({
            text: "Bạn có muốn hủy đơn hàng đã chọn này?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Trở lại',
            confirmButtonText: 'Có'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'POST',
                    url: '/update-cart-product',
                    data: {
                        invoiceID: invoiceID,

                    },
                    success: function (response) {
                        if (response == 'fail') {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Something wrong !',
                                showConfirmButton: true
                            });
                        } else {

                            Swal.fire({
                                icon: 'success',
                                title: 'Thành công',
                                text: "Cập nhật đơn hàng thành công !",
                                showConfirmButton: false,
                                timer: 3500
                            });
                            $('.' + invoiceID).remove();
                        }
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
            }
        })
    })

    $('.RestoreCart').click(function (e) {
        e.preventDefault();
        let invoiceID = $(this).data('invoice-id');

        Swal.fire({
            text: "Bạn có muốn khôi phục đơn hàng đã chọn này?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Trở lại',
            confirmButtonText: 'Có'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'POST',
                    url: '/update-cart-product-restore',
                    data: {
                        invoiceID: invoiceID
                    },
                    success: function (response) {
                        if (response == 'fail') {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Đã có lỗi xảy ra!',
                                showConfirmButton: true
                            });
                        } else {

                            Swal.fire({
                                icon: 'success',
                                title: 'Thành công',
                                text: "Cập nhật đơn hàng thành công!",
                                showConfirmButton: false,
                                timer: 3500
                            });
                            $('.' + invoiceID).remove();
                        }
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
            }
        })
    })
})