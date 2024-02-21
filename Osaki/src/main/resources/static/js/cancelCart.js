$(document).ready(function () {
    console.log("this is remove product")
    $('.cancelCart').click(function (e) {
        e.preventDefault();
        let invoiceID = $(this).data('invoice-id');
        Swal.fire({
            text: "Bạn có muốn huy đơn hang đã chọn nay?",
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
                                title: 'Thanh cong',
                                text: "Cap nhat don hang thanh công !",
                                showConfirmButton: false,
                                timer: 3500
                            });
                            $('.' + invoiceID).remove();
                        }
                    },
                    error: function (xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Xoa san pham thất bại',
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
            text: "Bạn có muốn khoi phuc don hang đã chọn nay?",
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
                                title: 'Something wrong !',
                                showConfirmButton: true
                            });
                        } else {

                            Swal.fire({
                                icon: 'success',
                                title: 'Thanh cong',
                                text: "Cap nhat don hang thanh công !",
                                showConfirmButton: false,
                                timer: 3500
                            });
                            $('.' + invoiceID).remove();
                        }
                    },
                    error: function (xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Xoa san pham thất bại',
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