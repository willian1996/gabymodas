<?php 

require_once("../../../conexao.php"); 

$id = $_GET['id']; 

//ALIMENTAR OS DADOS NO RELATÓRIO
$html = file_get_contents($url_loja."sistema/painel-admin/vendas/declaracao_conteudo.php?id=".$id);

if($relatorio_pdf != 'Sim'){
	echo $html;
	exit();
}


//CARREGAR DOMPDF
require_once '../../dompdf/autoload.inc.php';
use Dompdf\Dompdf;


$pdf = new DOMPDF();

//Definir o tamanho do papel e orientação da página
$pdf->set_paper(array(0, 0, 497.64, 700), 'portrait');

//CARREGAR O CONTEÚDO HTML
$pdf->load_html($html);

//RENDERIZAR O PDF
$pdf->render();

//NOMEAR O PDF GERADO
$pdf->stream(
'declaracao_conteudo.pdf',
array("Attachment" => false)
);


?>