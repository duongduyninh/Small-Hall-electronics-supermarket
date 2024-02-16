<?php
class CartModel extends DB
{

    function CheckCartExist($CustomerId)
    {
        $sql = "SELECT *
        FROM Carts
        WHERE CustomerId = '$CustomerId' ";
        return sqlsrv_query($this->conn, $sql); 
    }
    function CreatCart($CustomerId)
    {
        $sql = "INSERT INTO Carts ( CustomerId)
                         VALUES ('$CustomerId')";
        return sqlsrv_query($this->conn, $sql); 
    }
    function GetCart($CartId)
    {
        $sql = "SELECT  CartDetails.*,
                        ProductImages.id AS imageId,
                        ProductImages.Path
                FROM CartDetails
                LEFT JOIN ProductImages ON CartDetails.ProductId = ProductImages.ProductId
                WHERE CartDetails.CartId = '$CartId' AND ProductImages.[Order] = 1 ";

                
                
        return sqlsrv_query($this->conn, $sql); 
    }
    function GetProductInCart($CartId,$ProductId)
    {
        $sql = "SELECT *
        FROM CartDetails
        WHERE CartId = '$CartId' AND ProductId = '$ProductId'";
        return sqlsrv_query($this->conn, $sql); 
    }
    function GetQualityInCart($CartId)
    {
        $sql = "SELECT SUM(Quantity) AS total_quantity
                FROM CartDetails
                WHERE CartId = '$CartId' ";
        return sqlsrv_query($this->conn, $sql); 

    }
    function creatCartDetail(
        $CartId,
        $ProductId,
        $Quantity, 
        $ProductName,
        $ProducPrice,
        $PromotionPrice,
        $CreatedTime,
        $LastUpdated,
        $Status,
    ) {
    
        if($PromotionPrice !== 'null') {
            $PromotionPrice = "'".$PromotionPrice."'";
        }

        $sql ="INSERT INTO CartDetails (
                    CartId,
                    ProductId,
                    Quantity,
                    ProductName,
                    ProducPrice,
                    PromotionPrice,
                    ProductImage,
                    CreatedTime,
                    LastUpdated,
                    [Status]
                )
                VALUES (
                    '$CartId',
                    '$ProductId',
                    '$Quantity',
                    N'$ProductName',
                    '$ProducPrice',
                    $PromotionPrice,
                    N'Chưa Cập Nhật',
                    $CreatedTime,
                    $LastUpdated,
                    '$Status')
                ";
                echo $sql;
        return sqlsrv_query($this->conn, $sql); 
    }
    function UpdateCartDetail(
        $CartId,
        $ProductId,
        $Quantity, 
        $LastUpdated,
        $Status,
    ) {
        $sql ="UPDATE CartDetails
        SET Quantity = $Quantity,
        LastUpdated = $LastUpdated,
        [Status] = '$Status'
        WHERE CartId = '$CartId' AND ProductId = '$ProductId'";

        return sqlsrv_query($this->conn, $sql); 
        
    }
    function DelProductToCart($CartId,$Id)
    {
        
        $sql = "DELETE FROM CartDetails
                WHERE CartId = '$CartId' AND Id = '$Id'";
        return sqlsrv_query($this->conn, $sql); 
        
    }
    function UpdatesToCart($CartDetailId, $CartId, $ProductId, $Quantity, $LastUpdated)
    {
          $sql = "UPDATE CartDetails
                    SET Quantity = $Quantity  
                    WHERE Id = '$CartDetailId'  AND CartId = '$CartId'  AND ProductId = '$ProductId' ";
        return sqlsrv_query($this->conn, $sql); 
    }
    function CheckQuantityWareHouseAll($ProductId)
    {
        $sql= "SELECT SUM(Quantity) AS TotalQuantity
                FROM ProductWareHouses
                WHERE ProductId = '$ProductId'";
        // echo $sql ;exit();
        return sqlsrv_query($this->conn, $sql); 
    }
    function CreateOrder(
        $CustomerId, 
        $CustomerName, 
        $PhoneNumber,
        $Email, 
        $Address, 
        $Note,
        $PaymentMethod, 
        $TmpTotal, 
        $Total, 
        $StaffId,
        $StoreId,
        $ShipStatus, 
        $PaymentStatus, 
        $CreatedTime, 
        $LastUpdated
    ) {

        if($CustomerId !== 'null') {
            $CustomerId = "'".$CustomerId."'";
        }
        
        if($StaffId !== 'null') {
            $StaffId = "N'".$StaffId."'";
        }  
        
        if($StoreId !== 'null') {
            $StoreId = "'".$StoreId."'";
        }


        $sql = "INSERT INTO [Orders] (
             [CustomerId],
             [CustomerName],
             [PhoneNumber],
             [Email],
             [Address],
             [Note],
             [PaymentMethod], 
             [TmpTotal], 
             [Total], 
             [StaffId],
             [StoreId],
             [ShipStatus], 
             [PaymentStatus], 
             [CreatedTime], 
             [LastUpdated]
            )
            VALUES (
                 $CustomerId, 
                N'$CustomerName', 
                 $PhoneNumber,
                '$Email', 
                N'$Address', 
                 $Note,
                '$PaymentMethod', 
                '$TmpTotal', 
                '$Total', 
                 $StaffId,
                 $StoreId,
                 $ShipStatus, 
                 $PaymentStatus, 
                 $CreatedTime, 
                 $LastUpdated)";
            //  echo $sql;exit;
        $result = sqlsrv_query($this->conn, $sql);

        if ($result) {
            $orderId = sqlsrv_fetch_array(sqlsrv_query($this->conn, "SELECT SCOPE_IDENTITY() AS NewId"), SQLSRV_FETCH_ASSOC);
            return $orderId['NewId']; 
        } else {
            return false;
        }

    }
    function CreateOrderDetail(
        $OrderId, 
        $ProductId, 
        $Image, 
        $ProductName, 
        $Quantity, 
        $ProducPrice, 
        $CreatedTime, 
        $LastUpdated,
        $ProductWarehouseId
    ) {
        if($ProductWarehouseId !== 'null') {
            $ProductWarehouseId = "'".$ProductWarehouseId."'";
        }

        $sql = "INSERT INTO [OrderDetails] (
            [OrderId], 
            [ProductId], 
            [Image], 
            [ProductName], 
            [Quantity], 
            [Price], 
            [CreatedTime], 
            [LastUpdated],
            [ProductWarehouseId] )
                VALUES (
                    '$OrderId', 
                    '$ProductId', 
                    '$Image', 
                    N'$ProductName', 
                    '$Quantity', 
                    '$ProducPrice', 
                     $CreatedTime, 
                     $LastUpdated,
                    $ProductWarehouseId )";
        return sqlsrv_query($this->conn, $sql); 
    
    }
    
    function CreateBill($OrderId, $Total, $MoneyReceived, $MoneyRefund, $CreatedTime, $StatusPay)
    {
        $sql = "INSERT INTO [Bills] (
            [OrderId], 
            [Price], 
            [MoneyReceived], 
            [MoneyRefund], 
            [DateTimePayment], 
            [StatusPay]
            )
               VALUES (
                '$OrderId', 
                '$Total', 
                '$MoneyReceived', 
                '$MoneyRefund', 
                 $CreatedTime, 
                '$StatusPay')";
          return sqlsrv_query($this->conn, $sql);
    }

    function CreateVNPAY($OrderId, $BankName, $TransactionId, $TransactionStatus, $Price, $DateTimePayment)
    {
        $sql = "INSERT INTO [VnPays] (
            [OrderId],
            [BankName],
            [TransactionId],
            [TransactionStatus],
            [Price],
            [DateTimePayment]
            )
               VALUES (
                $OrderId, 
                '$BankName', 
                $TransactionId, 
                $TransactionStatus, 
                 $Price, 
                $DateTimePayment)";
        return sqlsrv_query($this->conn, $sql);
    }

    function updateVNPAY($OrderId,$TransactionId ,$TransactionStatus)
    {
        $sql = "UPDATE [VnPays]
                    SET TransactionId = $TransactionId , TransactionStatus = $TransactionStatus
                    WHERE [OrderId] = $OrderId ";
        return sqlsrv_query($this->conn, $sql);
    }

    function updatePaymentStatusOrder($PaymentStatus, $OrderId)
    {
        $sql = "UPDATE [Orders]
                    SET PaymentStatus = $PaymentStatus
                    WHERE [Id] = $OrderId ";
        return sqlsrv_query($this->conn, $sql);
    }

    function checkTransactionStatusVNPAY($OrderId)
    {
        $sql = "SELECT * FROM [VnPays] WHERE OrderId = '$OrderId'";
        return sqlsrv_query($this->conn, $sql);
    }

    function checkStatusPayBill($OrderId)
    {
        $sql = "SELECT * FROM [Bills] WHERE OrderId = '$OrderId'";
        return sqlsrv_query($this->conn, $sql);
    }
    function ShowBill($OrderId)
    {
        $sql = "SELECT TOP 1 
                    ,[OrderId]
                    ,[Price]
                    ,[MoneyReceived]
                    ,[MoneyRefund]
                    ,[DateTimePayment]
                    ,[StatusPay]
                FROM [Bill]
                WHERE [OrderId] = '$OrderId'
                ORDER BY [DateTimePayment] DESC";
        return sqlsrv_query($this->conn, $sql);
    }
    function GetIdCart($CustomerId)
    {
        $sql = "SELECT [Id]
                FROM [Carts]
                WHERE [CustomerId] = '$CustomerId'";
        return sqlsrv_query($this->conn, $sql);
        
    }
    function DeleteCartDetail($CartId)
    {
        $sql = "DELETE 
                FROM [CartDetails]
                WHERE [CartId] = '$CartId'";
        return sqlsrv_query($this->conn, $sql);
        
    }
    function updateQuantityOrderDetail($ProductId,$WareHouseId,$Quantity)
    {
        $sql = "UPDATE [ProductWareHouses]
                    SET [Quantity] = '$Quantity'
                    WHERE [ProductId] = '$ProductId' AND [WareHouseId] = '$WareHouseId' ";
        return sqlsrv_query($this->conn, $sql);
        
    }

    function getQuantityWareHouses($ProductId,$WareHouseId)
    {
        $sql = "SELECT ProductWareHouses.[Quantity]
                   FROM [ProductWareHouses]
                   WHERE [ProductId] = '$ProductId' AND [WareHouseId] = '$WareHouseId' ";
        return sqlsrv_query($this->conn, $sql);
        
    }

    function getProductWareHousesId($ProductId,$WareHouseId)
    {
        $sql = "SELECT ProductWareHouses.[Id]
                   FROM [ProductWareHouses]
                   WHERE [ProductId] = '$ProductId' AND [WareHouseId] = '$WareHouseId' ";
        return sqlsrv_query($this->conn, $sql);
        
    }

  
}
?>
