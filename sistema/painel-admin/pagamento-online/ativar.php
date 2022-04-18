<?php 

require_once("../../../conexao.php"); 

$id = $_POST['id'];

$query = $pdo->query("SELECT * FROM pagamento_online where ativo = 'Sim' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

if(@count($res) >= 1){
    $idDesativar = $res[0]['id'];
	$pdo->query("UPDATE pagamento_online SET ativo = 'Não' WHERE id = '$idDesativar'");
}

$pdo->query("UPDATE pagamento_online SET ativo = 'Sim' WHERE id = '$id'");

echo 'Ativado com Sucesso!!';
 
?>