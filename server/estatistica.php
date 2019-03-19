<?php
//Estatistica de caraguatatuba
function caraguatatuba($conn){
    try{
        $stmt = $conn->prepare("select count(*) from clientes where cidade = 'Caraguatatuba';"); 
        $stmt->execute();
        $caraguatatuba = $stmt->fetch(); 
        return $caraguatatuba[0];
    }catch(PDOException $e){
        return $e->getMessage();
    }   
}
//Estatistica de são sebastião
function saoSebastiao($conn){
    try{
        $stmt = $conn->prepare("select count(*) from clientes where cidade = 'Sao Sebastiao';"); 
        $stmt->execute();
        $saoSebastiao = $stmt->fetch();
        return $saoSebastiao[0];
    }catch(PDOException $e){
        return $e->getMessage();
    }
}
//Estatistica de ilha bela 
function ilhaBela($conn){
    try{
        $stmt = $conn->prepare("select count(*) from clientes where cidade = 'Ilha Bela';"); 
        $stmt->execute();
        $ilhaBela = $stmt->fetch(); 
        return $ilhaBela[0];
    }catch(PDOException $e){
        return $e->getMessage();
    }
}
//Estatistica de ubatuba
function ubatuba($conn){
    try{
        $stmt = $conn->prepare("select count(*) from clientes where cidade = 'Ubatuba';"); 
        $stmt->execute();
        $ubatuba = $stmt->fetch();
        return $ubatuba[0];
    }catch(PDOException $e){
        return $e->getMessage();
    }
}
//Estatistica no total
function total($conn){
     try{
        $stmt = $conn->prepare("select count(*) from clientes;"); 
        $stmt->execute();
        $total = $stmt->fetch();
        return $total[0];
    }catch(PDOException $e){
        return $e->getMessage();
    }
}

?>