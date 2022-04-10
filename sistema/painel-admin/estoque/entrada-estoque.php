<?php
session_start();

require_once("../../../conexao.php"); 

$quantidade = $_POST['quantidade'];
$id_estoque = $_POST['id-entrada-estoque'];


if($quantidade == ""){
	echo 'Preencha o campo quantidade!';
	exit();
}

$res2 = $pdo->query("SELECT * FROM estoque where id = '$id_estoque'");
$dados2 = $res2->fetchAll(PDO::FETCH_ASSOC);
$estoque = $dados2[0]['quantidade'];
$total_estoque = $estoque + $quantidade;

try{
    $pdo->query("UPDATE estoque SET quantidade = '$total_estoque' where id = '$id_estoque'");
}catch(PDOException $e){
    echo "Erro ao inserir ".$e;
} 


echo 'Salvo com Sucesso!!';


$movimento = "SUPRIMENTO - " . $_SESSION['nome_usuario'];
$tipo = "Entrada";
//ADICIONANDO AO HISTORICO
AddEstoqueHistorico($quantidade, $tipo, $estoque, $total_estoque, $movimento, $id_estoque, $pdo);



?>