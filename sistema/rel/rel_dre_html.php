<?php 
require_once("../../conexao.php"); 
@session_start();


setlocale(LC_TIME, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
date_default_timezone_set('America/Sao_Paulo');
$data_hoje = strtoupper(utf8_encode(strftime('%A, %d de %B de %Y', strtotime('today'))));

$dataInicial = $_GET['dataInicial'];
$dataFinal = $_GET['dataFinal'];


$dataInicialF = implode('/', array_reverse(explode('-', $dataInicial)));
$dataFinalF = implode('/', array_reverse(explode('-', $dataFinal)));



if($dataInicial != $dataFinal){
	$apuracao = $dataInicialF. ' até '. $dataFinalF;
}else{
	$apuracao = $dataInicialF;
}


//-------------TOTAL VENDIDO GERAL---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$faturamento = 0;



 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
     @$faturamento += $dados_total[$i2]['total'];
    
     
}    
$faturamentoF = number_format($faturamento, 2, ',', '.');


//---------------TOTAL PEDIDOS ONLINE---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal' and tipo = 'pedido_online'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_pedidos_online = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_pedidos_online += $dados_total[$i2]['total'];
}    
$total_pedidos_onlineF = number_format($total_pedidos_online, 2, ',', '.');

//---------------TOTAL VENDAS ONLINE---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal' and tipo = 'venda_online'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_online = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_online += $dados_total[$i2]['total'];
}    
$total_vendas_onlineF = number_format($total_vendas_online, 2, ',', '.');

//---------------TOTAL Vendas Fisicas---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal' and tipo = 'venda_fisica'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_fisica = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_fisica += $dados_total[$i2]['total'];
}    
$total_vendas_fisicaF = number_format($total_vendas_fisica, 2, ',', '.');

//---------------TOTAL Vendas Canceladas---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal' and tipo = 'venda_cancelada'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_cancelada = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_cancelada += $dados_total[$i2]['total'];
}    
$total_vendas_canceladaF = number_format($total_vendas_cancelada, 2, ',', '.');


//-------------TOTAL DEMAIS CUSTOS---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal' and tipo != 'venda_cancelada' and pago = 'Sim'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$descontos = 0;
$taxa_cartao = 0;
$custoMercadoria = 0;
    for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
        @$descontos += $dados_total[$i2]['desconto'];
        @$taxa_cartao += $dados_total[$i2]['taxas'];
        @$custoMercadoria += $dados_total[$i2]['total_custo'];

    } 

//-------------TOTAL vendas sem pagar---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal' and tipo != 'venda_cancelada' and pago !='Sim'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$vendasSemPagar = 0;

    for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
        @$vendasSemPagar += $dados_total[$i2]['total'];

    } 

$vendasSemPagarF = number_format($vendasSemPagar, 2, ',', '.');
$totalDescontoF = number_format($descontos, 2, ',', '.');
$totalTaxaCartaoF = number_format($taxa_cartao, 2, ',', '.');
$totalCustoMercadoriaF = number_format($custoMercadoria, 2, ',', '.');
$totalCusto = $total_vendas_cancelada + $descontos + $taxa_cartao + $custoMercadoria + $vendasSemPagar;
$totalCustoF = number_format($totalCusto, 2, ',', '.');
$receitaBruta = $faturamento - $totalCusto;
$receitaBrutaF = number_format($receitaBruta, 2, ',', '.');

?>

<!DOCTYPE html>
<html>
<head>
	<title>DRE</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<style>

		@page {
			margin: 0px;

		}

		.footer {
			margin-top:20px;
			width:100%;
			background-color: #ebebeb;
			padding:10px;
			position:relative;
			bottom:0;
		}

		.cabecalho {    
			background-color: #ebebeb;
			padding:10px;
			margin-bottom:30px;
			width:100%;
			height:100px;
		}

		.titulo{
			margin:0;
			font-size:28px;
			font-family:Arial, Helvetica, sans-serif;
			color:#6e6d6d;

		}

		.subtitulo{
			margin:0;
			font-size:17px;
			font-family:Arial, Helvetica, sans-serif;
		}

		.areaTotais{
			border : 0.5px solid #bcbcbc;
			padding: 15px;
			border-radius: 5px;
			margin-right:25px;
			margin-left:25px;
			position:absolute;
			right:20;
		}

		.areaTotal{
			border : 0.5px solid #bcbcbc;
			padding: 15px;
			border-radius: 5px;
			margin-right:25px;
			margin-left:25px;
			background-color: #f9f9f9;
			margin-top:2px;
		}

		.pgto{
			margin:1px;
		}

		.fonte13{
			font-size:13px;
		}

		.esquerda{
			display:inline;
			width:50%;
			float:left;
		}

		.direita{
			display:inline;
			width:50%;
			float:right;
		}

		.table{
			padding:15px;
			font-family:Verdana, sans-serif;
			margin-top:20px;
		}

		.texto-tabela{
			font-size:12px;
		}


		.esquerda_float{

			margin-bottom:10px;
			float:left;
			display:inline;
		}


		.titulos{
			margin-top:10px;
		}

		.image{
			margin-top:-10px;
		}

		.margem-direita{
			margin-right: 80px;
		}

		.margem-direita50{
			margin-right: 50px;
		}

		hr{
			margin:8px;
			padding:1px;
		}


		.titulorel{
			margin:0;
			font-size:28px;
			font-family:Arial, Helvetica, sans-serif;
			color:#6e6d6d;

		}

		.margem-superior{
			margin-top:30px;
		}


	</style>

</head>
<body>


	<div class="cabecalho">
		<div class="container">
			<div class="row titulos">
<!--
				<div class="col-sm-2 esquerda_float image">	
					<img src="../../img/logo.png" width="180px">
				</div>
-->
				<div class="col-sm-10 esquerda_float">	
					<h2 class="titulo"><b><?php echo strtoupper($nome_loja) ?></b></h2>
					<h6 class="subtitulo"><?php echo $endereco_loja . ' Tel: '.$telefone  ?></h6>

				</div>
			</div>
		</div>

	</div>

	<div class="container-fluid">

		<div class="row">
			<div class="col-sm-8 esquerda">	
				<span class="titulorel"> Relatório Demonstração do Resultado do Exercício</span>
			</div>
			<div class="col-sm-4 direita" align="right">	
				<big> <small> Data: <?php echo $data_hoje; ?></small> </big>
			</div>
		</div>


		<hr>



		<div class="row margem-superior">
			<div class="col-md-12">
				<div class="esquerda_float margem-direita50">	
					<span class=""> <b> Período da Apuração </b> </span>
				</div>
				<div class="esquerda_float margem-direita50">	
					<span class=""> <?php echo $apuracao ?> </span>
				</div>
				
			</div>
		</div>


		<hr>


<div class="card shadow mb-4">
    <div class="card-body"> 
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tr bgcolor='#B4C6E7'>
                    <td width="33%"><b>Faturamento</b></td>
                    <td width="33%">&nbsp; <small>R$ <?php echo $faturamentoF; ?> </small></td>
                    <td width="33%"><small> </small></td>
                </tr>
                <tr>
                    <td class="text-success"><small >+ Pedidos Online </small></td>
                    <td class="text-success">&nbsp;<small>R$ <?php echo $total_pedidos_onlineF; ?></small></td>
                    <td><small></small></td>
                </tr>
                <tr>
                    <td class="text-success"><small>+ Vendas Online </small></td>
                    <td class="text-success">&nbsp;<small> R$ <?php echo $total_vendas_onlineF; ?> </small></td>
                    <td><small></small></td>
                </tr>
                <tr>
                    <td class="text-success"><small>+ Vendas Fisicas </small></td>
                    <td class="text-success">&nbsp;<small> R$ <?php echo $total_vendas_fisicaF; ?> </small></td>
                    <td><small></small></td>
                </tr>
                <tr bgcolor='#F7CAAC'>
                    <td><b> Custos </b></td>
                    <td>&nbsp;<small> R$ <?php echo $totalCustoF; ?> </small></td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td class="text-danger"><small>- Custo de Mercadorias Vendidas </small></td>
                    <td class="text-danger">&nbsp;<small> R$ <?php echo $totalCustoMercadoriaF; ?> </small></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="text-danger"><small>- Taxas de Cartão </small></td>
                    <td class="text-danger">&nbsp;<small> R$ <?php echo $totalTaxaCartaoF; ?> </small></td>
                    <td>&nbsp;</td>
                </tr>       
                <tr>
                    <td class="text-danger"><small>- Vendas Canceladas </small></td>
                    <td class="text-danger">&nbsp;<small> R$ <?php echo $total_vendas_canceladaF; ?> </small></td>
                    <td><small></small></td>
                </tr>
                <tr>
                    <td class="text-danger"><small>- Vendas sem Pagar </small></td>
                    <td class="text-danger">&nbsp;<small> R$ <?php echo $vendasSemPagarF; ?> </small></td>
                    <td><small></small></td>
                </tr>
                <tr>
                    <td class="text-danger"><small>- Descontos </small></td>
                    <td class="text-danger">&nbsp;<small> R$ <?php echo $totalDescontoF; ?> </small></td>
                    <td><small></small></td>
                </tr>
                <tr bgcolor='#C5E0B3'>
                    <td><b>Receita Liquida</b></td>
                    <td>&nbsp; <small>R$ <?php  echo $receitaBrutaF ?></small></td>
                    <td></td>
                </tr>
                <tr bgcolor='#F7CAAC'>
                    <td><b> Despesas </b></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td><small>Compras</small></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td><small>Água</small></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td><small>Luz</small></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td><small>Internet</small></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td><small>Aluguel</small></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td><small>Salário</small></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
                <tr bgcolor='#C5E0B3'>
                    <td><b>Lucro Liquido</b></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><small>Total</small></td>
                    <td>&nbsp; </td>
                    <td>&nbsp; </td>
                </tr>
            </table>
        </div>
    </div>
</div> 





<script type="text/javascript">
	$(document).ready(function() {
		$('#dataTable').DataTable({
			"ordering": false
		});
	} );
</script>



		


	</div>


	<div class="footer">
		<p style="font-size:14px" align="center"><?php echo $rodape_relatorios ?></p> 
	</div>




</body>
</html>
