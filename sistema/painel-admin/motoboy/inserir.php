<?php

require_once("../../../conexao.php"); 

$bairro = $_POST['bairro'];
$cidade = $_POST['cidade'];
$frete = $_POST['frete'];


$antigo = $_POST['antigo'];
$id = $_POST['txtid2'];

if($bairro == ""){
	echo 'Preencha o campo bairro!';
	exit();
}
if($cidade == ""){
    echo "Preencha o campo cidade";
}
if($frete == ""){
    echo "Preencha o campo frete";
}


if($bairro != $antigo){
	$res = $pdo->query("SELECT * FROM motoboy where bairros_nome = '$bairro'"); 
	$dados = $res->fetchAll(PDO::FETCH_ASSOC);
	if(@count($dados) > 0){
			echo 'Tipo já Cadastrado no Banco!';
			exit();
		}
}



if($id == ""){
	$res = $pdo->prepare("INSERT INTO motoboy (bairros_nome, bairros_cidade, bairros_frete_valor) VALUES (:bairro, :cidade, :frete)");
	
}else{

	$res = $pdo->prepare("UPDATE motoboy SET bairros_nome = :bairro, bairros_cidade = :cidade, bairros_frete_valor = :frete  WHERE  bairros_id = :id");
	

	$res->bindValue(":id", $id);
}

	$res->bindValue(":bairro", $bairro);
    $res->bindValue(":cidade", $cidade);
    $res->bindValue(":frete", $frete);
	
	$res->execute();


echo 'Salvo com Sucesso!!';

?>