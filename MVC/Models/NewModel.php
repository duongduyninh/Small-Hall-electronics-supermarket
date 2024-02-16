<?php

class NewModel extends DB
{
    function getAll()
    {
        $query = "SELECT * FROM news";

        return sqlsrv_query($this->conn, $query);
    }

    function getAllSkipTake($skip = 0, $take = 10)
    {
        $query = "SELECT  *
        FROM [News]
        ORDER BY CreatedTime DESC
        OFFSET $skip rows 
        FETCH NEXT $take rows only";

        return sqlsrv_query($this->conn, $query);
    }

    function getNewById($id)
    {
        $query = "SELECT * FROM news WHERE Id='$id'";

        $result = sqlsrv_query($this->conn, $query);

        return sqlsrv_fetch_array($result, SQLSRV_FETCH_ASSOC);
    }

    function getCount()
    {
        $query = "SELECT COUNT(*) FROM News";

        $result = sqlsrv_query($this->conn, $query);

        return sqlsrv_fetch_array($result)[0];
    }
}
