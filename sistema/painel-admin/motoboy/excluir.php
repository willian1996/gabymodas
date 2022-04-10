<?php

require_once("../../../conexao.php"); 

$id = $_POST['id'];

$pdo->query("DELETE from motoboy WHERE bairros_id = '$id'");

echo 'Excluído com Sucesso!!';

?>