<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmallHall</title>
    <link rel="WebSite icon" type="png" href="/MVC_LUANVAN/Public/Assets/img/LOGO-fix-07.png">
    <link rel="stylesheet" href="/MVC_LuanVan/Public/CSS/base.css">
    <link rel="stylesheet" href="/MVC_LuanVan/Public/CSS/main.css">
    <link rel="stylesheet" href="/MVC_LuanVan/Public/CSS/toggleBtn.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/MVC_LuanVan/Public/fontawesome-free-6.1.1-web/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />


    <!-- phần style của khoa -->

    <!-- Design fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="/MVC_LuanVan/Public/khoa/css/bootstrap.css" rel="stylesheet">

    <!-- FontAwesome Icons core CSS -->
    <link href="/MVC_LuanVan/Public/khoa/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/MVC_LuanVan/Public/khoa/style.css" rel="stylesheet">

    <!-- Responsive styles for this template -->
    <link href="/MVC_LuanVan/Public/khoa/css/responsive.css" rel="stylesheet">

    <!-- Colors for this template -->
    <link href="/MVC_LuanVan/Public/khoa/css/colors.css" rel="stylesheet">

    <!-- Version Tech CSS for this template -->
    <link href="/MVC_LuanVan/Public/khoa/css/version/tech.css" rel="stylesheet">
</head>

<body>
    <div class="wrapper">
        <menu>
            <a href="#" class="action"><img class="img_logo_shoppe"
                    src="/MVC_LuanVan/Public/Assets/img/logo-shopee-764x800.png" alt=""></a>
            <a href="#" class="action"><img class="img_logo_zalo" src="/MVC_LuanVan/Public/Assets/img/logo-zalo.jpg"
                    alt=""></a>
            <a href="https://www.facebook.com/profile.php?id=61551923407887" class="action"><i
                    class="fa-brands fa-facebook" style="color: #0866ff ; font-size: 34px; "></i></a>
            <a href="#" class="action icon_phone"><i class="fa-solid fa-phone-volume"
                    style="color: #ffffff;"></i></i></a>
            <a href="" class="trigger"><i class="fa-solid fa-plus"></i></a>
        </menu>
        <?php require_once "./MVC/Views/pages/blocks/header.php"; ?>
        <main>
            <?php
            require_once "./MVC/Views/pages/main/" . $data["page"] . ".php";
            ?>
        </main>
        <footer class="footer">
            <?php require_once "./MVC/Views/pages/blocks/footer.php"; ?>
        </footer>
    </div>


    <!-- Messenger Chat plugin Code -->
    <div id="fb-root"></div>

    <!-- Your Chat plugin code -->
    <div id="fb-customer-chat" class="fb-customerchat">
    </div>

    <script src="/MVC_LuanVan/Public/khoa/js/jquery.min.js"></script>
    <script src="/MVC_LuanVan/Public/khoa/js/tether.min.js"></script>
    <script src="/MVC_LuanVan/Public/khoa/js/bootstrap.min.js"></script>
    <script src="/MVC_LuanVan/Public/khoa/js/custom.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src='/MVC_LUANVAN/Public/JS/toggleBtn.js'></script>




    <script>
    var chatbox = document.getElementById('fb-customer-chat');
    chatbox.setAttribute("page_id", "143731145486621");
    chatbox.setAttribute("attribution", "biz_inbox");
    </script>

    <!-- Your SDK code -->
    <script>
    window.fbAsyncInit = function() {
        FB.init({
            xfbml: true,
            version: 'v18.0'
        });
    };

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    </script>


</body>


</html>