<?php
if(!isset($_SESSION['accountTMP'])) {
    ?>
<script src='/MVC_LUANVAN/Public/JS/CheckQuantityCart.js'></script>
<?php

}else{
    ?>
<script src="/MVC_LuanVan/Public/JS/get-quanlity-InCart.js"></script>
<?php
}
?>
<header class="header">
    <div class="grid wide">
        <nav class="header__navbar grid wide row">
            <div class="header__navbar-list">
                <span class="header__navbar-item">
                    <i class="fas fa-phone-alt"></i>
                    <a href="tel:0967311513">HotLine: 0967311513</a>
                </span>
            </div>
            <ul class="header__navbar-list">
                <li class="header__navbar-item">
                    <a href="#" class="header__navbar-item-link">
                        <i class="far fa-question-circle"></i>
                        Trợ giúp
                    </a>
                </li>
                <?php
                if(isset($_SESSION['accountTMP'])) {
                    $name = $_SESSION['accountTMP'][2];
                    ?>
                <li class="header__navbar-item">
                    <p href="#" class="header__navbar-item-link">
                        Xin Chào : <?php echo $name; ?>
                    </p>
                </li>
                <li class="header__navbar-item">
                    <a href="/MVC_LUANVAN/logout" class="header__navbar-item-link">
                        <i class="fas fa-sign-in-alt"></i>
                        Đăng Xuất
                    </a>
                </li>
                <?php
                }else {
                    ?>
                <li class="header__navbar-item">
                    <a href="/MVC_LuanVan/Login" class="header__navbar-item-link">
                        <i class="fas fa-sign-in-alt"></i>
                        Đăng nhập
                    </a>
                </li>
                <li class="header__navbar-item">
                    <a href="/MVC_LUANVAN/Register" class="header__navbar-item-link">
                        <i class="fas fa-key"></i>
                        Đăng ký
                    </a>
                </li>
                <?php
                }
                ?>
            </ul>
        </nav>
        <div class="header-with-search">
            <div class="header__logo">
                <a href="/MVC_LUANVAN/" class="header__logo-link">
                    <img src="/MVC_LUANVAN/Public/Assets/img/LOGO-fix-07.png" alt="">
                </a>
            </div>

            <form action="/MVC_LuanVan/Search/Search_live/" method="POST" id="form_Search">
                <div class="header__search">

                    <input type="text" class="header__search-input" placeholder="Nhập để tìm kiếm ..."
                        name="Live_Search" id="Live_Search" autocomplete="off">

                    <div class="Live_Search_Result" id="SearchResults">

                    </div>

                    <button type='submit' name='search' class="header__search-btn">
                        <i class="header__search-btn-icon fas fa-search"></i>
                    </button>

                </div>
            </form>

            <div class="header__user hoverfa-fade" id="userDiv">
                <a href="/MVC_LUANVAN/User/"> <i class="header__user-icon far fa-user-circle"></i> </a>
            </div>

            <div class="header__cart hoverfa-fade">
                <a href="/MVC_LUANVAN/Cart/">
                    <i class="header__cart-icon fas fa-cart-plus"></i>
                </a>
                <span id="cartQuantity" class="header_quantity-in-cart">
                </span>
            </div>
        </div>
    </div>

    <div class="header__menu">
        <div class="grid wide">
            <div class="navbar-menu">
                <ul class="menu__list">
                    <li class="menu__item l-3">
                        <div class="menu__item-box">
                            <a class="menu__link active uppercase" href="#">
                                <i class="category-icon fas fa-align-justify"></i>
                                Danh mục sản phẩm
                                <i class="menu__item-icon-left fa-solid fa-angle-down fa-fade"></i>
                            </a>
                        </div>
                    </li>
                    <li class="menu__item">
                        <div class="menu__item-box">
                            <a class="menu__link" href="/MVC_LUANVAN/">Trang chủ</a>
                        </div>
                    </li>
                    <li class="menu__item">
                        <div class="menu__item-box">
                            <a class="menu__link" href="">Khuyến Mãi</a>
                        </div>
                    </li>
                    <li class="menu__item">
                        <div class="menu__item-box">
                            <a class="menu__link" href="/MVC_LUANVAN/TechnologyInf">Thông Tin Công Nghệ</a>
                        </div>
                    </li>
                    <li class="menu__item">
                        <div class="menu__item-box">
                            <a class="menu__link" href="">Hướng Dẫn Thanh Toán</a>
                        </div>
                    </li>
                    <li class="menu__item">
                        <div class="menu__item-box">
                            <a class="menu__link" href="/MVC_LUANVAN/Contact">Liên hệ</a>
                        </div>
                    </li>
                    <li class="menu__item">
                        <div class="menu__item-box">
                            <a class="menu__link" href="#"></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</header>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

    $("#Live_Search").keyup(function() {
        var keySearch = $(this).val();

        if (keySearch != "") {
            $("#SearchResults").css('display', 'block');

            $.ajax({
                url: "/MVC_LuanVan/Home/Search",
                method: "POST",
                data: {
                    keySearch: keySearch
                },
                success: function(dataResult) {
                    $("#SearchResults").html(dataResult);
                }
            })
        } else {
            $("#SearchResults").css('display', 'none');
        }
    })
});
</script>