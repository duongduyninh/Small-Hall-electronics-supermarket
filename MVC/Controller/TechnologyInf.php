<?php 
class TechnologyInf extends Controller
{
    public $NewModel;
    public function __construct()
    {
        $this->NewModel = $this->Model("NewModel");
    }
    
    function index($current_page = 1)
    {
        $limit = 5;
        
        $total_records = $this->NewModel->getCount();

        $total_page = ceil($total_records / $limit);

        if ($current_page > $total_page) {
            $current_page = $total_page;
        }
        else if ($current_page < 1) {
            $current_page = 1;
        }

        // echo $current_page;

        // Tìm Start
        $start = ($current_page - 1) * $limit;

        $news = $this->NewModel->getAllSkipTake($start, $limit);
        
        $this -> Views(
            "TechnologyInfView", [
                "page" => "news/index",
                "news" => $news,
                "currentPage" => $current_page,
                "totalPage" => $total_page
            ]
        );
    }

    function detail($id)
    {
        $new = $this->NewModel->getNewById($id);
     
        $this -> Views(
            "TechnologyInfView", [
                "page" => "news/detail",
                "new" => $new
            ]
        );
    }
}
?>