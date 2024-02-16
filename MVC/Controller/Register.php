<?php 
require 'vendor/autoload.php';
require 'MVC/Models/PasswordHasher.php';

use Ramsey\Uuid\Uuid;
class Register extends Controller
{
    public $RegisterModel;
    public function __construct()
    {
        $this->RegisterModel = $this->Model("RegisterModel");
        
        date_default_timezone_set('Asia/Ho_Chi_Minh');
    }
    function index()
    {
     
        if(isset($_POST['submit'])) {
            $Name = $_POST['Name'];
            $Email = $_POST['Email'];
            $PasswordTMP = $_POST['password'];
            $ConfirmPassword = $_POST['ConfirmPassword'];

            $hasher = new MDHearing\AspNetCore\Identity\PasswordHasher();
            $Password = $hasher->hashPassword($PasswordTMP);
           
            $CheckUser = $this->RegisterModel->CheckUser($Email);
      
            if (sqlsrv_has_rows($CheckUser)) {
                setcookie('error', "AccountConsist", time() + 1);
                header('location: /MVC_LUANVAN/Register');
                die();
            } elseif($PasswordTMP != $ConfirmPassword) {
                setcookie('error', "ConfirmPasswordError", time() + 1);
                header('location: /MVC_LUANVAN/Register');
                die();
            }else {
                $IdTMP = Uuid::uuid4();
                $Id = $IdTMP->toString();
        
                $CreateUsers = $this->RegisterModel->CreateUsers($Id, $Name, $Email, $Password);

                if ($CreateUsers === false) {
                    setcookie('error', "errorSystem", time() + 1);
                    header('location: /MVC_LUANVAN/Register');
                    die();
                } else {
                    $IdCustomerTMP = Uuid::uuid4();
                    $IdCustomer = $IdCustomerTMP->toString();
                    
                    $CreateCustomer = $this->RegisterModel->CreateCustomer($IdCustomer, $Id, $Name, $Email, $CreatedTime);

                    if($CreateCustomer === false) {
                         setcookie('error', "errorSystem", time() + 1);
                        header('location: /MVC_LUANVAN/Register');
                        die();
                    }else{
                        setcookie('success', "AccountSuccess", time() + 1);
                        header('location: /MVC_LUANVAN/Login');
                        die();
                    }
                   
                }
               
            }
        }
        $this -> Views(
            "RegisterView", [
            ]
        );
    }
    function demo()
    {
       
    }
}
?>
