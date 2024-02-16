<?php
require "PasswordHasher.php";
class LoginModel extends DB
{
    function SlectUser($User)
    {
        $sql="SELECT * FROM Users WHERE Email ='$User'";
        return sqlsrv_query($this->conn, $sql); 
    }
    function SlectCustomer($UserId)
    {
        $sql="SELECT * FROM Customer WHERE UserId ='$UserId'";
        return sqlsrv_query($this->conn, $sql); 
    }
    function SlectStaff($UserId)
    {
        $sql="SELECT * FROM Staffs WHERE UserId ='$UserId'";
        return sqlsrv_query($this->conn, $sql); 
    }
    function CheckUser($User)
    {
        $sql="SELECT Email FROM Users WHERE Email ='$User'";
        return sqlsrv_query($this->conn, $sql); 
    }
    function CheckPassUser($User, $pass)
    {
        $sql="SELECT Email ,PasswordHash FROM Users WHERE Email ='$User'";
       
        $query = sqlsrv_query($this->conn, $sql);

        $row = sqlsrv_fetch_array($query, SQLSRV_FETCH_ASSOC);
        
        $hasher = new MDHearing\AspNetCore\Identity\PasswordHasher();
        
        $result = $hasher->verifyHashedPassword($row['PasswordHash'], $pass);
       
        return $result;
   
    }
    function CheckRoles($User)
    {
        $sql ="SELECT r.name, s.Id AS StaffId
                FROM Users u
                INNER JOIN UserRoles ur ON u.Id = ur.UserId
                INNER JOIN Roles r ON ur.RoleId = r.Id
                LEFT JOIN Staffs s ON u.Id = s.UserId
                WHERE u.UserName = '$User'
                    ";
                    // echo $sql ; exit;
        return sqlsrv_query($this->conn, $sql);
    }
}
?>