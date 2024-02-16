<?php 
class ProductModel extends DB
{
    function Product_New_Home()
    {
        $sql="  SELECT TOP 16 Products.*,
                              ProductImages.id AS imageId,
                              ProductImages.[Path],
                              Categories.[Name] AS CategorieName
                FROM Products
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                LEFT JOIN Categories ON Products.CategoryId = Categories.Id
                WHERE ProductImages.[Order] = 1 AND Products.[Status] = 1
                ORDER BY Products.CreatedTime DESC ";
        return sqlsrv_query($this->conn, $sql); 
    }
    function ProductSelling_Home()
    {
        $sql="SELECT OD.ProductId,
                COUNT(OD.ProductId) AS TotalOccurrences,
                SUM(Quantity) AS TotalQuantity,
                MAX(Products.[Name]) AS [Name],
                MAX(Products.[Price]) AS [Price],
                MAX(Products.[PromotionPrice]) AS [PromotionPrice],
                MAX(Products.[CategoryId]) AS [CategoryId],
                MAX(Products.[Status]) AS [Status],
                MAX(Categories.[Name]) AS [CategorieName],
				MAX(ProductImages.[Id]) AS ImageId,
				MAX(ProductImages.[Path]) AS ImagePath
            FROM [OrderDetails] OD
            JOIN Products ON OD.[ProductId] = Products.[Id]
            JOIN Categories ON Products.[CategoryId] = Categories.[Id]
			LEFT JOIN 
				ProductImages  ON Products.[Id] = ProductImages.[ProductId]
            WHERE Products.[Status] = 1 AND Products.[Status] = 1
            GROUP BY OD.ProductId
            ORDER BY TotalQuantity DESC  ";

        return sqlsrv_query($this->conn, $sql); 
    }
    function Screen_Home($Screen_Home_Price, $Code_Screen)
    {
        $sql="  SELECT TOP 16 Products.*,
                              ProductImages.id AS imageId,
                              ProductImages.[Path],
                              Categories.[Name] AS CategorieName,
                              Categories.[Id] AS CategorieId
                FROM Products
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                LEFT JOIN Categories ON Products.CategoryId = Categories.Id
                WHERE ProductImages.[Order] = 1
                  AND Products.[Status] = 1
                 AND Products.[Price] >= $Screen_Home_Price
                 AND Categories.[Id] = $Code_Screen
                ORDER BY Products.CreatedTime DESC ";
        return sqlsrv_query($this->conn, $sql); 
    }
    function Laptop_Home($Laptop_Home_Price, $Code_Laptop)
    {
        $sql="  SELECT TOP 16 Products.*,
                              ProductImages.id AS imageId,
                              ProductImages.[Path],
                              Categories.[Name] AS CategorieName,
                              Categories.[Id] AS CategorieId
                FROM Products
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                LEFT JOIN Categories ON Products.CategoryId = Categories.Id
                WHERE ProductImages.[Order] = 1
                  AND Products.[Status] = 1
                 AND Products.[Price] >= $Laptop_Home_Price
                 AND Categories.[Id] = $Code_Laptop
                ORDER BY Products.CreatedTime DESC ";
        return sqlsrv_query($this->conn, $sql); 
    }
    function GetInfProduct($ProductId)
    {
         $sql="SELECT Products.*,
                        ProductImages.Path
               FROM Products 
               LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
               WHERE Products.Id = '$ProductId' AND ProductImages.[Order] = 1 ";
               
        return sqlsrv_query($this->conn, $sql); 
 
    }
    function getImageByProductId($id)
    {
        $sql = "SELECT *
                FROM ProductImages 
                WHERE Id='$id' AND Order='1' ";
                
        return sqlsrv_query($this->conn, $sql); 
    }
    function CheckCodeWareHouseProduct($ProductId,$WareHouseId)
    {
        $sql = "SELECT ProductWareHouses.[Quantity] , ProductWareHouses.[WareHouseId]
                FROM ProductWareHouses
                WHERE ProductId = '$ProductId' AND WareHouseId = '$WareHouseId'";
                
        return sqlsrv_query($this->conn, $sql);
    }
    function Detailproduct($IdProduct)
    {
        $sql = "SELECT *
                FROM Products
                WHERE [Id] = '$IdProduct'";
                
        return sqlsrv_query($this->conn, $sql);
    }
    function getImgDetailproduct($IdProduct)
    {
        $sql = "SELECT *
                FROM ProductImages
                WHERE [ProductId] = '$IdProduct' 
                AND [Order] IN (1, 2, 3, 4)
                ORDER BY [Order] ASC";
                
        return sqlsrv_query($this->conn, $sql);
    }
    function getProductDetailedConfigs($IdProduct)
    {
        $sql = "SELECT ProductDetailedConfigs.[ConfigId] ,
                        ProductDetailedConfigs.[Value] ,
                        DetailedConfigs.[Name]
                FROM ProductDetailedConfigs
				INNER JOIN DetailedConfigs ON ProductDetailedConfigs.[ConfigId] = DetailedConfigs.[Id]
                WHERE [ProductId] = '$IdProduct'";
        return sqlsrv_query($this->conn, $sql);
    }
    function getProductWareHouses($IdProduct)
    {
        $sql = "SELECT ProductWareHouses.[WareHouseId] ,
                        ProductWareHouses.[Quantity] ,
                        WareHouses.[Name] ,
                        WareHouses.[Address] 
                FROM ProductWareHouses
				INNER JOIN WareHouses ON ProductWareHouses.[WareHouseId] = WareHouses.[Id]
                WHERE [ProductId] = '$IdProduct' 
                AND quantity >= 0";
        return sqlsrv_query($this->conn, $sql);
    }
    
    function getCountProductsByCategoryId($id)
    {
        $query = "SELECT COUNT(*) FROM Products WHERE CategoryId='$id'";

        $result = sqlsrv_query($this->conn, $query);

        return sqlsrv_fetch_array($result)[0];
    }
    function getProductsByCategoryIdSortedByBestDiscount($id, $brands, $skip = 0, $take = 10,)
    {
        if($brands != null && count($brands) > 0) {

            $brandsFilter = implode(',', $brands);

            $sql1="SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName,
                    CASE
                        WHEN Products.promotionPrice IS NOT NULL THEN ((Products.Price - Products.promotionPrice) / Products.Price) * 100
                        ELSE NULL
                    END AS DiscountPercentage
                FROM 
                    Products 
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                JOIN Categories ON Categories.Id = Products.CategoryId
                JOIN CategoryBrands ON CategoryBrands.[Id] = Products.[CategoryBrandId]
                WHERE 
                    ProductImages.[Order] = 1 
                    AND Products.[Status] = 1
                     AND Products.[CategoryId] = '$id'
                    AND CategoryBrands.[BrandId] in ($brandsFilter) 
                ORDER BY 
                     DiscountPercentage DESC,
                     Products.[Id]
                      OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";
        }else{
            $sql1="SELECT Products.*,
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
                        ProductImages.[Order] = 1 
                        AND Products.[Status] = 1
                        AND Products.[CategoryId] = '$id'
                    ORDER BY 
                        DiscountPercentage DESC,
                        Products.[Id]
                        OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";
        }
        $stmt = sqlsrv_query($this->conn, $sql1);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }

        $arr = [];
        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
            $arr[] = $row;
        }

        return $arr;
    }
    function getProductsByCategoryIdSortedByDESC($id, $brands , $skip = 0, $take = 10)
    {
        if($brands != null && count($brands) > 0) {
             $brandsFilter = implode(',', $brands);
            $sql1="SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName
                FROM 
                    Products 
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                JOIN Categories ON Categories.Id = Products.CategoryId
                JOIN CategoryBrands ON CategoryBrands.[Id] = Products.[CategoryBrandId]
                WHERE 
                    ProductImages.[Order] = 1 
                    AND Products.[Status] = 1
                    AND Products.[CategoryId] = '$id'
                    AND CategoryBrands.[BrandId] in ($brandsFilter) 
                ORDER BY 
                     Products.[Price] DESC
                      OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";

        }else{
            $sql1="SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName
                FROM 
                    Products 
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                JOIN Categories ON Categories.Id = Products.CategoryId
                WHERE 
                    ProductImages.[Order] = 1 
                    AND Products.[Status] = 1
                    AND CategoryId = '$id'
                ORDER BY 
                     Products.[Price] DESC
                      OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";

        }
      
        $stmt = sqlsrv_query($this->conn, $sql1);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }

        $arr = [];
        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
            $arr[] = $row;
        }

        return $arr;
    }
    function getProductsByCategoryIdSortedByASC($id, $brands , $skip = 0, $take = 10)
    {
        if($brands != null && count($brands) > 0) {
             $brandsFilter = implode(',', $brands);
            $sql1="SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName
                FROM 
                    Products 
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                JOIN Categories ON Categories.Id = Products.CategoryId
                JOIN CategoryBrands ON CategoryBrands.[Id] = Products.[CategoryBrandId]
                WHERE 
                    ProductImages.[Order] = 1 
                    AND Products.[Status] = 1
                    AND Products.[CategoryId] = '$id'
                    AND CategoryBrands.[BrandId] in ($brandsFilter) 
                ORDER BY 
                     Products.[Price] ASC
                      OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";

        }else{
            $sql1="SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName
                FROM 
                    Products 
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                JOIN Categories ON Categories.Id = Products.CategoryId
                WHERE 
                    ProductImages.[Order] = 1 
                    AND Products.[Status] = 1
                    AND CategoryId = '$id'
                ORDER BY 
                     Products.[Price] ASC
                      OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";

        }
      
        $stmt = sqlsrv_query($this->conn, $sql1);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }

        $arr = [];
        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
            $arr[] = $row;
        }

        return $arr;
    }
    function getProductsByCategoryIdSortedByBestSales($id,  $brands , $skip = 0, $take = 10)
    {
        if($brands != null && count($brands) > 0) {
            $brandsFilter = implode(',', $brands);
             
            $sql1="SELECT Products.Id, Products.[Name],
                            COUNT(od.ProductId) as TotalOrderDetails,
                            MAX(Categories.[Name]) as CategoryName,
                            Sum(od.Quantity) as Sales,
                            MAX(ProductImages.[Path]) AS [Path],
                                        MAX(Products.[Price]) AS [Price],
                                        MAX(Products.[PromotionPrice]) AS [PromotionPrice],
                                        MAX(Products.[CategoryId]) AS [CategoryId],
                                        MAX(Products.[Status]) AS [Status]
                        FROM OrderDetails od
                        RIGHT join Products ON Products.[Id] = od.[ProductId]
                        JOIN Categories on Categories.[id] = Products.[CategoryId]
                        JOIN ProductImages on ProductImages.[ProductId] = Products.[Id]
                        LEFT JOIN CategoryBrands ON CategoryBrands.[Id] = Products.[CategoryBrandId]
                        WHERE Products.[CategoryId] = $id
                            AND Products.[Status] = 1
                            AND CategoryBrands.[BrandId] in ($brandsFilter) 
                        group by Products.[Id], Products.[Name]
                        ORDER BY TotalOrderDetails DESC
                        OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";
        }else{
            $sql1="SELECT Products.Id, Products.[Name],
                            COUNT(od.ProductId) as TotalOrderDetails,
                            MAX(Categories.[Name]) as CategoryName,
                            Sum(od.Quantity) as Sales,
                            MAX(ProductImages.[Path]) AS [Path],
                                        MAX(Products.[Price]) AS [Price],
                                        MAX(Products.[PromotionPrice]) AS [PromotionPrice],
                                        MAX(Products.[CategoryId]) AS [CategoryId],
                                        MAX(Products.[Status]) AS [Status]
                        FROM OrderDetails od
                        RIGHT join Products ON Products.[Id] = od.[ProductId]
                        JOIN Categories on Categories.[id] = Products.[CategoryId]
                        JOIN ProductImages on ProductImages.[ProductId] = Products.[Id]
                        WHERE Products.[CategoryId] = $id
                             AND Products.[Status] = 1
                        group by Products.[Id], Products.[Name]
                        ORDER BY TotalOrderDetails DESC
                        OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";
        }
        
        $stmt = sqlsrv_query($this->conn, $sql1);

        if ($stmt === false) {
            die(print_r(sqlsrv_errors(), true));
        }

        $arr = [];
        while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
            $arr[] = $row;
        }

        return $arr;
    }
    function getProductsByCategoryIdSortedByNew($id, $brands, $skip = 0, $take = 10)
    {
        if($brands != null && count($brands) > 0) {

             $brandsFilter = implode(',', $brands);
            $sql1="SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName
                FROM 
                    Products 
                LEFT JOIN ProductImages ON Products.[Id] = ProductImages.[ProductId]
                JOIN Categories ON Categories.[Id] = Products.[CategoryId]
                JOIN CategoryBrands ON CategoryBrands.[Id] = Products.[CategoryBrandId]
                WHERE 
                    ProductImages.[Order] = 1 
                    AND Products.[Status] = 1
                    AND .Products.[CategoryId] = '$id'
                    AND CategoryBrands.[BrandId] in ($brandsFilter) 
                ORDER BY 
                     Products.[Id] DESC
                      OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";
        }else{

            $sql1="SELECT Products.*,
                        ProductImages.[Path],
                        Categories.[Name] as CategoryName
                FROM 
                    Products 
                LEFT JOIN ProductImages ON Products.Id = ProductImages.ProductId
                JOIN Categories ON Categories.Id = Products.CategoryId
                WHERE 
                    ProductImages.[Order] = 1 
                    AND Products.[Status] = 1
                    AND CategoryId = '$id'
                ORDER BY 
                     Products.[Id] DESC
                      OFFSET  $skip ROWS FETCH NEXT $take ROWS ONLY
               ";
        }
       

        $stmt = sqlsrv_query($this->conn, $sql1);

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
?>
