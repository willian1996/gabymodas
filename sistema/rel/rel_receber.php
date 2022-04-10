<?php  

require_once("../../conexao.php"); 
@session_start();

$dataInicial = $_POST['dataInicial'];
$dataFinal = $_POST['dataFinal'];
//$dataInicial = "2021/06/06";
//$dataFinal = "2021/06/06";



$html = file_get_contents($url_loja."/sistema/rel/rel_receber_html.php?dataInicial=$dataInicial&dataFinal=$dataFinal");
echo $html;


?>