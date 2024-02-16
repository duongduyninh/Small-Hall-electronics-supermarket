<?php
class BrandModel extends DB
{
    public function getAllBrands()
    {
        $query = "SELECT * FROM Brands WHERE Status = '1'";

        $stmt = sqlsrv_query($this->conn, $query);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }

        $arr = [];
        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
            $arr[] = $row;
        }

        return $arr;
    }
    public function getAllBrandsByCategoryId($categoryId)
    {
        $query = "SELECT * FROM CategoryBrands
                    JOIN Brands on CategoryBrands.BrandId = Brands.Id
                    WHERE CategoryId = '$categoryId'
                    AND [Status] = '1'"; 
                    // echo $query;die;

        $stmt = sqlsrv_query($this->conn, $query);

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
