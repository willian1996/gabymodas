<?php  

require_once("../../conexao.php"); 
@session_start();

$html = file_get_contents($url_loja."/sistema/rel/rel_produtos_html.php");
echo $html;


?>