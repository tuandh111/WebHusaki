$(document).ready(function () {
    console.log("this is login")
    $("#loginForm").submit(function (e) {
        e.preventDefault();

        var LGEmail = $("#LGemail").val();
        var LGPassword = $("#LGPassword").val();
        var chkRemember = $("#chkRemember").prop("checked");
        var formData = new FormData(this);
        formData.append("LGemail", LGEmail);
        formData.append("LGPassword", LGPassword);
        formData.append("chkRemember", chkRemember);

        $.ajax({
            type: "POST",
            url: "/login",
            processData: false,
            contentType: false,
            data: formData,
            success: function (response) {
                // Handle the success response here
                console.log(response);
                if (response.message === "success") {
                    Swal.fire({
                        title: 'Thanh cong', text: "Dang nhap thanh cong", showConfirmButton: true, timer: 3500
                    }).then(function () {
                        // Redirect to the home page
                        var returnUrl = localStorage.getItem('returnUrl');
                        if (returnUrl) {
                            window.location.href = returnUrl;
                        } else {
                            window.location.href = '/'; // Change '/home' to the actual URL of your home page
                        } // Change '/home' to the actual URL of your home page
                    });
                    // Redirect or perform actions for successful login
                    console.log("Login successful");
                } else if (response.message === 'Chua nhap email' || response.message === 'Chua nhap password') {
                    console.log('error email')
                    if (response.message === 'Chua nhap email') {
                        showValidationErrorsEmail(response.message)
                    }
                    if (response.message === 'Chua nhap password') {
                        showValidationErrorsPassword(response.message)
                    }
                } else {
                    // Handle unsuccessful login
                    Swal.fire({
                        icon: 'error', title: 'Lỗi', text: "Dang khong thanh cong", showConfirmButton: true, timer: 3500
                    }).then(function () {
                        // Redirect to the home page
                        window.location.href = '/login'; // Change '/home' to the actual URL of your home page
                    });
                    console.log("Login failed");
                }
            },
            error: function (error) {
                // Handle the error response here
                Swal.fire({
                    icon: 'error', title: 'Lỗi', text: "Co loi xay ra", showConfirmButton: true, timer: 3500
                }).then(function () {
                    // Redirect to the home page
                    window.location.href = '/login'; // Change '/home' to the actual URL of your home page
                });
            }
        });
    });
});

function showValidationErrorsEmail(errors) {
    // Clear previous error messages
    $('#emailLGError').html('');
    $('#passLGError').html('');
    // Display new error messages
    $('#emailLGError').html(errors);

}

function showValidationErrorsPassword(errors) {
    // Clear previous error messages
    $('#passLGError').html('');
    $('#emailLGError').html('');
    $('#passLGError').html(errors);
}
