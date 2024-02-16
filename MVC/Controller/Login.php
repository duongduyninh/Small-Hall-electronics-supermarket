<?php 
use Ramsey\Uuid\Uuid;
class Login extends Controller
{
    public $LoginModel;
    public function __construct()
    {
        $this->LoginModel = $this->Model("LoginModel");
    }
    function index()
    {
        if(isset($_SESSION['accountTMP'])) {
            session_destroy();
        }
        if(isset($_POST['submit'])) {

            $User = $_POST['username'];
            $Pass = $_POST['password'];
            $CheckUser = $this->LoginModel->checkUser($User);

            if ($CheckUser === false) {
                
                setcookie('error', "errorSystem", time() + 1);
                header('location: /MVC_LUANVAN/Login');
                die();

            } else {
                
                

                $result_CheckUser = sqlsrv_fetch_array($CheckUser, SQLSRV_FETCH_ASSOC);
    
                if ($result_CheckUser === null) {

                    setcookie('error', "AccountNULL", time() + 1);
                    header('location: /MVC_LUANVAN/Login');
                    die();

                } else {
                    $login = $this->LoginModel->CheckPassUser($User, $Pass);

                    if($login === 0) {

                        setcookie('error', "AccountFalse", time() + 1);
                        header('location: /MVC_LUANVAN/Login');
                        die();

                    }elseif($login === 1) {

                        $CheckRoles=$this->LoginModel->CheckRoles($User);

                        $result_CheckRoles = sqlsrv_fetch_array($CheckRoles, SQLSRV_FETCH_ASSOC);

                        // var_dump($result_CheckRoles);exit;

                        if($result_CheckRoles === null) {
                            
                            $SlectUser = $this->LoginModel->SlectUser($User);

                            $result_SlectUser = sqlsrv_fetch_array($SlectUser, SQLSRV_FETCH_ASSOC);

                            $SlectCustomer = $this->LoginModel->SlectCustomer($result_SlectUser['Id']);

                            $result_SlectCustomer = sqlsrv_fetch_array($SlectCustomer, SQLSRV_FETCH_ASSOC);
                         
                            
                            if ($result_SlectUser !== false) {
                                $_SESSION["accountTMP"] = [$result_SlectCustomer['Id'],$result_SlectCustomer['UserId'] , $result_SlectCustomer['Name'] ,$result_SlectCustomer['Phone'] ,$result_SlectCustomer['Email'] ];
                                header('location: /MVC_LUANVAN/');
                            } else {
                                setcookie('error', "errorSystem", time() + 1);
                                header('location: /MVC_LUANVAN/Login');
                                die();
                            }
                        }else{

                            $SlectUser = $this->LoginModel->SlectUser($User);

                            $result_SlectUser = sqlsrv_fetch_array($SlectUser, SQLSRV_FETCH_ASSOC);

                            $SlectStaff = $this->LoginModel->SlectStaff($result_SlectUser['Id']);

                            $result_SlectStaff = sqlsrv_fetch_array($SlectStaff, SQLSRV_FETCH_ASSOC);

                            if ($result_SlectStaff !== false) {
                                $_SESSION["accountTMP"] = [$result_SlectUser['Id'],$result_SlectStaff['UserId'],$result_SlectStaff['Name'],$result_SlectStaff['WareHouseId'],$result_SlectStaff['Email'],$result_CheckRoles['StaffId'],$result_CheckRoles['Name']];
                                header('location: /MVC_LUANVAN/');
                            } else {
                                setcookie('error', "errorSystem", time() + 1);
                                header('location: /MVC_LUANVAN/Login');
                                die();
                            }
                        }
                    }
                }
            }
        }
        $this -> Views(
            "LoginView", [        
            ]
        );
    }
}
?>
