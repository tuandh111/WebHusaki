$(document).ready(function () {
    console.log("this is remove product")
    $('.removeLikeProduct').click(function (e) {
        e.preventDefault();
        let likeProductID = $(this).data('product-id');
        console.log("likeProduct: "+ likeProductID)
        Swal.fire({
            text: "Bạn có muốn xóa thich sản phẩm đã chọn nay?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Trở lại',
            confirmButtonText: 'Có'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'DELETE',
                    url: '/delete-to-likeProduct',
                    data: {
                        likeID: likeProductID,

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
                                text: "Xoa san pham thanh công !",
                                showConfirmButton: false,
                                timer: 3500
                            });
                            $('.'+likeProductID).remove();
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