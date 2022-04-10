<?php

require_once("../../../conexao.php"); 

$id = $_POST['txtid3'];
$taxas = $_POST['taxas'];
$total_liquido = $_POST['total_liquido'];
$meio_pagamento = $_POST['meio_pagamento'];
$data_liberacao = $_POST['data_liberacao'];

if($taxas == ""){
	echo 'Preencha o campo taxas!';
	exit();
}
if($total_liquido == ""){
	echo 'Preencha o campo total liquido!';
	exit();
}
if($meio_pagamento == ""){
	echo 'Preencha o campo meio de pagamento!';
	exit();
}

if($data_liberacao == ""){
	echo 'Preencha o campo data de liberação!';
	exit();
}

$taxas = str_replace(',', '.', $taxas);
$total_liquido = str_replace(',', '.', $total_liquido);
$meio_pagamento = str_replace(',', '.', $meio_pagamento);


$pdo->query("UPDATE vendas SET taxas = '$taxas', total_liquido = '$total_liquido', meio_pagamento = '$meio_pagamento', data_liberacao = '$data_liberacao' WHERE id = '$id'");





echo 'Editado com Sucesso!!';

?>