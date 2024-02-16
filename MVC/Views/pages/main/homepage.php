<?php
$banners = [];
if(isset($data["banners"])){
    $banners = $data["banners"];
}
?>


<section class="section__banner">
    <div class="grid wide row">
        <div class="category l-3">
            <?php require './MVC/Views/pages/blocks/sidebar.php' ?>
        </div>
        <div class="banner__img l-6">
            <div class="slider ">
                <div class="slide">
                    <input type="radio" name="radio-btn" id="radio1">
                    <input type="radio" name="radio-btn" id="radio2">
                    <input type="radio" name="radio-btn" id="radio3">
                    <input type="radio" name="radio-btn" id="radio4">

                    <div class="st first">
                        <a href="">
                            <img src="/MVC_LuanVan/Public/Assets/img/bannerall.jpg" alt="">
                        </a>
                    </div>
                    <div class="st">
                        <a href="">
                            <img src="/MVC_LuanVan/Public/Assets/img/PC-T11.jpg" alt="">
                        </a>
                    </div>
                    <div class="st">
                        <a href="">
                            <img src="/MVC_LuanVan/Public/Assets/img/bo-doi-phi-thuong-1.jpg" alt="">
                        </a>
                    </div>
                    <div class="st">
                        <a href="">
                            <img src="/MVC_LuanVan/Public/Assets/img/luong-ve-sale-me-01-1536x768.jpg" alt="">
                        </a>
                    </div>
                    <div class="nav-auto">
                        <div class="a-b1"></div>
                        <div class="a-b2"></div>
                        <div class="a-b3"></div>
                        <div class="a-b4"></div>
                    </div>
                    <div class="buttons_navigation">
                        <button id="prev">
                            < </button>
                                <button id="next">
                                    >
                                </button>
                    </div>
                </div>

                <div class="nav-m">
                    <label for="radio1" class="m-btn"></label>
                    <label for="radio2" class="m-btn"></label>
                    <label for="radio3" class="m-btn"></label>
                    <label for="radio4" class="m-btn"></label>
                </div>
            </div>
        </div>
        <div class="right_KeyProducts__img l-3">
            <div class="KeyProducts">
                <div class="right__img" id="">
                    <a href="">
                        <img src="<?=$banners["banner_1"]?>" alt="">
                    </a>
                </div>
                <div class="right__img" id="">
                    <a href="">
                        <img src="<?=$banners["banner_2"]?>" alt="">
                    </a>
                </div>
                <div class="right__img" id="">
                    <a href="">
                        <img src="<?=$banners["banner_3"]?>" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="section__product-featured">
    <div class="section__product grid wide row line-height">
        <div class="l-2-8 product-featured">
            <a href="">
                <img src="<?=$banners["banner_4"]?>" alt="">
            </a>
        </div>
        <div class="l-2-8 product-featured">
            <a href="">
                <img src="<?=$banners["banner_5"]?>" alt="">
            </a>
        </div>
        <div class="l-2-8 product-featured">
            <a href="">
                <img src="<?=$banners["banner_6"]?>" alt="">
            </a>
        </div>
        <div class="l-2-8 product-featured">
            <a href="">
                <img src="<?=$banners["banner_7"]?>" alt="">
            </a>
        </div>
    </div>
</section>
<section class="section_sale ProductNew">

    <div class="section_sale grid wide row">
        <div class="section_title l-12">
            <a href="">
                <img src="/MVC_LuanVan/Public/Assets/img/SanPhamMoi.jpg" alt="">
            </a>
        </div>
        <div class="section_sale-product l-12">
            <div class="buttons_navigation">
                <button class="pre-btn">
                    < </button>
                        <button class="nxt-btn">
                            >
                        </button>
            </div>
            <div class="product_slider" style="transition: 3s;">
                <?php 
                while($Product_New_Home=sqlsrv_fetch_array($data['Product_New_Home'])){
                    if($Product_New_Home['PromotionPrice'] === null) {
                        $Product_New_Home['PromotionPrice'] = $Product_New_Home['Price'];
                        $Percent = 0 ; 
                    }else{
                        $Percent = ($Product_New_Home['Price'] - $Product_New_Home['PromotionPrice']) / $Product_New_Home['Price'] * 100;
                    }
                     
                    ?>
                <div class="product_card l-2-8" onclick="viewProduct(this)" id="<?php echo $Product_New_Home["Id"];?>">
                    <div class="product_card-img">
                        <?php
                        if($Percent != 0 ) {
                            ?>
                        <span class="product_card-img-discount"><?php echo $Percent; ?>%</span>
                            <?php
                        }
                        ?>
                        <span class="product_card-img-iconView">
                            <i class="fa-regular fa-eye" style="color: #ffffff;"></i>
                        </span>
                        <img src="<?php echo $Product_New_Home['Path'] ?>" alt="">
                    </div>
                    <div class="product_card-info">
                        <div class="product_card-info-title">
                            <div class="product_card-info-title-category">
                                <p><?php echo $Product_New_Home["CategorieName"]; ?></p>
                            </div>
                            <div class="product_card-info-title-name">
                                <p><?php echo $Product_New_Home["Name"]; ?></p>
                            </div>
                        </div>
                        <div class="product_card-info-price">
                            <?php
                            if($Percent != 0 ) {
                                ?>
                            <span
                                class="info-price-initial"><?php echo number_format($Product_New_Home['Price'], 0, ',', '.') . '₫';?></span>
                                <?php
                            }
                            ?>

                            <span
                                class="info-price-sale"><?php echo number_format($Product_New_Home['PromotionPrice'], 0, ',', '.') . '₫';?>
                                ₫</span>
                        </div>

                    </div>
                    <div class="product_card-add-to-cart">
                        <a class="add-to-cart-button" onclick="addToCart(event, this)">
                            <button class="bt-add-to-cart">
                                <span>Thêm Vào Giỏ Hàng</span>
                                <div class="cart">
                                    <svg viewBox="0 0 36 26">
                                        <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
                                        <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
                                    </svg>
                                </div>
                            </button>
                        </a>
                    </div>
                </div>
                <?php } 
                ?>
            </div>
        </div>
    </div>
</section>
<section class="section_sale ProductSelling">

    <div class="section_sale grid wide row">
        <div class="section_title l-12">
            <a href="">
                <img src="/MVC_LuanVan/Public/Assets/img/SanPhamBanChay.jpg" alt="">
            </a>
        </div>
        <div class="section_sale-product l-12">
            <div class="buttons_navigation">
                <button class="pre-btn">
                    < </button>
                        <button class="nxt-btn">
                            >
                        </button>
            </div>
            <div class="product_slider" style="transition: 3s;">
                <?php 
                while($ProductSelling_Home=sqlsrv_fetch_array($data['ProductSelling_Home'])){
                    if($ProductSelling_Home['PromotionPrice'] === null) {
                        $ProductSelling_Home['PromotionPrice'] = $ProductSelling_Home['Price'];
                        $Percent = 0 ; 
                    }else{
                        $Percent = ($ProductSelling_Home['Price'] - $ProductSelling_Home['PromotionPrice']) / $ProductSelling_Home['Price'] * 100;
                    }
                     
                    ?>
                <div class="product_card l-2-8" onclick="viewProduct(this)"
                    id="<?php echo $ProductSelling_Home["ProductId"];?>">
                    <div class="product_card-img">
                        <?php
                        if($Percent != 0 ) {
                            ?>
                        <span class="product_card-img-discount"><?php echo $Percent; ?>%</span>
                            <?php
                        }
                        ?>
                        <span class="product_card-img-iconView">
                            <i class="fa-regular fa-eye" style="color: #ffffff;"></i>
                        </span>
                        <img src="<?php echo $ProductSelling_Home['ImagePath'] ?>" alt="">
                    </div>
                    <div class="product_card-info">
                        <div class="product_card-info-title">
                            <div class="product_card-info-title-category">
                                <p><?php echo $ProductSelling_Home["CategorieName"]; ?></p>
                            </div>
                            <div class="product_card-info-title-name">
                                <p><?php echo $ProductSelling_Home["Name"]; ?></p>
                            </div>
                        </div>
                        <div class="product_card-info-price">
                            <?php
                            if($Percent != 0 ) {
                                ?>
                            <span
                                class="info-price-initial"><?php echo number_format($ProductSelling_Home['Price'], 0, ',', '.') . '₫';?></span>
                                <?php
                            }
                            ?>

                            <span
                                class="info-price-sale"><?php echo number_format($ProductSelling_Home['PromotionPrice'], 0, ',', '.') . '₫';?>
                                ₫</span>
                        </div>

                    </div>
                    <div class="product_card-add-to-cart">
                        <a class="add-to-cart-button" onclick="addToCart(event, this)">
                            <button class="bt-add-to-cart">
                                <span>Thêm Vào Giỏ Hàng</span>
                                <div class="cart">
                                    <svg viewBox="0 0 36 26">
                                        <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
                                        <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
                                    </svg>
                                </div>
                            </button>
                        </a>
                    </div>
                </div>
                <?php } 
                ?>
            </div>
        </div>
    </div>
</section>
<section class="section_sale screen">

    <div class="section_sale grid wide row">
        <div class="section_title l-12">
            <a href="">
                <img src="/MVC_LuanVan/Public/Assets/img/ManHinhSieuXin.jpg" alt="">
            </a>
        </div>
        <div class="section_sale-product l-12">
            <div class="buttons_navigation">
                <button class="pre-btn">
                    < </button>
                        <button class="nxt-btn">
                            >
                        </button>
            </div>
            <div class="product_slider" style="transition: 3s;">
                <?php 
                while($Screen_Home=sqlsrv_fetch_array($data['Screen_Home'])){
                    if($Screen_Home['PromotionPrice'] === null) {
                        $Screen_Home['PromotionPrice'] = $Screen_Home['Price'];
                        $Percent = 0 ; 
                    }else{
                        $Percent = ($Screen_Home['Price'] - $Screen_Home['PromotionPrice']) / $Screen_Home['Price'] * 100;
                    }
                     
                    ?>
                <div class="product_card l-2-8" onclick="viewProduct(this)" id="<?php echo $Screen_Home["Id"];?>">
                    <div class="product_card-img">
                        <?php
                        if($Percent != 0 ) {
                            ?>
                        <span class="product_card-img-discount"><?php echo $Percent; ?>%</span>
                            <?php
                        }
                        ?>
                        <span class="product_card-img-iconView">
                            <i class="fa-regular fa-eye" style="color: #ffffff;"></i>
                        </span>
                        <img src="<?php echo $Screen_Home['Path'] ?>" alt="">
                    </div>
                    <div class="product_card-info">
                        <div class="product_card-info-title">
                            <div class="product_card-info-title-category">
                                <p><?php echo $Screen_Home["CategorieName"]; ?></p>
                            </div>
                            <div class="product_card-info-title-name">
                                <p><?php echo $Screen_Home["Name"]; ?></p>
                            </div>
                        </div>
                        <div class="product_card-info-price">
                            <?php
                            if($Percent != 0 ) {
                                ?>
                            <span
                                class="info-price-initial"><?php echo number_format($Screen_Home['Price'], 0, ',', '.') . '₫';?></span>
                                <?php
                            }
                            ?>

                            <span
                                class="info-price-sale"><?php echo number_format($Screen_Home['PromotionPrice'], 0, ',', '.') . '₫';?>
                                ₫</span>
                        </div>

                    </div>
                    <div class="product_card-add-to-cart">
                        <a class="add-to-cart-button" onclick="addToCart(event, this)">
                            <button class="bt-add-to-cart">
                                <span>Thêm Vào Giỏ Hàng</span>
                                <div class="cart">
                                    <svg viewBox="0 0 36 26">
                                        <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
                                        <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
                                    </svg>
                                </div>
                            </button>
                        </a>
                    </div>
                </div>
                <?php } 
                ?>
            </div>
        </div>
    </div>
</section>
<section class="section_sale Laptop">

    <div class="section_sale grid wide row">
        <div class="section_title l-12">
            <a href="">
                <img src="/MVC_LuanVan/Public/Assets/img/LapTopGiaTot.jpg" alt="">
            </a>
        </div>
        <div class="section_sale-product l-12">
            <div class="buttons_navigation">
                <button class="pre-btn">
                    < </button>
                        <button class="nxt-btn">
                            >
                        </button>
            </div>
            <div class="product_slider" style="transition: 3s;">
                <?php 
                while($Laptop_Home=sqlsrv_fetch_array($data['Laptop_Home'])){
                    if($Laptop_Home['PromotionPrice'] === null) {
                        $Laptop_Home['PromotionPrice'] = $Laptop_Home['Price'];
                        $Percent = 0 ; 
                    }else{
                        $Percent = ($Laptop_Home['Price'] - $Laptop_Home['PromotionPrice']) / $Laptop_Home['Price'] * 100;
                    }
                     
                    ?>
                <div class="product_card l-2-8" onclick="viewProduct(this)" id="<?php echo $Laptop_Home["Id"];?>">
                    <div class="product_card-img">
                        <?php
                        if($Percent != 0 ) {
                            ?>
                        <span class="product_card-img-discount"><?php echo $Percent; ?>%</span>
                            <?php
                        }
                        ?>
                        <span class="product_card-img-iconView">
                            <i class="fa-regular fa-eye" style="color: #ffffff;"></i>
                        </span>
                        <img src="<?php echo $Laptop_Home['Path'] ?>" alt="">
                    </div>
                    <div class="product_card-info">
                        <div class="product_card-info-title">
                            <div class="product_card-info-title-category">
                                <p><?php echo $Laptop_Home["CategorieName"]; ?></p>
                            </div>
                            <div class="product_card-info-title-name">
                                <p><?php echo $Laptop_Home["Name"]; ?></p>
                            </div>
                        </div>
                        <div class="product_card-info-price">
                            <?php
                            if($Percent != 0 ) {
                                ?>
                            <span
                                class="info-price-initial"><?php echo number_format($Laptop_Home['Price'], 0, ',', '.') . '₫';?></span>
                                <?php
                            }
                            ?>

                            <span
                                class="info-price-sale"><?php echo number_format($Laptop_Home['PromotionPrice'], 0, ',', '.') . '₫';?>
                                ₫</span>
                        </div>

                    </div>
                    <div class="product_card-add-to-cart">
                        <a class="add-to-cart-button" onclick="addToCart(event, this)">
                            <button class="bt-add-to-cart">
                                <span>Thêm Vào Giỏ Hàng</span>
                                <div class="cart">
                                    <svg viewBox="0 0 36 26">
                                        <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
                                        <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
                                    </svg>
                                </div>
                            </button>
                        </a>
                    </div>
                </div>
                <?php } 
                ?>
            </div>
        </div>
    </div>
</section>
<script src="/MVC_LuanVan/Public/JS/auto-img-banner.js"></script>
<script src="/MVC_LuanVan/Public/JS/get-ID-ProductCard.js"></script>
<script src="/MVC_LuanVan/Public/JS/aotu-product_slider.js"></script>
