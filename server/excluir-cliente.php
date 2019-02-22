<?php 
$id = $_POST['id'];
require 'conexao.php';
try{
	$stmt = $conn->prepare(
	"DELETE FROM clientes WHERE id = :id"
	);
    $stmt->bindParam(':id', $id);
	$stmt->execute();
	$retorno['deucerto'] = true;
	$retorno['mensagem'] = "Parabéns! Deletou!";
	echo json_encode($retorno);
	
} catch(PDOException $e){
	$retorno['deucerto'] = false;
	$retorno['mensagem'] = "Opss! Algo deu errado!";
	$retorno['error'] = $e->getMessage();
	echo json_encode($retorno);
}
?>