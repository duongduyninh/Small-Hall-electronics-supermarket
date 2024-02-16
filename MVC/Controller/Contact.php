<?php 
class Contact extends Controller
{
    public function __construct()
    {
      
    }
    function index()
    {
        $this-> Views(
            "ContactView", [
            "page"=>"ContactDetail",
            
            ]
        );
    }
}
?>
