<?php
//recebendo os dados dos clientes do formulario
$nome_completo = isset($_POST['nome_completo'])?$_POST['nome_completo']:'';
$whatsapp = isset($_POST['whatsapp'])?$_POST['whatsapp']:'';
$rua = isset($_POST['rua'])?$_POST['rua']:'';
$numeroCasa = isset($_POST['numeroCasa'])?$_POST['numeroCasa']:'';
$bairro = isset($_POST['bairro'])?$_POST['bairro']:'';
$cidade = isset($_POST['cidade'])?$_POST['cidade']:'';
$cep = isset($_POST['cep'])?$_POST['cep']:'';
$telefone1 = isset($_POST['telefone1'])?$_POST['telefone1']:'';
$telefone2 = isset($_POST['telefone2'])?$_POST['telefone2']:'';
$pontoDeReferencia = isset($_POST['pontoDeReferencia'])?$_POST['pontoDeReferencia']:'';
$now = new DateTime();
$dataCadastro = $now->format('Y-m-d H:i:s'); 

require_once 'conexao.php';

try{
    $stmt = $conn->prepare("INSERT usuarios (nome_completo, whatsapp, rua, numeroCasa, pontoDeReferencia, bairro, cidade, cep, telefone1, telefone2, dataCadastro) 
    VALUES (:nome_completo, :whatsapp, :rua, :numeroCasa, :pontoDeReferencia, :bairro, :cidade, :cep, :telefone1, :telefone2, :dataCadastro)"
    );
    
    $stmt->bindParam(':nome_completo', $nome_completo);
    $stmt->bindParam(':whatsapp', $whatsapp);
    $stmt->bindParam(':rua', $rua);
    $stmt->bindParam(':numeroCasa', $numeroCasa);
    $stmt->bindParam(':pontoDeReferencia', $pontoDeReferencia);
    $stmt->bindParam(':bairro', $bairro);
    $stmt->bindParam(':cidade', $cidade);
    $stmt->bindParam(':cep', $cep);
    $stmt->bindParam(':telefone1', $telefone1);
    $stmt->bindParam(':telefone2', $telefone2);
    $stmt->bindParam(':dataCadastro', $dataCadastro);
    
    $stmt->execute();
    header('Location: ../sucesso.php');
    
}catch(PDOException $e){
//    header('location: ../erro.php');
    echo "Erro: ".$e;
    
}
?>
