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


?>

<!DOCTYPE html>
<html>
<head>
	<title>Vendas</title>
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
				<span class="titulorel"> Relatório de Vendas x Lucro</span>
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


		<table class='table' width='100%'  cellspacing='0' cellpadding='3'>
			<tr bgcolor='#f9f9f9' >
                <th>ID</th>
				<th>Cliente</th>
<!--                <th>Data</th>-->
                <th>Total Bruto</th>
                <th>Taxa</th>
                <th>CMV</th>
                <th>Frete</th>
                <th>Lucro</th>

						

			</tr>
			<?php 
			$saldo = 0;
            $taxas = 0;
            $fretes = 0;
            $total_custos = 0;
            $total_lucro =  0;
			
			$query_ped = $pdo->query("SELECT * FROM vendas where data >= '$dataInicial' and data <= '$dataFinal' and pago = 'Sim' order by data asc, id asc");
                   $res_ped = $query_ped->fetchAll(PDO::FETCH_ASSOC);

                   for ($i=0; $i < count($res_ped); $i++) { 
                      foreach ($res_ped[$i] as $key => $value) {
                      }

//						$produto = $res[$i]['produto'];
						$valor = $res_ped[$i]['total'];
                        $total_custo = $res_ped[$i]['total_custo'];
						$taxa = $res_ped[$i]['taxas'];
                        $frete = $res_ped[$i]['frete'];
						$data = $res_ped[$i]['data'];
						$id_venda = $res_ped[$i]['id'];
                       
                   
						
                        //somando total
                        $taxas = $taxas + $taxa;
						$saldo = $saldo + $valor;
                        $fretes = $fretes + $frete;
                        $total_custos = $total_custos + $total_custo;
                       
                        $total_lucro = $total_lucro + @$valor - (@$taxa + @$total_custo + @$frete);
                       
                       
                        $total_custosF = number_format($total_custos, 2, ',', '.');
                        $total_lucroF = number_format($total_lucro, 2, ',', '.');
                        $fretesF =  number_format($fretes, 2, ',', '.');
                        $taxasF = number_format($taxas, 2, ',', '.');
						$saldoF = number_format($saldo, 2, ',', '.');
						
						//buscando o cliente da venda
                        $query_v = $pdo->query("SELECT * FROM vendas where id = '$id_venda' ");
                        $res_v = $query_v->fetchAll(PDO::FETCH_ASSOC);
                        $id_usu = $res_v[0]['id_usuario'];
                       
                        if($id_usu != null){
                            $query_u = $pdo->query("SELECT * FROM usuarios where id = '$id_usu' ");
                            $res_u = $query_u->fetchAll(PDO::FETCH_ASSOC);
                            $cpf_usu = $res_u[0]['cpf'];

                            $query = $pdo->query("SELECT * FROM clientes where cpf = '$cpf_usu' ");
                            $res = $query->fetchAll(PDO::FETCH_ASSOC);
                            $nome_usu2 = $res_u[0]['nome'];
                        }else{
                            $nome_usu2 = "Cliente não informado no PDV";
                        }

                        

//						$query_usu = $pdo->query("SELECT * FROM usuarios where cpf = '$funcionario' ");
//						$res_usu = $query_usu->fetchAll(PDO::FETCH_ASSOC);
//						$nome_funcionario = $res_usu[0]['nome'];


						$valorF = number_format($valor, 2, ',', '.');
						
						$data = implode('/', array_reverse(explode('-', $data)));
				?>

				<tr>
					<td><?php echo $id_venda ?></td>
					<td><?php echo @$nome_usu2 ?></td>
<!--                    <td><?php echo @$data ?></td>-->
                    <td>R$ <?php echo number_format($valor, 2, ',', '.') ?></td>
                    <td>R$ <?php echo number_format($taxa, 2, ',', '.') ?></td>
                    <td>R$ <?php echo number_format($total_custo, 2, ',', '.') ?></td>
                    <td>R$ <?php echo number_format($frete, 2, ',', '.') ?></td>
                    <td>R$ <?php echo number_format($valor - (@$taxa + @$total_custo + @$frete), 2, ',', '.') ?></td>
                
				</tr>
               
            
			<?php } ?>
            
             <tr>
                    <td></td>
                    <td></td>
<!--                    <td></td>-->
                    <td><b>  R$ <?php echo @$saldoF; ?> </b></td>
                    <td><b>  R$ <?php echo @$taxasF; ?> </b></td>
                    <td><b>  R$ <?php echo @$total_custosF; ?> </b></td>
                    <td><b>  R$ <?php echo @$fretesF; ?> </b></td>
                    <td><b>  R$ <?php echo @$total_lucroF; ?> </b></td>
                </tr>


		</table>


		


	</div>


	<div class="footer">
		<p style="font-size:14px" align="center"><?php echo $rodape_relatorios ?></p> 
	</div>




</body>
</html>
