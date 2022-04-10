<?php 
header("access-control-allow-origin: https://pagseguro.uol.com.br");
header("Content-Type: text/html; charset=UTF-8",true);
date_default_timezone_set('America/Sao_Paulo');
include_once('../../conexao.php');
session_start();

require_once("PagSeguro.class.php");
$PagSeguro = new PagSeguro();


$id_venda = $_GET['codigo'];


$query = $pdo->query("SELECT * FROM vendas where id = '" . $id_venda . "' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$id_usuario = $res[0]['id_usuario'];
$valor = $res[0]['total'];

$query2 = $pdo->query("SELECT * FROM usuarios where id = '" . $id_usuario . "' ");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
$cpf_usuario = $res2[0]['cpf'];


$query3 = $pdo->query("SELECT * FROM clientes where cpf = '" . $cpf_usuario . "' ");
$res3 = $query3->fetchAll(PDO::FETCH_ASSOC);
$nome = $res3[0]['nome'];


$telefone = Mask("(##)####-####",$res3[0]['telefone']);
$cep = $res3[0]['cep'];
$numero = $res3[0]['numero'];
$email = $res3[0]['email'];
$rua = $res3[0]['rua'];
$bairro = $res3[0]['bairro'];
$cidade = $res3[0]['cidade'];
$estado = $res3[0]['estado'];


 if($telefone == ""){
   $telefone = "(33) 3333-3333";
}

	
//EFETUAR PAGAMENTO	
$venda = array("codigo"=>$id_venda,
			   "valor"=>$valor,
			   "descricao"=>'Compra ID '.$id_venda .' - '. $nome_loja,
			   "nome"=>$nome,
			   "email"=>$email,
			   "telefone"=>$telefone,
			   "rua"=>$rua,
			   "numero"=>$numero,
			   "bairro"=>$bairro,
			   "cidade"=>$cidade,
			   "estado"=>$estado, //2 LETRAS MAIÚSCULAS
			   "cep"=>$cep,
			   "codigo_pagseguro"=>$id_venda);
			   
$PagSeguro->executeCheckout($venda, $url_loja."painel-cliente/index.php?acao=pedidos");

//----------------------------------------------------------------------------


//RECEBER RETORNO
if( isset($_GET['transaction_id']) ){
	$pagamento = $PagSeguro->getStatusByReference($_GET['codigo']);
	
	$pagamento->codigo_pagseguro = $_GET['transaction_id'];
	if($pagamento->status==3 || $pagamento->status==4){

		
		
	}else{
		//ATUALIZAR NA BASE DE DADOS
	}
}

?>