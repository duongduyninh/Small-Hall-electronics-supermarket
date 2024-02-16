<?php 
class SearchModel extends DB
{
    function SearchStaff($KeySearch,$WareHouseId)
    {
        $sql = "SELECT TOP 16 ProductWareHouses.[ProductId], 
                              ProductWareHouses.[Quantity],
                              Products.[Name],
                              ProductImages.[Path]
                FROM [ProductWareHouses]
                INNER JOIN ProductImages ON ProductWareHouses.ProductId = ProductImages.ProductId
                INNER JOIN Products ON ProductWareHouses.ProductId = Products.Id
                WHERE ProductWareHouses.WareHouseId = '$WareHouseId' 
                AND Products.[Name] LIKE '%$KeySearch%' 
                AND ProductImages.[Order] = 1
                ";
                // echo $sql;
        return sqlsrv_query($this->conn, $sql); 
        
    }
    function Search($KeySearch)
    {
        $sql = "SELECT TOP 16 Products.* , 
                              ProductImages.[Path]
                FROM [Products]
                INNER JOIN ProductImages ON Products.Id = ProductImages.ProductId
                WHERE  Products.[Name] LIKE N'%$KeySearch%'
                   AND ProductImages.[Order] = 1
                ";
        return sqlsrv_query($this->conn, $sql); 
    }
    function CountSearch($KeySearch)
    {
        $sql = "SELECT COUNT(*) AS CountSearch
                FROM [Products]
                WHERE  Products.[Name] LIKE N'%$KeySearch%'
                ";
          $stmt = sqlsrv_query($this->conn, $sql);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }
        $CountSearch = 0;
        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
             $CountSearch += $row['CountSearch'];
        }
        return $CountSearch;
    }
    function KeySearch($KeySearch , $skip = 0, $take = 8)
    {
            $sql = "SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName,
                        CASE
                            WHEN Products.promotionPrice IS NOT NULL THEN ((Products.Price - Products.promotionPrice) / Products.Price) * 100
                            ELSE NULL
                        END AS DiscountPercentage
                    FROM 
                        Products 
                    LEFT JOIN ProductImages ON Products.[Id] = ProductImages.[ProductId]
                    JOIN Categories ON Categories.[Id] = Products.[CategoryId]
                    WHERE 
                        Products.[Name] LIKE N'%$KeySearch%'
                        AND ProductImages.[Order] = 1 
                    ORDER BY 
                        DiscountPercentage DESC,
                        Products.[Id]
                        OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
                     ";
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
    function CategorySearch()
    {
        $sql = "";
        return sqlsrv_query($this->conn, $sql); 
    }
}
