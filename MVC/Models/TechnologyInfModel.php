<?php
class TechnologyInfModel extends DB
{
    function TMP()
    {
        $sql="s";
        return sqlsrv_query($this->conn, $sql); 
    }
  
}
?>
