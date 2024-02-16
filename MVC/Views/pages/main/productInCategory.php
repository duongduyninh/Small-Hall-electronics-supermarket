<?php
$actual_link = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]";
    
$total_page = null;
if(isset($data["totalPage"])) {
    $total_page = $data["totalPage"];
}

$current_page = null;
if(isset($data["currentPage"])) {
    $current_page = $data["currentPage"];
}

$products = [];
if(isset($data['products'])) {
    $products = $data['products'];
}

$sortedBy = null;
if(isset($data["sortedBy"])) {
    $sortedBy = $data["sortedBy"];
}

$categoryId = null;
if(isset($data["categoryId"])) {
    $categoryId = $data["categoryId"];
}

$brands = null;
if (isset($data['brands'])) {
    $brands = $data['brands'];
}

$brandsFilter = [];
if(isset($_POST["brands"])) {
    $brandsFilter = $_POST["brands"];
}
    
?>
<input type="hidden" name="sortedBy" id="<?php echo $sortedBy; ?>">
<input type="hidden" name="categoryId" id="<?php echo $categoryId; ?>">
<input type="hidden" name="currentPage" id="<?php echo $current_page; ?>">
<div class="KeySearchProducts grid wide row">
    <div style="display: none;" class="KeySearch l-12">
        <div class="KeySearch_1">
            <p>
                Tìm Kiếm :
            </p>
        </div>
        <div class="KeySearch_2">
            <div class="KeySearch_2_Content">
                <p>
                    Tìm Kiếm
                </p>
            </div>
        </div>
    </div>

    <div class="Sorted_By l-12 mb-2 mt-2">
        <div class="Sorted_By_Content h-100 position-relative">
            <div class="TitleKeySorted_By">
                <h5 class="px-1">Thương hiệu :</h5>
            </div>
            <div class="h-100">
                <form action="/MVC_LuanVan/Home/Category/<?php echo $categoryId.'/'.$sortedBy.'/1' ?>" method="post">
                    <ul class="mb-0 ">
                        <?php
                        if ($brands != null) {
                            foreach ($brands as $brand) {
                                $isChecked = in_array($brand["Id"], $brandsFilter)?  'checked' :  '';

                                echo '<li>
                                        <input type="checkbox" name="brands[]" '.$isChecked.' value="'.$brand["Id"].'" id="myCheckbox'.$brand['Id'].'" />
                                        <label for="myCheckbox'.$brand['Id'].'"><img src="'.$brand['Thumbnail'].'" /></label>
                                    </li>';

                            }
                            echo "<button class='btn btn-primary position-absolute' style='bottom: 20px; right: 20px'>Lọc</button>";
                        }
                        ?>
                        <!-- <li>
                            <input type="checkbox" id="myCheckbox1" />
                            <label for="myCheckbox1"><img src="http://townandcountryremovals.com/wp-content/uploads/2013/10/firefox-logo-200x200.png" /></label>
                        </li>
                        <li>

                            <input type="checkbox" id="myCheckbox2" />
                            <label for="myCheckbox2"><img src="http://tech21info.com/admin/wp-content/uploads/2013/03/chrome-logo-200x200.png" /></label>
                        </li>
                        <li>

                            <input type="checkbox" id="myCheckbox3" />
                            <label for="myCheckbox3"><img src="http://www.thebusinessofsports.com/wp-content/uploads/2010/10/facebook-icon-200x200.png" /></label>
                        </li> -->
                    </ul>
                </form>
            </div>
        </div>
    </div>
    <?php
    if($products !== null && count($products) > 0) {
        ?>
    <div class="Sorted_By l-12">
        <div class="Sorted_By_Content">
            <div class="TitleKeySorted_By">
                <h5>Sắp xếp theo :</h5>
            </div>
            <div class="KeySorted_By" id="1">
                <div class="ContentKeySorted_By <?php echo $sortedBy == 1 ? 'filter-active' : '' ?>">
                    <a href="/MVC_LuanVan/Home/Category/<?php echo $categoryId ?>/1/1">Khuyến mãi tốt nhất</a>
                </div>
            </div>
            <div class="KeySorted_By" id="2">
                <div class="ContentKeySorted_By <?php echo $sortedBy == 2 ? 'filter-active' : '' ?>">
                    <a href="/MVC_LuanVan/Home/Category/<?php echo $categoryId ?>/2/1">Giá giảm dần</a>
                </div>
            </div>
            <div class="KeySorted_By" id="3">
                <div class="ContentKeySorted_By <?php echo $sortedBy == 3 ? 'filter-active' : '' ?>">
                    <a href="/MVC_LuanVan/Home/Category/<?php echo $categoryId ?>/3/1">Giá tăng dần</a>
                </div>
            </div>
            <div class="KeySorted_By" id="4">
                <div class="ContentKeySorted_By <?php echo $sortedBy == 4 ? 'filter-active' : '' ?>">
                    <a href="/MVC_LuanVan/Home/Category/<?php echo $categoryId ?>/4/1">Sản phẩm bán chạy</a>
                </div>
            </div>
            <div class="KeySorted_By" id="5">
                <div class="ContentKeySorted_By <?php echo $sortedBy == 5 ? 'filter-active' : '' ?>">
                    <a href="/MVC_LuanVan/Home/Category/<?php echo $categoryId ?>/5/1">Sản phẩm mới</a>
                </div>
            </div>
        </div>
    </div>
        <?php
    }
    ?>
    <div class="resultKeySearch l-12">
        <div class="list_resultKeySearch l-12">
            <?php
            if($products !== null && count($products) > 0) { 
                foreach ($data['products'] as $product) {
                    
                    if($product['PromotionPrice'] === null) {
                        $product['PromotionPrice'] = $product['Price'];
                        $Percent = 0 ; 
                    }else{
                        $Percent = ($product['Price'] - $product['PromotionPrice']) / $product['Price'] * 100;
                    }
                    ?>
            <div class="product_card customs_card_search l-2-8" onclick="viewProductSearch(this) "
                id="<?php echo $product["Id"];?>">
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
                    <img src="<?php echo $product['Path'] ?>" alt="">
                </div>
                <div class="product_card-info">
                    <div class="product_card-info-title">
                        <div class="product_card-info-title-category-Search">
                            <p class="info_p"><?php echo $product['CategoryName'] ?></p>
                        </div>
                        <div class="product_card-info-title-name">
                            <p><?php echo $product["Name"]; ?></p>
                        </div>
                    </div>
                    <div class="product_card-info-price">
                        <?php
                        if($Percent != 0 ) {
                            ?>
                        <span
                            class="info-price-initial"><?php echo number_format($product['Price'], 0, ',', '.') . '₫';?></span>
                            <?php
                        }
                        ?>

                        <span
                            class="info-price-sale"><?php echo number_format($product['PromotionPrice'], 0, ',', '.') . '₫';?>
                            ₫</span>
                    </div>
                </div>
            </div>

                    <?php
                }
            } else{
                 echo "
        <div style='height: 400px' class='container'>
            <h5 class='text-center'>Danh mục này chưa có sản phẩm !!!!</h5>
        </div>
        ";
            }
            ?>
        </div>

        <ul class="pagination mt-2">
            <?php //HIỂN THỊ PHÂN TRANG
                // nếu current_page > 1 và total_page > 1 mới hiển thị nút prev
            if ($current_page > 1 && $total_page > 1) {
                // echo '<a href="index.php?page='.($current_page-1).'">Prev</a> | ';
                echo '<li class="page-item">
                                                        <a class="page-link" href="' . $actual_link . '/MVC_LUANVAN/Home/Category/'.$categoryId."/".$sortedBy."/". ($current_page - 1) . '">Sau</a>
                                                    </li>';
            }
                // Lặp khoảng giữa
            for ($i = 1; $i <= $total_page; $i++) {
                // Nếu là trang hiện tại thì hiển thị thẻ span
                // ngược lại hiển thị thẻ a
                if ($i == $current_page) {
                    echo '<li class="page-item"><a class="page-link active" href="' . $actual_link . '/MVC_LUANVAN/Home/Category/'.$categoryId."/" .$sortedBy."/". $i . '">' . $i . '</a></li>';
                } else {
                    echo '<li class="page-item"><a class="page-link" href="' . $actual_link . '/MVC_LUANVAN/Home/Category/'.$categoryId."/".$sortedBy."/". $i . '">' . $i . '</a></li>';
                }
            }

                                    // nếu current_page < $total_page và total_page > 1 mới hiển thị nút prev
            if ($current_page < $total_page && $total_page > 1) {
                echo '<li class="page-item">
                                            <a class="page-link" href="' . $actual_link . '/MVC_LUANVAN/Home/Category/'.$categoryId."/".$sortedBy."/". ($current_page + 1) . '">Trước</a>
                                        </li> ';
            }
            ?>

            <!-- <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li> -->

        </ul>
    </div>
</div>
