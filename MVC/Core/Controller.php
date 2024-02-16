<?php 
class Controller
{
    public function Model($Model)
    {
        include_once "./MVC/Models/".$Model.".php";
        return new $Model;
    }
    function Views($View,$data = [])
    {
        include_once "./MVC/Views/".$View.".php";
    }
}
?>
