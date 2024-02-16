<?php 

class Cart extends Controller
{
    public $CartModel;
    public $ProductModel;
    public function __construct()
    {
        
        $this->CartModel = $this->Model("CartModel");
        $this->ProductModel = $this->Model("ProductModel");
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        
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
        
        if($length == 5 ) {
            
            if(!isset($_SESSION['accountTMP'])) {
                header('location: /MVC_LUANVAN/login');
            }
            $CustomerId = $_SESSION['accountTMP'][0];
        
            $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);

            if (!sqlsrv_has_rows($CheckCartExist)) {
                $CreatCart = $this->CartModel->CreatCart($CustomerId);
            }

            $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);//lâp lại 1 lần nữa checkcart để lấy ID cart 

            $result_CheckCartExist = sqlsrv_fetch_array($CheckCartExist, SQLSRV_FETCH_ASSOC);
        
            $this -> Views(
                "CartView", [
                "page"=>"CartDetailView",
                "GetCart" => $this->CartModel->GetCart($result_CheckCartExist['Id']),
                ]
            );
            
        }elseif($length == 7 || $length == 0 ) {
            
            $carts = json_decode($_SESSION['Cart'], true);

            $ProductIds = array();
            $listcartModel = array();

            if(isset($carts)) {
                foreach ($carts as $key => $value) {
                    $getProductTMP = $this -> ProductModel -> GetInfProduct($key);

                    $result_getProductTMP = sqlsrv_fetch_array($getProductTMP, SQLSRV_FETCH_ASSOC);

                    $PromotionPrice = $result_getProductTMP['PromotionPrice'] != null ? $result_getProductTMP['PromotionPrice'] : $result_getProductTMP['Price'] ;

                    $listcartModel[$key] = array(
                    'ProductId' => $result_getProductTMP['Id'],
                    'nameProduct' => $result_getProductTMP['Name'],
                    'Path' => $result_getProductTMP['Path'],
                    'quantity' => $value,
                    'price' => $PromotionPrice,
                    );
                }
            }
            
            $this -> Views(
                "CartView", [
                "page"=>"CartDetailStaffView",
                'dataModels' => $listcartModel,
                ]
            );

        }
    }
    function addToCart()
    {
        if(isset($_POST['quantityProduct'])) {
            $quantityAddToCart = $_POST['quantityProduct'];
        }else{
            $quantityAddToCart = 1; 
        }
        if(!isset($_SESSION["accountTMP"])) {
            $length = 0 ;
        }else{
            $length = count($_SESSION["accountTMP"]);
        }

        if($length == 7 ) {
            
            $ProductId = $_POST["productId"];

            $WareHouseId = $_SESSION['accountTMP'][3];

            $CheckCodeWareHouseProduct = $this-> ProductModel->CheckCodeWareHouseProduct($ProductId, $WareHouseId);

            $result_CheckCodeWareHouseProduct = sqlsrv_fetch_array($CheckCodeWareHouseProduct, SQLSRV_FETCH_ASSOC);

            if($result_CheckCodeWareHouseProduct != false) {
                $QuantityProductInWareHouse = $result_CheckCodeWareHouseProduct['Quantity'];

                $IdWareHouseProduct = $result_CheckCodeWareHouseProduct['WareHouseId'];

                if($IdWareHouseProduct === $WareHouseId) {
                    if($QuantityProductInWareHouse == 0 ) {
                        echo "1";
                    }elseif($QuantityProductInWareHouse != 0) {

                        if(!isset($_SESSION['Cart'])) {
                            $_SESSION['Cart'] = '';
                        }

                        $carts = json_decode($_SESSION['Cart'], true);
        
                        if(isset($carts[$ProductId])) {
                            $carts[$ProductId] += $quantityAddToCart;
                        }

                        else{
                            $carts[$ProductId] = $quantityAddToCart;
                        }

                        $_SESSION["Cart"] = json_encode($carts);
                
                    }else{

                    }

                }else{
                    echo "3";
                }
                
            }else{
                echo '2';
            }

        }elseif($length == 5) {
          
            if (isset($_POST['productId'])) {
            
                $ProductId = $_POST["productId"];
                $CustomerId = $_POST["customerId"];
                $UserId = $_POST["userId"]; 
                $QuantityProductTMP = $_POST['quantityProduct'];
                $CreatedTime = 'getdate()';
                $LastUpdated = 'getdate()';
            
                $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);

                if (!sqlsrv_has_rows($CheckCartExist)) {
                    $CreatCart = $this->CartModel->CreatCart($CustomerId);
                }

                $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);//lâp lại 1 lần nữa checkcart để lấy ID cart 

                $result_CheckCartExist = sqlsrv_fetch_array($CheckCartExist, SQLSRV_FETCH_ASSOC);

                $GetProductInCart = $this->CartModel->GetProductInCart($result_CheckCartExist['Id'], $ProductId);

                $GetInfProduct = $this->ProductModel->GetInfProduct($ProductId);

                $result_GetInfProduct = sqlsrv_fetch_array($GetInfProduct, SQLSRV_FETCH_ASSOC);

                $PromotionPrice = $result_GetInfProduct['PromotionPrice'] != null ? $result_GetInfProduct['PromotionPrice'] : 'null';


                if(!sqlsrv_has_rows($GetProductInCart)) {
               
                    $QuantityProductSimple =  $QuantityProductTMP ;
                
                    $CreatCartDetail = $this->CartModel->CreatCartDetail(
                        $result_CheckCartExist['Id'],
                        $ProductId,
                        $QuantityProductSimple,
                        $result_GetInfProduct['Name'],
                        $result_GetInfProduct['Price'],
                        $PromotionPrice,
                        $CreatedTime,
                        $LastUpdated,
                        $result_GetInfProduct['Status'],
                    );
                }else{
                
                    $result_GetProductInCart = sqlsrv_fetch_array($GetProductInCart, SQLSRV_FETCH_ASSOC);

                    $QuantityProduct = $QuantityProductTMP + $result_GetProductInCart['Quantity'];

                    $UpdateCartDetail = $this->CartModel->UpdateCartDetail(
                        $result_CheckCartExist['Id'],
                        $ProductId,
                        $QuantityProduct,
                        $LastUpdated,
                        $result_GetInfProduct['Status'],
                    );
                }
            }
        }elseif($length == 0) {
            
            $ProductId = $_POST["productId"];

            if(!isset($_SESSION['Cart'])) {
                $_SESSION['Cart'] = '';
            }

            $carts = json_decode($_SESSION['Cart'], true);
        
            if(isset($carts[$ProductId])) {
                $carts[$ProductId] += $quantityAddToCart;
            }
            else{
                $carts[$ProductId] = $quantityAddToCart;
            }

            $_SESSION["Cart"] = json_encode($carts);
        }
    }
    function delProductToCart()
    {
        if(!isset($_SESSION["accountTMP"])) {
            $length = 0 ;
        }else{
            $length = count($_SESSION["accountTMP"]);
        }
        
        if($length == 7 || $length == 0  ) {

            $ProductId = $_POST['productId'];
            
            $carts = json_decode($_SESSION['Cart'], true);

            if(isset($carts[$ProductId])) {
                unset($carts[$ProductId]);
                $_SESSION["Cart"] = json_encode($carts);
            }

            echo $ProductId;

            
        }else{
            if($_POST['productId']) {
                $IdCartDetail = $_POST['productId'];
                $CustomerId = $_SESSION['accountTMP'][0];

                $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);

                $result_CheckCartExist = sqlsrv_fetch_array($CheckCartExist, SQLSRV_FETCH_ASSOC);

                $IdCart =  $result_CheckCartExist['Id'];
            
                if (!$IdCart === null|| !empty($IdCart)) {

                    $DelProductToCart = $this->CartModel->DelProductToCart($IdCart, $IdCartDetail);
                
                    echo "success";
           
                } else {
                    echo "deo xoa duoc ";
                }

            }
        }
            
    }
    function updatesCartAndPay()
    {
        if(!isset($_SESSION["accountTMP"])) {
            $length = 0 ;
        }else{
            $length = count($_SESSION["accountTMP"]);
        }

        if($length == 7 || $length == 0  ) {

            if($length == 7) {
                $StaffId = $_SESSION['accountTMP'][5];
                $StoreId = $_SESSION['accountTMP'][3];
                $PaymentStatus = 1 ;
                $ShipStatus = 2;
            }else{
                $StaffId = 'null';
                $StoreId = 'null';
                $MoneyReceived = 0 ;
                $MoneyRefund = 0 ;
                $PaymentStatus = 0 ;
                $ShipStatus = 0;
            }
            if(isset($_POST['update_click'])) {

                $carts = json_decode($_SESSION['Cart'], true);
                
                if(isset($_POST['ProductId'])) {
                    
                    for($i=0 ; $i < count($_POST['ProductId']); $i++) {

                        $ProductId = $_POST["ProductId"][$i];
                        $Quantity = $_POST["Quantity"][$i];
                        // echo $Quantity;
                        // echo $ProductId;
                        // exit;
                        if($Quantity == 0 ) {
                            unset($carts[$ProductId]);
                        }elseif(isset($carts[$ProductId])) {
                            $carts[$ProductId] = $Quantity ;
                        }
                        
                    }

                    $_SESSION["Cart"] = json_encode($carts);
                }
             
                setcookie('SuccessTMP', "updatesCartSuccess", time() + 2);
                header('location: /MVC_LuanVan/Cart');
               
            }

            if(isset($_POST['order_click'])) {

                $carts = json_decode($_SESSION['Cart'], true);
                
                if($carts === null || empty($carts)) {
                    setcookie('SuccessTMP', "CartNull2", time() + 2);
                    header('location: /MVC_LuanVan/Cart');
                }

                $ProductIds = array();
                $listcartModel = array();

                if(isset($carts)) {
                    foreach ($carts as $key => $value) {
                        $getProductTMP = $this -> ProductModel -> GetInfProduct($key);

                        $result_getProductTMP = sqlsrv_fetch_array($getProductTMP, SQLSRV_FETCH_ASSOC);

                        $PromotionPrice = $result_getProductTMP['PromotionPrice'] != null ? $result_getProductTMP['PromotionPrice'] : $result_getProductTMP['Price'] ;


                        $listcartModel[$key] = array(
                        'nameProduct' => $result_getProductTMP['Name'],
                        'Path' => $result_getProductTMP['Path'],
                        'quantity' => $value,
                        'price' => $PromotionPrice,
                        );
                    }
                }

                $this -> Views(
                    "CartView", [
                    "page"=>"InfoOrderStaffView",
                    "GetCartSession" => $listcartModel
                    ]
                ); 
                
            }

            if(isset($_POST['Submit_Pay'])) {
                
                $CustomerId = 'null';
                $CustomerName = $_POST['NameOrder'];
                $PhoneNumber = $_POST['PhoneNumber'];
                $Email = $_POST['Email'];
                $Address = $_POST['Address'];
                $Note = 'null';
                $PaymentMethod = $_POST['PaymentMethod'];
                $TmpTotal = $_POST['total_all_addVoucher'];
                $Total = $_POST['total_all_addVoucher'];
                $CreatedTime = 'getdate()';
                $LastUpdated = 'getdate()';

                if(isset($_POST['PaymentMethod']) && $_POST['PaymentMethod'] == 'COD') {
                  
                    $ProductWarehouseId = 'null';
                    
                    $CreateOrder = $this-> CartModel -> CreateOrder(
                        $CustomerId, 
                        $CustomerName, 
                        $PhoneNumber,
                        $Email, 
                        $Address, 
                        $Note,
                        $PaymentMethod, 
                        $TmpTotal, 
                        $Total, 
                        $StaffId,
                        $StoreId,
                        $ShipStatus, 
                        $PaymentStatus, 
                        $CreatedTime, 
                        $LastUpdated
                    );
                    if($CreateOrder != null) {

                        $OrderId  = $CreateOrder;
                            
                        for ($i = 0; $i < count($_POST['ProductId']); $i++) {
                            $ProductId = $_POST['ProductId'][$i];
                            $Path = $_POST['Path'][$i];
                            $ProductName = $_POST['ProductName'][$i];
                            $Quantity = $_POST['Quantity'][$i];
                            $ProducPrice = $_POST['ProducPrice'][$i];
                            if ($ProducPrice != "" && $ProductId != "" && $Quantity != "") {
                                $CreateOrderDetail = $this->CartModel->CreateOrderDetail(
                                    $OrderId, 
                                    $ProductId, 
                                    $Path, 
                                    $ProductName, 
                                    $Quantity, 
                                    $ProducPrice, 
                                    $CreatedTime, 
                                    $LastUpdated,
                                    $ProductWarehouseId
                                );
                            }
                            
                                $Completed = true;
                        }

                        if($Completed === true) {
                              
                            $StatusPay = 0 ;
                            $CreateBill = $this -> CartModel->CreateBill($OrderId, $Total, $MoneyReceived, $MoneyRefund, $CreatedTime, $StatusPay);

                            $checkStatusPayBill = $this->CartModel->checkStatusPayBill($OrderId);

                            $result_checkStatusPayBill = sqlsrv_fetch_array($checkStatusPayBill);

                            $PaymentStatus = $result_checkStatusPayBill['StatusPay'] ;
                    
                            $_SESSION['ShowBill'] = [$OrderId,$CustomerName,$PhoneNumber,$Address,$PaymentMethod,$PaymentStatus];

                            $this->DeleteCartSESSION();

                            $this->DeleteUpdateTransactionIdSESSION();

                            header('location: /MVC_LuanVan/Cart/ShowBill');
                        }
                           
                    }
                }elseif(isset($_POST['PaymentMethod']) && $_POST['PaymentMethod'] == 'VNPAY') {
                 
                    if($lenght == 0) {
                        
                        $PaymentMethod =  $_POST['PaymentMethod'];
                        
                        $ProductWarehouseId = 'null';
                    
                        $CreateOrder = $this->CartModel->CreateOrder(
                            $CustomerId, 
                            $CustomerName, 
                            $PhoneNumber,
                            $Email, 
                            $Address, 
                            $Note,
                            $PaymentMethod, 
                            $TmpTotal, 
                            $Total, 
                            $StaffId, 
                            $StoreId, 
                            $ShipStatus, 
                            $PaymentStatus, 
                            $CreatedTime, 
                            $LastUpdated
                        );
                        if($CreateOrder != null) {

                            $TransactionStatus = $PaymentStatus;
                            $TransactionId = 0 ;
                            $BankName = "NCB";
                            $Price = $Total;
                            $DateTimePayment = $CreatedTime;
                            $OrderId  = $CreateOrder;

                            for ($i = 0; $i < count($_POST['ProductId']); $i++) {
                                $ProductId = $_POST['ProductId'][$i];
                                $Path = $_POST['Path'][$i];
                                $ProductName = $_POST['ProductName'][$i];
                                $Quantity = $_POST['Quantity'][$i];
                                $ProducPrice = $_POST['ProducPrice'][$i];
                                if ($ProducPrice != "" && $ProductId != "" && $Quantity != "") {
                                    $CreateOrderDetail = $this->CartModel->CreateOrderDetail(
                                        $OrderId, 
                                        $ProductId, 
                                        $Path, 
                                        $ProductName, 
                                        $Quantity, 
                                        $ProducPrice, 
                                        $CreatedTime, 
                                        $LastUpdated,
                                        $ProductWarehouseId
                                    );
                                }else {
                                    $Completed = true; 
                                }
                            }
                            if($PaymentMethod === "VNPAY") {
                                $_SESSION['InfSubmitPay'] = [$Total,$OrderId];
                        
                                if($Completed = true) {
                           
                                    $CreateVNPAY = $this -> CartModel->CreateVNPAY($OrderId, $BankName, $TransactionId, $TransactionStatus, $Price, $DateTimePayment);
                               
                                    $GetIdCart = $this->CartModel->GetIdCart($CustomerId);

                                    $result_GetIdCart = sqlsrv_fetch_array($GetIdCart, SQLSRV_FETCH_ASSOC);

                                    $CartId = $result_GetIdCart['Id'];

                                    $DeleteCartDetail = $this->CartModel->DeleteCartDetail($CartId);

                                    $checkTransactionStatusVNPAY = $this->CartModel->checkTransactionStatusVNPAY($OrderId);

                                    $result_checkTransactionStatusVNPAY = sqlsrv_fetch_array($checkTransactionStatusVNPAY);

                                    $PaymentStatus = $result_checkTransactionStatusVNPAY['TransactionStatus'];
                                
                                    $_SESSION['ShowVNPAY'] = [$OrderId,$CustomerName,$PhoneNumber,$Address,$PaymentMethod,$PaymentStatus];
                          
                                    $this->DeleteCartSESSION();

                                    $this->DeleteUpdateTransactionIdSESSION();
                                                                   
                                    header('location: /MVC_LUANVAN/vnpay_php/vnpay_pay.php');

                                }else{
                                    echo 'tu tu sua' ;
                                    setcookie('errorCompleted', "errorCompleted", time() + 2);
                                    header('location: /MVC_LuanVan/Cart/ShowBill');
                                    die();
                                }
                            }
                        } 
                    }else{
                        $WareHouseId = $_SESSION['accountTMP'][3];

                        $PaymentMethod =  $_POST['PaymentMethod'];
                    
                        $CreateOrder = $this->CartModel->CreateOrder(
                            $CustomerId, 
                            $CustomerName, 
                            $PhoneNumber,
                            $Email, 
                            $Address, 
                            $Note,
                            $PaymentMethod, 
                            $TmpTotal, 
                            $Total, 
                            $StaffId, 
                            $StoreId, 
                            $ShipStatus, 
                            $PaymentStatus, 
                            $CreatedTime, 
                            $LastUpdated
                        );
                        if($CreateOrder != null) {

                              $TransactionStatus = $PaymentStatus;
                              $TransactionId = 0 ;
                              $BankName = "NCB";
                              $Price = $Total;
                              $DateTimePayment = $CreatedTime;
                              $OrderId  = $CreateOrder;

                            for ($i = 0; $i < count($_POST['ProductId']); $i++) {
                                $ProductId = $_POST['ProductId'][$i];
                                $Path = $_POST['Path'][$i];
                                $ProductName = $_POST['ProductName'][$i];
                                $Quantity = $_POST['Quantity'][$i];
                                $ProducPrice = $_POST['ProducPrice'][$i];
                                if ($ProducPrice != "" && $ProductId != "" && $Quantity != "") {
                                
                                      $getProductWareHousesId = $this ->CartModel->getProductWareHousesId($ProductId, $WareHouseId);

                                      $result_getProductWareHousesId = sqlsrv_fetch_array($getProductWareHousesId, SQLSRV_FETCH_ASSOC);

                                      $ProductWarehouseId =   $result_getProductWareHousesId['Id'];

                                    $CreateOrderDetail = $this->CartModel->CreateOrderDetail(
                                        $OrderId, 
                                        $ProductId, 
                                        $Path, 
                                        $ProductName, 
                                        $Quantity, 
                                        $ProducPrice, 
                                        $CreatedTime, 
                                        $LastUpdated,
                                        $ProductWarehouseId
                                    );

                                      $getQuantityWareHouses = $this -> CartModel-> getQuantityWareHouses($ProductId, $WareHouseId);

                                      $result_getQuantityWareHouses = sqlsrv_fetch_array($getQuantityWareHouses, SQLSRV_FETCH_ASSOC);

                                    if($result_getQuantityWareHouses != false) {
                                        $QuantityTMP1 = $result_getQuantityWareHouses['Quantity'];
                                        $QuantityTMP = $QuantityTMP1 - $Quantity;
                                    }else{
                                        echo 'loivl';exit;
                                    }

                                    $updateQuantityOrderDetail = $this->CartModel->updateQuantityOrderDetail($ProductId, $WareHouseId, $QuantityTMP);
                                
                                }else {
                                     $Completed = true; 
                                }
                            }
                            if($PaymentMethod === "VNPAY") {
                            
                                $_SESSION['InfSubmitPay'] = [$Total,$OrderId];
                        
                                if($Completed = true) {
                           
                                    $CreateVNPAY = $this -> CartModel->CreateVNPAY($OrderId, $BankName, $TransactionId, $TransactionStatus, $Price, $DateTimePayment);
                         
                                    $_SESSION['ShowVNPAY'] = [$OrderId,$CustomerName,$PhoneNumber,$Address,$PaymentMethod];

                                    $this->DeleteCartSESSION();

                                    header('location: /MVC_LUANVAN/vnpay_php/vnpay_pay.php');

                                }else{
                                    echo 'tu tu sua' ;
                                    setcookie('errorCompleted', "errorCompleted", time() + 2);
                                    header('location: /MVC_LuanVan/Cart/ShowBill');
                                    die();
                                }
                            }
                        } 
                    }
                }elseif(isset($_POST['PaymentMethod']) && $_POST['PaymentMethod'] == 'DIRECT') {
                 
                    $WareHouseId = $_SESSION['accountTMP'][3];
                    $CreateOrder = $this -> CartModel -> CreateOrder(
                        $CustomerId, 
                        $CustomerName, 
                        $PhoneNumber,
                        $Email, 
                        $Address, 
                        $Note,
                        $PaymentMethod, 
                        $TmpTotal, 
                        $Total, 
                        $StaffId,
                        $StoreId,
                        $ShipStatus, 
                        $PaymentStatus, 
                        $CreatedTime, 
                        $LastUpdated
                    );

                    if($CreateOrder != null) {

                        $OrderId  = $CreateOrder;
                            
                        for ($i = 0; $i < count($_POST['ProductId']); $i++) {
                            $ProductId = $_POST['ProductId'][$i];
                            $Path = $_POST['Path'][$i];
                            $ProductName = $_POST['ProductName'][$i];
                            $Quantity = $_POST['Quantity'][$i];
                            $ProducPrice = $_POST['ProducPrice'][$i];

                            if ($ProducPrice != "" && $ProductId != "" && $Quantity != "") {

                                $getProductWareHousesId = $this ->CartModel->getProductWareHousesId($ProductId, $WareHouseId);

                                $result_getProductWareHousesId = sqlsrv_fetch_array($getProductWareHousesId, SQLSRV_FETCH_ASSOC);

                                $ProductWarehouseId =   $result_getProductWareHousesId['Id'];

                                $CreateOrderDetail = $this->CartModel->CreateOrderDetail(
                                    $OrderId, 
                                    $ProductId, 
                                    $Path, 
                                    $ProductName, 
                                    $Quantity, 
                                    $ProducPrice, 
                                    $CreatedTime, 
                                    $LastUpdated,
                                    $ProductWarehouseId,
                                );

                                $getQuantityWareHouses = $this -> CartModel-> getQuantityWareHouses($ProductId, $WareHouseId);

                                $result_getQuantityWareHouses = sqlsrv_fetch_array($getQuantityWareHouses, SQLSRV_FETCH_ASSOC);

                                if($result_getQuantityWareHouses != false) {
                                    $QuantityTMP1 = $result_getQuantityWareHouses['Quantity'];
                                    $QuantityTMP = $QuantityTMP1 - $Quantity;
                                }else{
                                    echo 'loivl';exit;
                                }

                                $updateQuantityOrderDetail = $this->CartModel->updateQuantityOrderDetail($ProductId, $WareHouseId, $QuantityTMP);
                            }
                            $Completed = true;
                        }

                        if($Completed === true) {
                            
                                $MoneyReceived = trim($_POST['MoneyReceived']);
                                $MoneyRefund = trim($_POST['MoneyRefund']);

                                $StatusPay = 1 ;

                                $CreateBillDirect = $this->CartModel->CreateBill($OrderId, $Total, $MoneyReceived, $MoneyRefund, $CreatedTime, $StatusPay);

                                $checkStatusPayBill = $this->CartModel->checkStatusPayBill($OrderId);

                                $result_checkStatusPayBill = sqlsrv_fetch_array($checkStatusPayBill);

                                $PaymentStatus = $result_checkStatusPayBill['StatusPay'] ;
                    
                                $_SESSION['ShowBill'] = [$OrderId,$CustomerName,$PhoneNumber,$Address,$PaymentMethod,$PaymentStatus];
                                
                                $this->DeleteCartSESSION();
                        
                            if ($CreateBillDirect !== false) {
                                
                                $this->DeleteUpdateTransactionIdSESSION();

                                header('location: /MVC_LuanVan/Cart/ShowBill');
                            }
                        }

                    }
                }
            }
        }else{//thanh toán của khách hàng làm ơn đừng có bấm bậy vào sửa mệt lắm rồi 
          
            if (isset($_POST['update_click'])) {
                if ($_POST["CartDetailId"][0] === null) {
                    setcookie('SuccessTMP', "CartNull", time() + 2);
                    header('location: /MVC_LuanVan/Cart');
                }

                $CartDetailIdTMP = $_POST["CartDetailId"];
                $CartIdTMP = $_POST["CartId"];
                $ProductIdTMP = $_POST["ProductId"]; 
                $QuantityTMP = $_POST['Quantity'];
                $LastUpdated = 'getdate()';

                for ($i = 0; $i < count($_POST['ProductId']); $i++) {
                
                    $CartDetailId = $_POST['CartDetailId'][$i];
                    $CartId = $_POST["CartId"][$i];
                    $ProductId = $_POST["ProductId"][$i]; 
                    $Quantity = $_POST['Quantity'][$i];

                    if($Quantity === '0') {
                         $DelProductToCart = $this->CartModel->DelProductToCart($CartId, $CartDetailId);
                    }else{
                        $UpdatesToCart = $this->CartModel->UpdatesToCart($CartDetailId, $CartId, $ProductId, $Quantity, $LastUpdated);
                    }
                
                }

                if ($i == count($_POST['ProductId'])) {
                    setcookie('SuccessTMP', "updatesCartSuccess", time() + 2);
                    header('location: /MVC_LuanVan/Cart');
                    die();
                } 

            }
        
            if(isset($_POST['order_click'])) {

                if ($_POST["CartDetailId"][0] === null) {
                    setcookie('SuccessTMP', "CartNull2", time() + 2);
                    header('location: /MVC_LuanVan/Cart');
                }
            
                $CustomerId = $_SESSION['accountTMP'][0];
            
                $CheckCartExist = $this->CartModel->CheckCartExist($CustomerId);

                $result_CheckCartExist = sqlsrv_fetch_array($CheckCartExist, SQLSRV_FETCH_ASSOC);
                $this -> Views(
                    "CartView", [
                    "page"=>"InfoOrderView",
                    "GetCart" => $this->CartModel->GetCart($result_CheckCartExist['Id']),
                    ]
                );
            }
        
            if(isset($_POST['Submit_Pay'])) {

                $CustomerId = $_SESSION['accountTMP'][0];
                $CustomerName  = $_SESSION['accountTMP'][2];
                $Email = $_SESSION['accountTMP'][4];

                $NameOrder = $_POST['NameOrder'];
                $PhoneNumber = $_POST['PhoneNumber'];
                $Address = $_POST['Address'];
                $Note = 'null';
                $PaymentMethod = $_POST['PaymentMethod'];
                $TmpTotal = $_POST['total_all_addVoucher'];
                $Total = $_POST['total_all_addVoucher'];
                $StaffId = 'null';
                $StoreId = 'null';
                $ShipStatus = 0;
                $PaymentStatus = 0 ;
                $CreatedTime = 'getdate()';
                $LastUpdated = 'getdate()';
                
                if(isset($_POST['PaymentMethod']) && $_POST['PaymentMethod'] == 'COD') {

                    $ProductWarehouseId = 'null';

                    $CreateOrder = $this->CartModel->CreateOrder(
                        $CustomerId, 
                        $CustomerName, 
                        $PhoneNumber,
                        $Email, 
                        $Address, 
                        $Note,
                        $PaymentMethod, 
                        $TmpTotal, 
                        $Total, 
                        $StaffId, 
                        $StoreId, 
                        $ShipStatus, 
                        $PaymentStatus, 
                        $CreatedTime, 
                        $LastUpdated
                    );

                    if($CreateOrder != null) {

                        $OrderId  = $CreateOrder;
                        for ($i = 0; $i < count($_POST['ProductId']); $i++) {
                                $ProductId = $_POST['ProductId'][$i];
                                $Path = $_POST['Path'][$i];
                                $ProductName = $_POST['ProductName'][$i];
                                $Quantity = $_POST['Quantity'][$i];
                                $ProducPrice = $_POST['PromotionPrice'][$i];
                            if ($ProducPrice != "" && $ProductId != "" && $Quantity != "") {
                                $CreateOrderDetail = $this->CartModel->CreateOrderDetail(
                                    $OrderId, 
                                    $ProductId, 
                                    $Path, 
                                    $ProductName, 
                                    $Quantity, 
                                    $ProducPrice, 
                                    $CreatedTime, 
                                    $LastUpdated,
                                    $ProductWarehouseId
                                );
                            }else {
                                $Completed = true; 
                            }
                        }
                        if($Completed = true) {
                            $MoneyReceived = 0 ;
                            $MoneyRefund = 0 ;
                            $StatusPay = 0 ;
                            $CreateBill = $this -> CartModel->CreateBill($OrderId, $Total, $MoneyReceived, $MoneyRefund, $CreatedTime, $StatusPay);

                            $GetIdCart = $this->CartModel->GetIdCart($CustomerId);

                            $result_GetIdCart = sqlsrv_fetch_array($GetIdCart, SQLSRV_FETCH_ASSOC);

                            $CartId = $result_GetIdCart['Id'];

                            $checkStatusPayBill = $this->CartModel->checkStatusPayBill($OrderId);

                            $result_checkStatusPayBill = sqlsrv_fetch_array($checkStatusPayBill);

                            $PaymentStatus = $result_checkStatusPayBill['StatusPay'] ;

                            $DeleteCartDetail = $this->CartModel->DeleteCartDetail($CartId);
                    
                            $_SESSION['ShowBill'] = [$OrderId,$NameOrder,$PhoneNumber,$Address,$PaymentMethod,$PaymentStatus];
                        
                            if ($DeleteCartDetail !== false) {

                                $this->DeleteUpdateTransactionIdSESSION();

                                header('location: /MVC_LuanVan/Cart/ShowBill');
                                
                            } 

                        
                        }else{
                            echo 'tu tu sua' ;
                            setcookie('errorCompleted', "errorCompleted", time() + 2);
                            header('location: /MVC_LuanVan/Cart/ShowBill');
                            die();
                        }
                    }else{
                                echo ' loivddddl';exit;
                    }
                
                }elseif(isset($_POST['PaymentMethod']) && $_POST['PaymentMethod'] == 'VNPAY') {
                 
                    $PaymentMethod =  $_POST['PaymentMethod'];
                    
                    $ProductWarehouseId = 'null';

                    $CreateOrder = $this->CartModel->CreateOrder(
                        $CustomerId, 
                        $CustomerName, 
                        $PhoneNumber,
                        $Email, 
                        $Address, 
                        $Note,
                        $PaymentMethod, 
                        $TmpTotal, 
                        $Total, 
                        $StaffId, 
                        $StoreId, 
                        $ShipStatus, 
                        $PaymentStatus, 
                        $CreatedTime, 
                        $LastUpdated
                    );
                    if($CreateOrder != null) {

                        $TransactionStatus = $PaymentStatus;
                        $TransactionId = 0 ;
                        $BankName = "NCB";
                        $Price = $Total;
                        $DateTimePayment = $CreatedTime;
                        $OrderId  = $CreateOrder;

                        for ($i = 0; $i < count($_POST['ProductId']); $i++) {
                            $ProductId = $_POST['ProductId'][$i];
                            $Path = $_POST['Path'][$i];
                            $ProductName = $_POST['ProductName'][$i];
                            $Quantity = $_POST['Quantity'][$i];
                            $ProducPrice = $_POST['PromotionPrice'][$i];
                            if ($ProducPrice != "" && $ProductId != "" && $Quantity != "") {
                                $CreateOrderDetail = $this->CartModel->CreateOrderDetail(
                                    $OrderId, 
                                    $ProductId, 
                                    $Path, 
                                    $ProductName, 
                                    $Quantity, 
                                    $ProducPrice, 
                                    $CreatedTime, 
                                    $LastUpdated,
                                    $ProductWarehouseId
                                );
                            }else {
                                $Completed = true; 
                            }
                        }
                        if($PaymentMethod === "VNPAY") {
                            $_SESSION['InfSubmitPay'] = [$Total,$OrderId];
                        
                            if($Completed = true) {
                           
                                $CreateVNPAY = $this -> CartModel->CreateVNPAY($OrderId, $BankName, $TransactionId, $TransactionStatus, $Price, $DateTimePayment);
                               
                                $GetIdCart = $this->CartModel->GetIdCart($CustomerId);

                                $result_GetIdCart = sqlsrv_fetch_array($GetIdCart, SQLSRV_FETCH_ASSOC);

                                $CartId = $result_GetIdCart['Id'];

                                $DeleteCartDetail = $this->CartModel->DeleteCartDetail($CartId);

                                $checkTransactionStatusVNPAY = $this->CartModel->checkTransactionStatusVNPAY($OrderId);

                                $result_checkTransactionStatusVNPAY = sqlsrv_fetch_array($checkTransactionStatusVNPAY);

                                $PaymentStatus = $result_checkTransactionStatusVNPAY['TransactionStatus'];
                                
                                $_SESSION['ShowVNPAY'] = [$OrderId,$NameOrder,$PhoneNumber,$Address,$PaymentMethod ,$PaymentStatus];
                          
                                header('location: /MVC_LUANVAN/vnpay_php/vnpay_pay.php');

                            }else{
                                setcookie('errorCompleted', "errorCompleted", time() + 2);
                                header('location: /MVC_LuanVan/Cart/ShowBill');
                                die();
                            }
                        }
                    } 
                }
                $this -> Views(
                    "CartView", [
                    "page"=>"InfoOrderView",
                    
                    ]
                );
            }
      
        }

       
    }
    function addCartDetailToOrder()
    {
        $this -> Views(
            "CartView", [
               "page"=>"InfoOrderView",
               ]
        );
    }
    function ShowBill()
    {
        if(isset($_SESSION['UpdateTransactionId'])) {
            $TransactionId = $_SESSION['UpdateTransactionId'][0];
            $OrderId = $_SESSION['InfSubmitPay'][1];
            $TransactionStatus = $_SESSION['UpdateTransactionId'][2];
            $updateVNPAY = $this->CartModel->updateVNPAY($OrderId, $TransactionId, $TransactionStatus);
            
            if ($updateVNPAY) {

                $checkTransactionStatusVNPAY = $this->CartModel->checkTransactionStatusVNPAY($OrderId);

                $result_checkTransactionStatusVNPAY = sqlsrv_fetch_array($checkTransactionStatusVNPAY);

                $PaymentStatus = $result_checkTransactionStatusVNPAY['TransactionStatus'] ;

                if($PaymentStatus === 1) {
                     $updatePaymentStatusOrder = $this ->CartModel->updatePaymentStatusOrder($PaymentStatus, $OrderId);
                    if($updatePaymentStatusOrder) {
                        $_SESSION['ShowVNPAY'][5] = $PaymentStatus;
                    }
                }elseif($PaymentStatus === 0) {
                    $updatePaymentStatusOrder = $this ->CartModel->updatePaymentStatusOrder($PaymentStatus, $OrderId);
                    if($updatePaymentStatusOrder) {
                        $_SESSION['ShowVNPAY'][5] = $PaymentStatus;
                    }
                }
            } else{
                header('location: /MVC_LuanVan/Cart');
            }
        }
         
        $this -> Views(
            "CartView", [
            "page"=>"ShowBillView",
            ]
        );
    }
    function DeleteCartSESSION()
    {
         // Lấy dữ liệu từ biến $_SESSION['Cart']
         $cartData = $_SESSION['Cart'];

         // Chuyển đổi chuỗi JSON thành mảng trong PHP
         $cartArray = json_decode($cartData, true);

         // Xóa dữ liệu bên trong mảng (giữ lại biến Cart)
         $cartArray = array();
                        
         // Chuyển đổi mảng thành chuỗi JSON và cập nhật biến $_SESSION['Cart']
         $_SESSION['Cart'] = json_encode($cartArray);
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
