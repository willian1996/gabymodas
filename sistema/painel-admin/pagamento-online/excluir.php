<?php

require_once("../../../conexao.php"); 

$id = $_POST['id'];

$pdo->query("DELETE from pagamento_online WHERE id = '$id'");

echo 'Excluído com Sucesso!!';

?>