<?php 
require_once("../../../conexao.php");
@session_start();
$id_usuario = $_SESSION['id_usuario'];

$id = $_POST['id'];
$gerente = $_POST['gerente'];
$senha_gerente = $_POST['senha_gerente'];

//RECUPERAR O PRODUTO DO ITEM DESTA VENDA
$query_con = $pdo->query("SELECT * FROM carrinho WHERE id = '$id'");
$res = $query_con->fetchAll(PDO::FETCH_ASSOC);
if(@count($res) > 0){
	$id_prod = $res[0]['id_produto'];
	$quantidade = $res[0]['quantidade'];
    $id_estoque = $res[0]['id_estoque'];
}

//VERIFICAR CREDENCIAIS DO GERENTE
$query_con = $pdo->prepare("SELECT * from usuarios WHERE id = :id_gerente and senha = :senha_gerente ");
$query_con->bindValue(":id_gerente", $gerente);
$query_con->bindValue(":senha_gerente", $senha_gerente);
$query_con->execute();
$res_con = $query_con->fetchAll(PDO::FETCH_ASSOC);
if(@count($res_con) == 0){
		echo 'A senha do Gerente está Incorreta, Não foi possivel excluir o item!';
	exit();
}

//DEVOLVER OS PRODUTOS AO ESTOQUE
$query_con = $pdo->query("SELECT * FROM estoque WHERE id = '$id_estoque'");
$res = $query_con->fetchAll(PDO::FETCH_ASSOC);
if(@count($res) > 0){
	$estoque = $res[0]['quantidade'];
    $vendas = $res[0]['vendas'];

	//DEVOLVER OS PRODUTOS AO ESTOQUE
	$novo_estoque = $estoque + $quantidade;
    $vendas = $vendas - $quantidade;
	$res = $pdo->prepare("UPDATE estoque SET quantidade = :estoque, vendas = :vendas WHERE id = '$id_estoque'");
	$res->bindValue(":estoque", $novo_estoque);
    $res->bindValue(":vendas", $vendas);

	$res->execute();
    //REGISTRAR NO HISTORICO 
    $tipo = "Entrada";
    $antes = $estoque;
    $depois = $novo_estoque;
    $movimento = "Devolução PDV - ".$_SESSION['nome_usuario']; 
    AddEstoqueHistorico($quantidade, $tipo, $antes, $depois, $movimento, $id_estoque, $pdo);

}




$query_con = $pdo->query("DELETE from carrinho WHERE id = '$id'");

echo 'Excluído com Sucesso!';

 ?>