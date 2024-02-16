<?php
class DB
{
    public $conn;
    public $servername = "LAPTOP-VD740PE9\\SQLEXPRESS"; //serverName\instanceName
    public $connectionInfo = array("Database" => "luanvan_chinhthuc", "UID" => "", "PWD" => "","CharacterSet" => "UTF-8");
    function __construct()
    {
        $this->conn = sqlsrv_connect($this->servername, $this->connectionInfo);
        // if ($this->conn) {
        //     echo "Connection established.<br />";
        // } else {
        //     echo "Connection could not be established.<br />";
        // }
  
    }
}

?>
