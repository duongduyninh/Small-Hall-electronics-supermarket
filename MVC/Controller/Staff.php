<?php 
class Staff extends Controller
{
    
    public function __construct()
    {
        $this->CategoriesModel = $this->Model("CategoriesModel");
        $this->CartModel = $this->Model("CartModel");
        $this->ProductModel = $this->Model("ProductModel");
        $this->SearchModel = $this->Model("SearchModel");
    }
    function index()
    {
        $WareHouseId = $_SESSION['accountTMP'][3];
        $this-> Views(
            "StaffView", [
            "page" => "homepageStaff",
            "Categories" =>$this->CategoriesModel->Categories(),
            "Product_new_Staff"=>$this->ProductModel->Product_new_Staff($WareHouseId),
            ]
        );
    }
    function SearchStaff()
    {
        if(isset($_POST['keySearch'])) {

            $data = [];
            
            $keySearch = $_POST['keySearch'];
            $WareHouseId = $_SESSION['accountTMP'][3];

            $SearchProduct = $this->SearchModel->SearchStaff($keySearch, $WareHouseId);

            // $result_SearchProduct = sqlsrv_fetch_array($SearchProduct, SQLSRV_FETCH_ASSOC);
            
            if($SearchProduct != false) {

                while($row = sqlsrv_fetch_array($SearchProduct, SQLSRV_FETCH_ASSOC)) {
                    $Path = $row['Path'] ;
                    $Name = $row['Name'];
                    ?>
<div class="Search_Result">
    <a href="">
        <div class="Search_Result_Img">
            <img src="<?php echo $Path; ?>" alt="">
        </div>
        <div class="Search_Result_Content">
            <span> <?php echo $Name;?> </span>
        </div>

    </a>
</div>
<?php
                }

            }
        }
    }
}

?>