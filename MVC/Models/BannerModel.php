<?php
class BannerModel extends DB
{
    public function getAllBanners()
    {
        $sql = "SELECT * FROM Banners";

        $stmt = sqlsrv_query($this->conn, $sql);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }

        $arr = [];
        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
            $arr[] = $row;
        }

        return $arr;
    }
   
}