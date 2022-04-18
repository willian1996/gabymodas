<?php

require_once("../../../conexao.php"); 

$id = $_POST['id'];

$query = $pdo->query("SELECT * FROM tipo_envios where ativo = 'Sim' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

if(@count($res) >= 1){
    $idDesativar = $res[0]['id'];
	$pdo->query("UPDATE tipo_envios SET ativo = 'Não' WHERE id = '$idDesativar'");
}

$pdo->query("UPDATE tipo_envios SET ativo = 'Sim' WHERE id = '$id'");

echo 'Ativado com Sucesso!!';
 
?>