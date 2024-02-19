$(document).ready(function () {

    $('#sendMessage').click(function (e) {
        e.preventDefault();
        let fullName =$('#fullname').val();
        let email = $('#email').val();
        let message = $('#message').val();
        let isLoggedIn = $(this).data('user-id') !== '';
        let userID = $(this).data('user-id')
        console.log(isLoggedIn)
        if (!isLoggedIn) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Bạn cần đăng nhập để thuc hien chuc nang nay!',
                confirmButtonColor: '#dc3545',
                confirmButtonText: 'Đăng nhập'
            }).then((result) => {
                if (result.isConfirmed) {
                    localStorage.removeItem('returnUrl');
                    localStorage.setItem('returnUrl', window.location.href);
                    window.location.href = '/login';
                }
            });
        } else {
            $.ajax({
                type: "POST",
                url: "/post-contact",
                data: {
                    fullName: fullName,
                    email: email,
                    userID: userID,
                    message: message
                },
                success: function (response) {
                    Swal.fire({
                        title: 'Thanh cong', text: "Gui email thanh cong", showConfirmButton: true, timer: 3500
                    })
                },
                error: function (error) {
                    // Handle the error response here
                    Swal.fire({
                        icon: 'error', title: 'Lỗi', text: "Co loi xay ra", showConfirmButton: true, timer: 3500
                    }).then(function () {
                        // Redirect to the home page
                        window.location.href = '/'; // Change '/home' to the actual URL of your home page
                    });
                }
            });
        }
    })
})