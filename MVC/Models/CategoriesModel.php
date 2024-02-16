<?php
class CategoriesModel extends DB
{
    function Categories()
    {
        $sql="SELECT * FROM Categories";
        return sqlsrv_query($this->conn, $sql); 
    }
    function Categories_id($Id)
    {
        $sql="SELECT name FROM Categories WHERE Id = $Id";
        return sqlsrv_query($this->conn, $sql); 
    }
}
?>
