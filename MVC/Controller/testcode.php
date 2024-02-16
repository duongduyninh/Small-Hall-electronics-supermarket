<?php 
        require_once '../MVC_luanVan/vendor/autoload.php';
        use Ramsey\Uuid\Uuid;

class testcode extends Controller
{
    public function __construct()
    {
        // Tạo một UUID v4 (ngẫu nhiên) mới
        $uuid = Uuid::uuid4();

        // Chuyển đối tượng UUID thành chuỗi
        $uuidString = $uuid->toString();

        // In ra chuỗi UUID
        echo $uuidString;

    }
    function index()
    {
      
    }
}
?>
