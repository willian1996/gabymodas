<?php  
require_once("../../../conexao.php"); 

$id = $_POST['id'];
$query_con = $pdo->query("DELETE from fornecedores WHERE id = '$id'");
echo 'Excluído com Sucesso!';

 ?>