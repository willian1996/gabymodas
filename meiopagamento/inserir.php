<?php

require_once("../conexao.php"); 

$meioPagamento = $_POST['meiopagamento'];
$id_venda = $_POST['idvenda'];

//SALVAR MEIO DE PAGAMENTO NA VENDA, PAGSEGURO, MERCADOPAGO OU PAYPAL
if($id_venda != "" and $meioPagamento != ""){
    $res = $pdo->prepare("UPDATE vendas SET meio_pagamento = :meio WHERE id = :id");
    $res->bindValue(":meio", $meioPagamento);
	$res->bindValue(":id", $id_venda);
    $res->execute();
	echo 'Salvo com Sucesso!!';
}else{
    echo "sem dados";
	
}

	
	
	




?>