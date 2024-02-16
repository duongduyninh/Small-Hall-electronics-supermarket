<?php
require 'MVC/Models/PasswordHasher.php';

class User extends Controller
{
    public $UserModel;
    public function __construct()
    {
        $this ->UserModel = $this->Model('UserModel');
    }
    function index()
    {
        $this -> DeleteUpdateTransactionIdSESSION();
            $this -> DeleteInfSubmitPaySESSION();
        if(!isset($_SESSION['accountTMP'])) {
            header('location: /MVC_LUANVAN/Login');
        }
        $IdUser = trim($_SESSION['accountTMP'][0]);
        $IdUser1 = trim($_SESSION['accountTMP'][1]);
        
        $checkAcountLenght = count($_SESSION['accountTMP']);
     
        if($checkAcountLenght != 5) {
            header('location: /MVC_LUANVAN/');
        }
        $this->Views(
            "UserView", [
            "page"=>"infoUserView",
            "getInfoCustomer" => $this->UserModel->getInfoCustomer($IdUser),
            ]
        );
    }
    function UpdateUser()
    {
        $User_Name = trim($_POST['User_Name']);
        $User_PhoneNumber = trim($_POST['User_PhoneNumber']);
        $User_Email = trim($_POST['User_Email']);
        $User_Address = trim($_POST['User_Address']);
        $User_Pass = trim($_POST['User_Pass']);
        $User_PassNew = trim($_POST['User_PassNew']);
        $CustomerId = trim($_SESSION['accountTMP'][0]);
        $UserId = trim($_SESSION['accountTMP'][1]);
        
        if($User_Pass === "Null" || $User_PassNew === "Null") {
            
            $updataCustomerInfo = $this->UserModel->updataCustomerInfo($CustomerId, $User_Name, $User_PhoneNumber, $User_Email, $User_Address);
            if($updataCustomerInfo) {
                setcookie('True', "UpdateInfo", time() + 3);
                echo "True";
            }else{
                echo "False";
            }
        } else{
            
            if(isset($User_Pass) || $User_Pass != "") {

                $checkPassUser = $this->UserModel->checkPassUser($UserId, $User_Pass);
                if($checkPassUser === 1 ) {
                    
                    $hasher = new MDHearing\AspNetCore\Identity\PasswordHasher();
                    $User_PassHash = $hasher->hashPassword($User_PassNew);
                    
                    $updataUserInfo_PassNew = $this->UserModel->updataUserInfo_PassNew($UserId, $CustomerId, $User_Name, $User_PhoneNumber, $User_Email, $User_PassHash, $User_Address);

                    if($updataUserInfo_PassNew) {
                        setcookie('True', "UpdateInfo", time() + 3);
                        echo "True";
                    }else {
                        echo "False";exit;
                    }
                }elseif($checkPassUser === 0 ) {
                    setcookie('False', "UpdateUserInfo_PassNew_False", time() +3);
                    echo "True";
                }

            }else{
                echo "False";
            }
        }
    }
    function InfoOrder($current_page = 1)
    {

        $IdUser = trim($_SESSION['accountTMP'][0]);

        $checkOrder = $this ->UserModel -> checkOrder($IdUser);

        $result_checkOrder = sqlsrv_fetch_array($checkOrder);

        $checkOrderExist = $result_checkOrder['checkOrder'];

        $limit = 10;
        
        $total_records = $this->UserModel->getCountOrders($IdUser);

        $total_page = ceil($total_records / $limit);

        if ($current_page > $total_page) {
            $current_page = $total_page;
        }
        else if ($current_page < 1) {
            $current_page = 1;
        }

        // Tìm Start
        $start = ($current_page - 1) * $limit;

        $this->Views(
            "UserView", [
            "page"=>"infoOrderUserView",
            "checkOrder" => $checkOrderExist,
            "getInfoCustomer" => $this->UserModel->getInfoCustomer($IdUser),
            "getOrderInfoUser"=>$this->UserModel->getOrderInfoUser($IdUser, $start, $limit),
            "currentPage" => $current_page,
            "totalPage" => $total_page
            ]
        );
    }
    public function OrderDetail($id)
    {
        $CustomerId = $_SESSION['accountTMP'][0];

        $OrderDetail = $this->UserModel->getOrderDetailInfoUser($id);

        $getTotalOrder = $this->UserModel->getTotalOrder($CustomerId, $id);

        $result_getTotalOrder = sqlsrv_fetch_array($getTotalOrder, SQLSRV_FETCH_ASSOC);
        
        echo "<table>
        <tr class='UserInfo_Order_right_tr_DetailOrder'>
            <th>Mã Sản Phẩm</th>
            <th></th>
            <th>Tên Sản Phẩm</th>
            <th>Số Lượng</th>
            <th>Giá Sản Phẩm</th>
            <th>Thành Tiền</th>
        <tr>";

        while ($row = sqlsrv_fetch_array($OrderDetail)) {
            $PriceProduct = $row["Price"];
            $Quantity = $row["Quantity"];
            $TotalPriceProduct = $PriceProduct * $Quantity;
            echo "
             <tr class='UserInfo_Order_right_tr_DetailOrder'>
                    <th>".$row["ProductId"]."</th>
                    <th><img height='100px' width='100px' src='".$row["Image"]."' > </th>
                    <th><a href='/MVC_LUANVAN/Product/ProductDetail/".$row["ProductId"]."'>".$row["ProductName"]."</a></th>
                    <th >".$Quantity."</th>
                    <th >".number_format($PriceProduct, 0, ',', '.') . '₫'."</th>
                    <th >".number_format($TotalPriceProduct, 0, ',', '.') . '₫'."</th>
                </tr>
            ";
        }

        echo  "</table";
        
        echo "<table>
        <tr class='UserInfo_Order_right_tr_DetailOrder'>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th>Thành Tiền : </th>
            <th style='color:red;' >".number_format($result_getTotalOrder["Total"], 0, ',', '.') . '₫'."</th>
        <tr>";
          echo  "</table";
          echo $result_getTotalOrder["Total"];
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
