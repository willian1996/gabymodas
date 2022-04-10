<?php  
$url_loja = "http://localhost/Catalogo-Virtual-2021";
$banco = 'catalogo_virtual_2020';
$servidor = 'localhost';
$usuario = 'root';
$senha = '';

date_default_timezone_set('America/Sao_Paulo');

try {
	$pdo = new PDO("mysql:dbname=$banco;host=$servidor;charset=utf8", "$usuario", "$senha");

	//CONEXAO MYSQLI PARA O BACKUP
	$conn = mysqli_connect($servidor, $usuario, $senha, $banco);

} catch (Exception $e) {
	echo "Erro ao conectar com o banco de dados! " . $e;
}

@session_start();


setlocale(LC_TIME, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
date_default_timezone_set('America/Sao_Paulo');
$data_hoje = strtoupper(utf8_encode(strftime('%A, %d de %B de %Y', strtotime('today'))));

$dataInicial = "2021/11/01";
$dataFinal = "2021/11/30";


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
	<title>Encomendados</title>
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
					<img src="../../img/gb.jpg" width="180px">
				</div>
-->
				<div class="col-sm-10 esquerda_float">	
					<h2 class="titulo"><b><?php echo strtoupper($nome_loja) ?></b></h2>
					<h6 class="subtitulo"><?php echo $endereco_loja . ' Tel: '.$telefone  ?></h6>

				</div>
			</div>
		</div>

	</div>

	<div class="container">

		<div class="row">
			<div class="col-sm-8 esquerda">	
				<span class="titulorel"> Relatório de Compras </span>
			</div>
			<div class="col-sm-4 direita" align="right">	
				<big> <small> Data: <?php echo $data_hoje; ?></small> </bi g>
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
            <tr bgcolor='#ccc' >
                <th>Produto</th>
            </tr> 
			<?php 
			$query_ped = $pdo->query(" 
			SELECT
				p.id as id,
				p.nome as nome_produto
			FROM 
				carrinho c
				inner join vendas v on c.id_venda = v.id
				inner join produtos p on c.id_produto = p.id
			WHERE
				v.status = 'Encomendado'
				and v.data BETWEEN '{$dataInicial}' AND '{$dataFinal}'
			GROUP BY
				p.id       
			");
            
			$res_ped = $query_ped->fetchAll(PDO::FETCH_ASSOC);

			foreach($res_ped as $res){
			?>
				<tr>
                    <td><?php echo $res['id'] . ' - ' . $res['nome_produto'] ?>
                        <table class='table' width='100%'  cellspacing='0' cellpadding='3'>
                                  <tr bgcolor='#f9f9f9'>
                                    <td>&nbsp;</td>
                                    <td>Quantidade</td>
                                    <td>Cor</td>
                                    <td>Tamanho</td>
									<td>Status</td>
                                  </tr>
                                  <tr>

									<?php 
									$query_ped2 = $pdo->query(" 
									WITH
										cic_tamanho as (
											select 
												id,
												id_carrinho,
												nome 
											from 
												carac_itens_car
											where
												id_carac = 1
										),
										cic_cor as (
											select
												id,
												id_carrinho,
												nome 
											from 
												carac_itens_car
											where
												id_carac = 2
										)
									SELECT
										tb.id as id,
										tb.nome_produto as nome_produto,
										sum(tb.quantidade) as quantidade,
										tb.tamanho as tamanho,
										tb.cor as cor,
										tb.status as status
									FROM (
										SELECT
											p.id as id,
											p.nome as nome_produto,
											c.quantidade as quantidade,
											coalesce(cict.nome, 'Tamanho não informado') as tamanho,
											coalesce(cicc.nome, 'Cor não informada') as cor,
											v.status as status
										FROM 
											carrinho c
											left join vendas v on c.id_venda = v.id
											left join produtos p on c.id_produto = p.id
											left join cic_tamanho cict on c.id = cict.id_carrinho
											left join cic_cor cicc on c.id = cicc.id_carrinho
										WHERE
											v.status = 'Encomendado'
											and v.data BETWEEN '{$dataInicial}' AND '{$dataFinal}'
											and p.id = {$res['id']}
										GROUP BY
											p.id,
											cicc.id,
											cict.id
									) tb
									WHERE
										tb.id = {$res['id']}
									GROUP BY
										tb.id,
										tb.tamanho,
										tb.cor           
									");						
									
									$res_ped2 = $query_ped2->fetchAll(PDO::FETCH_ASSOC);

									foreach($res_ped2 as $res2){
									?>

									<tr>
                                    	<td>&nbsp;</td>
                                    	<td><?php echo $res2['quantidade'] ?></td>
                                    	<td><?php echo $res2['cor'] ?></td>
                                    	<td><?php echo $res2['tamanho'] ?></td>
										<td><?php echo $res2['status'] ?></td>
									</tr>

									<?php } ?>
                                                                                          
                        </table>                                               
                    </td>                    							
				</tr>			
			<?php } ?>


		</table>




	</div>


	<div class="footer">
		<p style="font-size:14px" align="center"><?php echo $rodape_relatorios ?></p> 
	</div>




</body>
</html>

