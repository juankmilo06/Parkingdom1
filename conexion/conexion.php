<?php

try{
    $conexion = new PDO('mysql:host=localhost;dbname=parkingdom','root@localhost','');
    //echo "conexion Ok";
    
}catch(PDOException $e){
    echo "Error: " . $e->getMessage();
}
?>
