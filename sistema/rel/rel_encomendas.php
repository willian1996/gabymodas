<?php  

require_once("../../conexao.php"); 
@session_start();

$dataInicial = $_POST['dataInicial'];
$dataFinal = $_POST['dataFinal'];
$fornecedor = $_POST['pedidofornecedor'];
$pedidoStatus = $_POST['pedidostatus'];
//$dataInicial = "2021/06/06";
//$dataFinal = "2021/06/06";


$html = file_get_contents($url_loja."/sistema/rel/rel_encomendas_html.php?dataInicial=$dataInicial&dataFinal=$dataFinal&pedidoFornecedor=$fornecedor&pedidoStatus=$pedidoStatus");
echo $html;


?>