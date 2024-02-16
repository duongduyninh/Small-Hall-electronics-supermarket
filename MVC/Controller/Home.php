<?php 
class Home extends Controller
{
    public $CategoriesModel;
    public $ProductModel;
    public $CartModel;
    public $BrandModel;

    private $BannerModel;
    public function __construct()
    {
        
        $this->CategoriesModel = $this->Model("CategoriesModel");
        $this->ProductModel = $this->Model("ProductModel");
        $this->CartModel = $this->Model("CartModel");
        $this->SearchModel = $this->Model("SearchModel");
        $this->BrandModel = $this->Model("BrandModel");
      
        $this->BannerModel = $this->Model("BannerModel");

    }
    function index()
    {   
        $this -> DeleteUpdateTransactionIdSESSION();
        $this -> DeleteInfSubmitPaySESSION();
        if(!isset($_SESSION['Cart'])) {
             $_SESSION['Cart'] = '';
        }
        if(!isset($_SESSION["accountTMP"])) {
            $length = 0 ;
        }else{
            $length = count($_SESSION["accountTMP"]);
        }
        // -------------------------Screen-------------------------------------
        $Screen_Home_Price = 1690000; // Màn hình giá từ 1.690.000 
        $Code_Screen = 4; // Mã Danh Mục Màn Hình 
        //   -----------------------Laptop-----------------------------------
        $Laptop_Home_Price = 7999000; // Màn hình giá từ 7.999.000 
        $Code_Laptop = 2; // Mã Danh Mục Laptop
        //   -----------------------PC-----------------------------------
        // $PC_Home_Price = 7999000; // Màn hình giá từ 1.690.000 
        // $Code_PC = 2; // Mã Danh Mục Màn Hình 
        //   -----------------------PC-----------------------------------
        

        $arr = $this->BannerModel->getAllBanners();

        $banners = [];
        foreach ($arr as $banner) { 
            $banners[$banner['Key']] = $banner["Path"];
        }

        $this-> Views(
            "homeView", [
            "page"=>"homepage",
            "Categories" =>$this->CategoriesModel->Categories(),
            "Product_New_Home" =>$this->ProductModel->Product_New_Home(),
            "ProductSelling_Home" =>$this->ProductModel->ProductSelling_Home(),
            "Screen_Home" =>$this->ProductModel->Screen_Home($Screen_Home_Price, $Code_Screen),
            "Laptop_Home" =>$this->ProductModel->Laptop_Home($Laptop_Home_Price, $Code_Laptop),
            "banners" => $banners
            ]
        );    
    }

    function category($id, $sortedBy = 1, $current_page = 1 )
    {
        $brands = $this->BrandModel->getAllBrandsByCategoryId($id);
       
        $getCountProductsByCategoryId = $this ->ProductModel ->getCountProductsByCategoryId($id);
      
        $brandsFilter = [];
        if(isset($_POST["brands"])) {
            $brandsFilter = $_POST["brands"];
        }
        
        $limit = 8;

        // Tìm Start
        $start = ($current_page - 1) * $limit;
        
        switch ($sortedBy) {
        case 1:
            $products = $this->ProductModel->getProductsByCategoryIdSortedByBestDiscount($id, $brandsFilter, $start, $limit);
            break;
        case 2:
            $products = $this->ProductModel->getProductsByCategoryIdSortedByDESC($id, $brandsFilter, $start, $limit);
            break;
        case 3:
            $products = $this->ProductModel->getProductsByCategoryIdSortedByASC($id, $brandsFilter, $start, $limit);
            break;
        case 4:
            $products = $this->ProductModel->getProductsByCategoryIdSortedByBestSales($id, $brandsFilter, $start, $limit);
            break;
        case 5:
            $products = $this->ProductModel->getProductsByCategoryIdSortedByNew($id, $brandsFilter, $start, $limit);
            break;
        default:
        }

        $total_records = $getCountProductsByCategoryId;

        $total_page = ceil($total_records / $limit);

        if ($current_page > $total_page) {
            $current_page = $total_page;
        }
        else if ($current_page < 1) {
            $current_page = 1;
        }

        
        $this-> Views(
            "SearchView", [  
            "page"=>"productInCategory",    
            "currentPage" => $current_page,           
            "totalPage" => $total_page,      
            "products"=>$products,            
            "categoryId"=> $id,          
            "sortedBy"=> $sortedBy,    
            "brands"=>$brands
            ]
        );
    }

    function GetQualityInCart()
    {
        if(!isset($_SESSION["accountTMP"])) {
            $length = 0 ;
        }else{
            $length = count($_SESSION["accountTMP"]);
        }

        if($length == 7 || $length == 0 ) {
            
            if (!isset($_SESSION['Cart'])) {
                $lengthCart = 0;
                echo $lengthCart; exit;
            }

            $carts = json_decode($_SESSION['Cart'], true);
            
            $count = 0;
        
            if(isset($carts)) {
                foreach ($carts as $key=>$value) {
                    $count += $value;
                }
            }
            echo $count;
            
        }else{

            $CustomerId = $_SESSION['accountTMP'][0];
            
            $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);

            if (!sqlsrv_has_rows($CheckCartExist)) {
                   $CreatCart = $this->CartModel->CreatCart($CustomerId);
            }

            $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);
            
            $result_CheckCartExist = sqlsrv_fetch_array($CheckCartExist, SQLSRV_FETCH_ASSOC);

            $GetQualityInCart = $this->CartModel->GetQualityInCart($result_CheckCartExist['Id']);

            $result_GetQualityInCart = sqlsrv_fetch_array($GetQualityInCart, SQLSRV_FETCH_ASSOC);
        
            $total_quantity = $result_GetQualityInCart['total_quantity'];

            if($total_quantity === null ) {
                echo '0';
            }else{
                echo $total_quantity;
            }
        }

        

    }
    function ProductDetail($IdProdcut)
    {
        $this -> Views(
            "ProductView", [
            "page"=>"ProductDetailView",
            ]
        );
    }
    function checkAccountExists()
    {
        if (isset($_SESSION['accountTMP'])) {
            echo json_encode($_SESSION['accountTMP']);
        } else {
            echo json_encode(null);
        }
    }
    function Search()
    {
        if(isset($_POST['keySearch'])) {
            
            $keySearch = $_POST['keySearch'];

            $SearchProduct = $this->SearchModel->Search($keySearch);

            // $result_SearchProduct = sqlsrv_fetch_array($SearchProduct, SQLSRV_FETCH_ASSOC);
            
            if($SearchProduct != false) {

                while($row = sqlsrv_fetch_array($SearchProduct, SQLSRV_FETCH_ASSOC)) {
                    $ProductId = $row['Id'] ;
                    $Path = $row['Path'] ;
                    $Name = $row['Name'];
                    echo "
                    <div class='Search_Result'>
                        <a href='/MVC_LuanVan/Product/ProductDetail/".$ProductId."' '>
<div class='Search_Result_Img'>
    <img src='".$Path."' alt=''>
</div>
<div class='Search_Result_Content'>
    <span> ". $Name."</span>
</div>
</a>
</div>
";
                }
            }
        }
    }
    function DeleteUpdateTransactionIdSESSION()
    {
        unset($_SESSION['UpdateTransactionId']);
    }
    function DeleteInfSubmitPaySESSION()
    {
        unset($_SESSION['InfSubmitPay']);
    }
}

?>
