<?php

require_once("../../../conexao.php"); 

$id = $_POST['id'];

$query = $pdo->query("SELECT * FROM pagamento_online where ativo = 'Não' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
if(@count($res) >= 1){
    echo 'Você não pode pagamento_online todas as formas de envio';
	exit();
}

$pdo->query("UPDATE pagamento_online SET ativo = 'Não' WHERE id = '$id'");

echo 'Desativado com sucesso, ative outra forma de envio!!';

?>