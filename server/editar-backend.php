<?php
//configurando timezone
date_default_timezone_set('America/Sao_Paulo');

//recebendo os dados do formulario com método POST[]
$id = isset($_POST['id']);
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

//limpando variaveis 
$id = addslashes($id);
$nome_completo = addslashes($nome_completo);
$whatsapp = addslashes($whatsapp);
$rua = addslashes($rua);
$numeroCasa = addslashes($numeroCasa);
$bairro = addslashes($bairro);
$cidade = addslashes($cidade);
$cep = addslashes($cep);
$telefone1 = addslashes($telefone1);
$telefone2 = addslashes($telefone2);
$pontoDeReferencia = addslashes($pontoDeReferencia);

//removendo a marcara do cep
$cep = str_replace("-", "", $cep);

//removendo a mascara do whatsapp
$whatsapp= str_replace("(", "", $whatsapp);
$whatsapp= str_replace(")", "", $whatsapp);
$whatsapp= str_replace(" ", "", $whatsapp);
$whatsapp= str_replace("-", "", $whatsapp);

//removendo a mascara do telefone1
$telefone1= str_replace("(", "", $telefone1);
$telefone1= str_replace(")", "", $telefone1);
$telefone1= str_replace(" ", "", $telefone1);
$telefone1= str_replace("-", "", $telefone1);

//removendo a mascara do telefone2
$telefone2= str_replace("(", "", $telefone2);
$telefone2= str_replace(")", "", $telefone2);
$telefone2= str_replace(" ", "", $telefone2);
$telefone2= str_replace("-", "", $telefone2);

//conexão com banco de dados 
require_once 'conexao.php';

try{
//realizando o insert no banco
$stmt = $conn->prepare("UPDATE clientes SET nome_completo = :nome_completo, whatsapp = :whatsapp, rua = :rua, numeroCasa = :numeroCasa, pontoDeReferencia = :pontoDeReferencia, bairro = :bairro, cidade = :cidade, cep = :cep, telefone1 = :telefone1, telefone2 = :telefone2, dataCadastro = :dataCadastro WHERE id = :id");
//limpando variaveis de sql injection 
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
$stmt->bindParam(':id', $id);

$stmt->execute();

//nova consulta para pegar o id do usuario que já foi inserido acima
//$stmt = $conn->prepare("SELECT id FROM clientes WHERE whatsapp = '$whatsapp'"); 
//$stmt->execute();
//$resultado = $stmt->fetch();
//
//$id = $resultado['id'];
//
//$stmt->execute();

//passando o id e whatsapp por parametro get para o pagina sucesso.php
//header("Location: ../sucesso.php?id=$id&whatsapp=$whatsapp");
    echo "certo";
    
}catch(PDOException $e){
//    header('location: ../erro.php');
//    header("Location: ../erro.php?error=$e");
    echo $e;
}