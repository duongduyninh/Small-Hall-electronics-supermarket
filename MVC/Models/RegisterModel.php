<?php
// require "PasswordHasher.php";
class RegisterModel extends DB
{
  
    function CheckUser($Email)
    {
        $sql="SELECT * FROM Users WHERE Email = '$Email'";
        return sqlsrv_query($this->conn, $sql); 
    }
    function SelectUser($Id)
    {
        $sql="SELECT * FROM Users WHERE Id = '$Id'";
        return sqlsrv_query($this->conn, $sql); 
    }
    function CreateUsers($Id, $Name, $Email, $Password)
    {
        $sql="INSERT INTO Users (Id, UserName, PasswordHash,Email,EmailConfirmed,PhoneNumberConfirmed
                                ,TwoFactorEnabled,LockoutEnabled,AccessFailedCount)
                         VALUES ('$Id', N'$Name ','$Password' ,'$Email' ,1,0
                                ,0,1,0)";
        return sqlsrv_query($this->conn, $sql); 
    }
    function CreateCustomer($IdCustomer, $IdUser, $Name, $Email, $CreatedTime)
    {
        $sql = " INSERT INTO Customer ([Id], [Name], [Address], [Phone], [Dob], [Email], [CreatedTime], [LastUpdated], [Status], [UserId])
                                VALUES ('$IdCustomer', N'$Name', N'Chưa Cập Nhật', 0, getdate(), '$Email', getdate(),getdate(), 1, '$IdUser')";
        return sqlsrv_query($this->conn, $sql); 
    }
}
?>
