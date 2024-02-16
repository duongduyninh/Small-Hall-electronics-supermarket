<?php 
class Product extends Controller
{
    
    public function __construct()
    {
        $this->ProductModel = $this->Model("ProductModel");
    }
    function index()
    {
     
    }
    function ProductDetail($IdProduct)
    {
        
        $this -> Views(
            "ProductView", [
            "page"=>"ProductDetailView",
            "Detailproduct"=> $this -> ProductModel ->Detailproduct($IdProduct),
            "getImgDetailproduct"=>$this->ProductModel->getImgDetailproduct($IdProduct),
            "getProductDetailedConfigs"=>$this->ProductModel->getProductDetailedConfigs($IdProduct),
            "getProductWareHouses"=>$this->ProductModel->getProductWareHouses($IdProduct)
            ]
        );
    }
    
}
?>
