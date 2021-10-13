<?php 
try {
    
   // error_reporting(0);
header('Content-type: application/json; charset=utf-8');

   $conexion = new mysqli('localhost','root','','parkingdom');
    
    if($conexion->connect_errno){
     $respuesta = [
         'error' => true
     ];   
    }
    else{
            
            $report         = $_POST['reporte'];
            $type_cliente   = $_POST['tipo_cliente'];
            $type_vehiculo  = $_POST['tipo_vehiculo'];
            $plca           = $_POST['placa'];
            $document       = $_POST['num_documento'];
            $f_inicio       = $_POST['fecha_ingreso'];
            $f_fin          = $_POST['fecha_salida'];
        
        
        if($report == "transaccion"){
            
//            if(isset($plca)){
//                $where = "AND placa = '$plca'";
//            }          
            else if($type_vehiculo != "0"){
                 
                $where ="AND tipo_vehiculo = '$type_vehiculo'";
            }
////            
//            if($type_cliente != "0"){
//                $where =" AND tipo_cliente = '$type_cliente'";
//            }
//            
//            else if($f_inicio =! "" && $f_inicio != ""){
//                $where3 ="AND hora_entrada BETWEEN $f_inicio '00:00:00' AND $f_fin '23:59:59'";
//            }
            $conexion->set_charset("utf8");
            
            $statement= $conexion->prepare("SELECT * FROM transaccion WHERE 1=1 $where");

            $statement->execute();

            $resultados = $statement->get_result();

            $respuesta = [];
    
            while($fila = $resultados->fetch_assoc()){
                $usuario = [
                    'PLACA'                 => $fila['placa'],
                    'TIPO_DE_VEHICULO'      => $fila['tipo_vehiculo'],
                    'TIPO_CLIENTE'          => $fila['tipo_cliente'],
                    'FECHA_INICIO'          => $fila['hora_entrada'],
                    'FECHA_FIN'             => $fila['hora_salida'],
                    'ESPACIO'               => $fila['espacio_tr'],
                    'USUARIO_DE_REGISTRO'   => $fila['usuario']
                ];
            array_push($respuesta, $usuario);
            }
//            echo json_encode($respuesta);
        }
        
//        else if($report=="mensualidades"){ 
//        else if($report=="mensualidades"){ 
//        else if($report=="mensualidades"){ 
//            $conexion->set_charset("utf8");
//            
//            if($plca != 0){
//                $where= "AND placa = $plca";
//            }
////            else if($type_vehiculo != "0"){
////                $where1="AND tipo_vehiculo = $type_vehiculo";
////            }
////            else if($document != 0){
////                $where2=" AND num_documento_vp = $document";
////            }
////            else if($f_inicio =! "" && $f_inicio != ""){
////                $where3="AND hora_entrada BETWEEN $f_inicio '00:00:00' AND $f_fin '23:59:59'";
////            }
//            
//            $statement= $conexion->prepare("
//            SELECT 
//            m.placa AS placa,
//            v.tipo_vehiculo AS tipo_vehiculo,
//            vp.num_documento_vp AS num_documento_vp,
//            p.nombre AS nombre,
//            p.apellido AS apellido,
//            m.estado AS estado,
//            m.fecha_inicio AS fecha_inicio,
//            m.fecha_fin AS fecha_fin
//            FROM  mensualidad m
//            INNER JOIN  vehiculos v
//            ON m.placa = v.placa_vehi
//            INNER JOIN  vehiculo_persona vp
//            ON v.placa_vehi = vp.placa_vp
//            INNER JOIN  persona p
//            ON vp.num_documento_vp = p.num_documento
//            WHERE 1=1 $where");
//
//            $statement->execute();
//
//            $resultados = $statement->get_result();
//
//            $respuesta = [];
//    
//            while($fila = $resultados->fetch_assoc()){
//                $usuario = [
//                    'PLACA'             => $fila['placa'],
//                    'TIPO_DE_VEHICULO'  => $fila['tipo_cliente'],
//                    'N_DOCUMENTO'       => $fila['num_documento_vp'],
//                    'NOMBRE'            => $fila['nombre'],
//                    'APELLIDO'          => $fila['apellido'],
//                    'ESTADO'            => $fila['estado'],
//                    'DESDE'             => $fila['fecha_inicio'],
//                    'HASTA'             => $fila['fecha_fin']
//                ];
//                array_push($respuesta, $usuario);
//            }
//            
//        }
//        
//        else if($report=="ingresos"){
//            $conexion->set_charset("utf8");
//            
//            if($type_vehiculo != "0"){
//                $where1="AND tipo_vehiculo = $type_vehiculo";
//            }
//            else if($type_cliente != "0"){
//                $where2=" AND tipo_cliente = $type_cliente";
//            }
//            else if($f_inicio =! "" && $f_inicio != ""){
//                $where3="AND hora_entrada BETWEEN $f_inicio '00:00:00' AND $f_fin '23:59:59'";
//            }
//            
//            $statement= $conexion->prepare("
//            SELECT * FROM transaccion WHERE 1=1 $where1 $where2 $where3");
//
//            $statement->execute();
//
//            $resultados = $statement->get_result();
//
//            $respuesta = [];
//    
//            while($fila = $resultados->fetch_assoc()){
//                $usuario = [
//                    'TIPO_DE_CLIENTE'   => $fila['tipo_cliente'],
//                    'TIPO_VEHICULO'     => $fila['tipo_vehiculo'],
//                    'PLACA'             => $fila['placa'],
//                    'VALOR'             => $fila['valor_tiempo'],
//                    'DESDE'             => $fila['hora_entrada'],
//                    'HASTA'             => $fila['hora_salida']
//                ];
//            array_push($respuesta, $usuario);
//            }    
//        }
        
    }

echo json_encode($respuesta);
//  print_r ($respuesta);  
}catch(PDOException $e){
    echo "Error: " . $e->getMessage();
}
?>
