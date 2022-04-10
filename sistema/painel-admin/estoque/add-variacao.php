<?php
session_start();
require_once("../../../conexao.php"); 

$id_produto = $_POST['idProdValue'];


//PEGANDO A QUANTIDADE 
if(@$_POST['quantidade-variacao'] != null and @$_POST['quantidade-variacao']!=""){
	$quantidade = $_POST['quantidade-variacao'];
}else{
	echo 'Preenche a quantidade!';
	exit();
}

//PEGANDO A COR 
if(@$_POST['Cor'] != null and @$_POST['Cor']!=""){
	$cor = @$_POST['Cor'];
}else{
	$cor = null;
}

//PEGANDO O TAMANHO
if(@$_POST['Tamanho'] != null and @$_POST['Tamanho']!=""){
	$tamanho = @$_POST['Tamanho'];
}else{
	$tamanho = null;
}

//inserindo produto ao estoque
$res = $pdo->prepare("INSERT INTO estoque (id_produto, quantidade, id_carac_itens_cor, id_carac_itens_tamanho) VALUES (:id_produto, :quantidade, :id_carac_itens_cor, :id_carac_itens_tamanho)");

$res->bindValue(":id_produto", $id_produto);
$res->bindValue(":quantidade", $quantidade);
$res->bindValue(":id_carac_itens_cor", $cor);
$res->bindValue(":id_carac_itens_tamanho", $tamanho);

$res->execute();
$id_estoque = $pdo->lastInsertId();


echo 'Salvo com Sucesso!!';

$movimento = "ADICIONADO - " . $_SESSION['nome_usuario'];
$tipo = "Entrada";

//ADICIONANDO AO HISTORICO
AddEstoqueHistorico($quantidade, $tipo, 0, $quantidade, $movimento, $id_estoque, $pdo);


?>