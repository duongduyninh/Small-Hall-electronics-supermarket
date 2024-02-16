<?php 
class Order extends Controller
{
    public $CategoriesModel;
    public $ProductModel;
    public $CartModel;
    public function __construct()
    {
        
        $this->CategoriesModel = $this->Model("CategoriesModel");
        $this->ProductModel = $this->Model("ProductModel");
        $this->CartModel = $this->Model("CartModel");
      
    }
    function index()
    {   
        $this-> Views(
            "CartView", [
                "page"=>"InfoOrderView",
            ]
        );
    }
}
?>