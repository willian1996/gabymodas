<?php

require_once("../../../conexao.php"); 

$id = $_POST['id'];

$query = $pdo->query("SELECT * FROM tipo_envios where ativo = 'Não' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
if(@count($res) >= 1){
    echo 'Você não pode desativar todas as formas de envio';
	exit();
}

$pdo->query("UPDATE tipo_envios SET ativo = 'Não' WHERE id = '$id'");

echo 'Desativado com sucesso, ative outra forma de envio!!';

?>