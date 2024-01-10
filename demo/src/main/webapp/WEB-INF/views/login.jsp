<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="css/login.css"/>
</head>
<body>
<div class="login-background">
                <div class="login-container">
                    <div class="login-contain row">
                        <div class="col-12 text-login">Login</div>
                        <div class="col-12 form-group login-input">
                            <label>Username: </label>
                            <input type="text" class="form-control" placeholder="Enter your Username" />
                        </div>
                        <div class="col-12 form-group login-input">
                            <label>Password: </label>
                            <div class="custom-input-password">
                                <input class="form-control" type="password" placeholder="Enter your Password" />
                               
                            </div>
                        </div>
                        <div class="col-12">
                            
                        </div>
                        <div class="col-12 form-group">
                            <button class="btn-login">Login</button>
                        </div>
                        <div class="col-12 form-group">
                            <span class="text-forgot-password">Forgot your password?</span>
                        </div>
                        <div class="col-12 text-center mt-3">
                            <span class="text-other-login" >Or Login with: </span>
                        </div>
                        <div class="col-12 social-login">
                        	<i class="bi bi-google google"></i>
                           <i class="bi bi-facebook facebook"></i>
                        </div>
                    </div>
                </div>
            </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>            
</body>
</html>