<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/MVC_LuanVan/Public/CSS/loading.css">
    <link rel="stylesheet" href="/MVC_LuanVan/Public/CSS/loginRegister.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
        integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
        crossorigin="anonymous" />
    <title>SmallHall</title>
    <link rel="WebSite icon" type="png" href="/MVC_LUANVAN/Public/Assets/img/LOGO-fix-07.png">
</head>

<body>

    <div class="container_loading">
        <div class="loading">
            <div class="📦"></div>
            <div class="📦"></div>
            <div class="📦"></div>
            <div class="📦"></div>
            <div class="📦"></div>
        </div>
    </div>
    <!-- Form without bootstrap -->
    <div class="auth-wrapper">
        <div class="auth-container">
            <div class="auth-action-left">
                <div class="auth-form-outer">
                    <h2 class="auth-form-title">
                        Tạo tài khoản
                    </h2>
                    <div class="auth-external-container">
                        <div class="auth-external-list">
                            <ul>
                                <li><a href="#"><i class="fa fa-google"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                        <p class="auth-sgt">hoặc sử dụng email của bạn để đăng ký:</p>
                        <p style="color : red ; ">
                            <?php
                            if(isset($_COOKIE['error'])) {
                                $cookieValue = $_COOKIE['error'];
                                if($cookieValue === "AccountConsist" ) {
                                    echo "*Email Đã Được Sử Dụng";
                                }elseif($cookieValue === "errorSystem") {
                                    echo "*Lỗi Hệ Thống ,chúng tôi sẽ khắc phụ sự cố sớm nhất có thể !!!";
                                }elseif($cookieValue === "ConfirmPasswordError") {
                                    echo "*Mật Khẩu Xác Nhận Không Trùng Khớp";
                                }
                            }?>
                        </p>
                    </div>
                    <form class="login-form" name="form_register" action="/MVC_LUANVAN/Register" method="POST">
                        <input type="text" name="Name" class="auth-form-input" placeholder="Name" require="true">
                        <input type="email" name="Email" class="auth-form-input" placeholder="Email" require="true">
                        <div class="input-icon">
                            <input type="password" name="password" class="auth-form-input" placeholder="Password"
                                require="true">
                            <i class="fa fa-eye show-password"></i>
                        </div>
                        <input type="password" name="ConfirmPassword" class="auth-form-input"
                            placeholder="Confirm Password" require="true">
                        <label class="btn active">
                            <input type="checkbox" name='email1' checked>
                            <i class="fa fa-square-o"></i><i class="fa fa-check-square-o"></i>
                            <span> tôi đồng ý với <a href="#">Điều kiện</a> và <a href="#">Chính sách bảo
                                    mật</a>.</span>
                        </label>
                        <div class="footer-action">
                            <input type="submit" name="submit" value="Đăng ký" class="auth-submit">
                            <a href="/MVC_LuanVan/Login" class="auth-btn-direct">Đăng nhập</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="auth-action-right">
                <div class="auth-image">
                    <a href="/MVC_LUANVAN/">
                        <img src="/MVC_LUANVAN/Public/Assets/img/LOGO-fix-07.png" alt="login">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script src="/MVC_LUANVAN/Public/JS/loginRegister.js"></script>
    <script src='/MVC_LUANVAN/Public/JS/loading.js'></script>
</body>

</html>