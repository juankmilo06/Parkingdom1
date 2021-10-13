<?php

try{
    $conexion=mysqli_connect("node38209-parkingdom.jelastic.saveincloud.net","root","parkingdom","GOLlmm69236"); 

    //echo "conexion Ok";
    
}catch(Exception $e){
    echo "Error: " . $e->getMessage();
}
?>
