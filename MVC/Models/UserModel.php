<?php
// require "PasswordHasher.php";
class UserModel extends DB
{
    function getInfoUser($IdUser)
    {
        $sql = "SELECT * 
         FROM Users
         WHERE Users.[Id] = '$IdUser'";
        return sqlsrv_query($this->conn, $sql);
    }
    function getInfoCustomer($IdUser)
    {
        $sql = "SELECT * 
         FROM Customer
         WHERE Customer.[Id] = '$IdUser'";
        return sqlsrv_query($this->conn, $sql);
    }
    function updataCustomerInfo($CustomerId, $User_Name, $User_PhoneNumber, $User_Email, $User_Address)
    {
        $sql = " UPDATE Customer 
                 SET [Name] = N'$User_Name', 
                     [Phone] = '$User_PhoneNumber', 
                     [Email] = '$User_Email',
                     [Address] = N'$User_Address'
                 WHERE [Id] = '$CustomerId'";
        return sqlsrv_query($this->conn, $sql);
    }
    function checkPassUser($UserId,$UserPass)
    {
        $sql = "SELECT Users.[PasswordHash] 
                FROM Users 
                WHERE [Id] = '$UserId' ";
        $query = sqlsrv_query($this->conn, $sql);
        
        $row = sqlsrv_fetch_array($query, SQLSRV_FETCH_ASSOC);

        $hasher = new MDHearing\AspNetCore\Identity\PasswordHasher();

        $result = $hasher->verifyHashedPassword($row['PasswordHash'], $UserPass);
       
        return $result;
        
    }
    function updataUserInfo_PassNew($UserId,$CustomerId, $User_Name, $User_PhoneNumber, $User_Email, $User_PassHash,$User_Address)
    {
        $sql = "UPDATE Users 
                 SET  [PasswordHash] = '$User_PassHash'
                 WHERE [Id] = '$UserId'";
        $UpdatePass = sqlsrv_query($this->conn, $sql);
        
        if ($UpdatePass) {
            $sql1 = "UPDATE Customer 
                 SET [Name] = N'$User_Name', 
                     [Phone] = '$User_PhoneNumber', 
                     [Email] = '$User_Email',
                     [Address] = N'$User_Address'
                 WHERE [Id] = '$CustomerId'";  
            return sqlsrv_query($this->conn, $sql1);
                   
        } else {
            return false ; 
        }
        
                      
        return sqlsrv_query($this->conn, $sql);
    }
    function getCountOrders($IdUser)
    {
        $sql = "SELECT COUNT(Orders.[Id])
                  FROM Orders 
                  WHERE [CustomerId] = '$IdUser' ";

        $result = sqlsrv_query($this->conn, $sql);

        return sqlsrv_fetch_array($result)[0];
    }
    function getOrderInfoUser($IdUser , $skip = 0, $take = 10)
    {
        $sql=" WITH OrderedDetails AS (
                    SELECT
                        OrderDetails.*,
                        ROW_NUMBER() OVER (PARTITION BY OrderDetails.OrderId ORDER BY OrderDetails.Image) AS RowNum
                    FROM OrderDetails
                )
                SELECT
                    Orders.*,
                    OrderedDetails.[Image]
                FROM
                    Orders
                LEFT JOIN
                    OrderedDetails ON Orders.[Id] = OrderedDetails.[OrderId] AND OrderedDetails.RowNum = 1
                WHERE
                    Orders.[CustomerId] = '$IdUser'
                ORDER BY
                    Orders.[Id]
                OFFSET
                    $skip ROWS FETCH NEXT $take ROWS ONLY;

                "
               ;
        return sqlsrv_query($this->conn, $sql);

    }
    function getOrderDetailInfoUser($IdOrder)
    {
        $sql = " SELECT * 
                 FROM OrderDetails
                 WHERE [OrderId] = '$IdOrder'";
        return sqlsrv_query($this->conn, $sql);

    }
    function getTotalOrder($CustomerId,$IdOrder)
    {
        $sql = "SELECT Orders.[Total] 
                FROM Orders 
                WHERE [CustomerId] = '$CustomerId' AND [Id] = '$IdOrder' ";
        return sqlsrv_query($this->conn, $sql);
    }
    function checkOrder($IdUser)
    {
        $sql = "SELECT COUNT(*) AS checkOrder
                FROM Orders
                WHERE Orders.[CustomerId] = '$IdUser'
                ";
                // echo $sql ; exit;
        return sqlsrv_query($this->conn, $sql);
    }
}

?>
