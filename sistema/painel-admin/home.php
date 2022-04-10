<?php 
date_default_timezone_set('America/Sao_Paulo');

//VERIFICAR SE TEM REGISTROS NO CARRINHO COM MAIS DE XX DIAS
$data_carrinho = date('Y-m-d', strtotime("-".$dias_limpar_carrinho." days"));
$res = $pdo->query("SELECT * from carrinho where data <= '$data_carrinho' and id_venda = 0");
$dados = $res->fetchAll(PDO::FETCH_ASSOC);
for ($i=0; $i < count($dados); $i++) { 
 foreach ($dados[$i] as $key => $value) {
 }
 $id_produto = $dados[$i]['id_produto'];	
 $combo = $dados[$i]['combo'];
 $id = $dados[$i]['id'];

 if($combo != 'Sim'){

 $query_c = $pdo->query("SELECT * from carac_prod where id_prod = '$id_produto'");
$res_c = $query_c->fetchAll(PDO::FETCH_ASSOC);
$total_prod_carac = @count($res_c);

if($total_prod_carac > 0){

	   $query4 = $pdo->query("SELECT * from carac_itens_car where id_carrinho = '$id'");
	  $res4 = $query4->fetchAll(PDO::FETCH_ASSOC);
	  
	  
	  for ($i2=0; $i2 < count($res4); $i2++) { 
	      foreach ($res4[$i2] as $key => $value) {
	  }

	  $pdo->query("DELETE FROM carac_itens_car where id_carrinho = '$id'");

	
	}
}

}

 $pdo->query("DELETE FROM carrinho where id = '$id'");
}

$sql = "SELECT * FROM acessos WHERE hora > :hora GROUP BY ip";
$sql = $pdo->prepare($sql);
$sql->bindValue(":hora", date('H:i:s', strtotime("-2 minutes")));
$sql->execute();
$clientesOnline = $sql->rowCount();


$res_todos = $pdo->query("SELECT * FROM vendas where data = curDate()");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$totalPedidosHoje = count($dados_total);


$res_todos = $pdo->query("SELECT * FROM vendas where data = curDate() and status = 'Encomendado'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$pedidosFinalizados = count($dados_total);


$res_todos = $pdo->query("SELECT * FROM vendas where data = curDate() and status = 'Comprado'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$pedidosPendentes = count($dados_total);


$res_todos = $pdo->query("SELECT * FROM vendas where data = curDate()");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_dia;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_dia = @$total_vendas_dia + $dados_total[$i2]['total'];
}    
$total_dia = @$total_vendas_dia;
$total_dia = number_format($total_dia, 2, ',', '.');



$res_todos = $pdo->query("SELECT * FROM vendas");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$totalPedidos = count($dados_total);



$res_todos = $pdo->query("SELECT * FROM vendas where status = 'Comprado'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$totalPedidosPendentes = count($dados_total);



 $mes_atual = Date("m");
 $ano_atual = Date("Y");
 $data_inicial = $ano_atual."-".$mes_atual."-01";

//TOTAL VENDIDO MES
$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$data_inicial' and data <= curDate()");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_mes;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_mes = @$total_vendas_mes + $dados_total[$i2]['total'];
}    
$total_mes = @$total_vendas_mes;
$total_mes = number_format($total_mes, 2, ',', '.');
 
//TOTAL VENDIDO GERAL
$res_todos = $pdo->query("SELECT * FROM vendas");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_geral;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_geral = @$total_vendas_geral + $dados_total[$i2]['total'];
}    
$total_geral = @$total_vendas_geral;
$total_geral = number_format($total_geral, 2, ',', '.');


$res_todos = $pdo->query("SELECT * FROM vendas where data >= '$data_inicial' and data <= curDate()");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$quantidade_vendas = @count($dados_total);


$res_todos = $pdo->query("SELECT * FROM clientes");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$quantidade_clientes = @count($dados_total);

$res_todos = $pdo->query("SELECT * FROM produtos");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$quantidade_produtos = @count($dados_total);


$res_todos = $pdo->query("SELECT * FROM carrinho WHERE id_venda = 0 GROUP by id_usuario");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$carrinho_abandonados = @count($dados_total);


$res_todos = $pdo->query("SELECT * FROM produtos where promocao = 'Sim'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$quantidade_promocoes = @count($dados_total);

//CALCULANDO O VALOR TOTAL DE PRODUTOS EM ESTOQUE 
$totalValorEstoque = 0;
$totalCustoEstoque = 0;
$totalDescontoEstoque = 0;
$totalLucroEstoque = 0;


    $query_esto = $pdo->query("SELECT * FROM estoque order by quantidade");
    $res_esto = $query_esto->fetchAll(PDO::FETCH_ASSOC);
    for ($q=0; $q < count($res_esto); $q++) { 
        foreach ($res_esto[$q] as $key => $value) {
        }

        $id_estoque = $res_esto[$q]['id'];
        $id_produto = $res_esto[$q]['id_produto'];
        $quantidade = $res_esto[$q]['quantidade'];
        $id_cor = $res_esto[$q]['id_carac_itens_cor'];
        $id_tamanho = $res_esto[$q]['id_carac_itens_tamanho'];
        $num_vendas = $res_esto[$q]['vendas'];
           $query_prod = $pdo->query("SELECT * FROM produtos where id = $id_produto");
            $res = $query_prod->fetchAll(PDO::FETCH_ASSOC);
            $nome = $res[0]['nome'];
            $valor = $quantidade * $res[0]['valor'];
            $custo = $quantidade * $res[0]['custo'];
        
            if($res[0]['promocao'] == "Sim"){
                $query_Prom = $pdo->query("SELECT * FROM promocoes where id_produto = $id_produto");
                $resProm = $query_Prom->fetchAll(PDO::FETCH_ASSOC);
                $valorProm = $quantidade * $resProm[0]['valor'];
                
                $valorDesc = $valor - $valorProm;
                
                $totalDescontoEstoque += $valorDesc;
            }
            
            $totalValorEstoque += $valor;
            $totalCustoEstoque += $custo;
    }
$totalValorEstoqueF  = number_format($totalValorEstoque, 2, ',', '.'); 
$totalCustoEstoqueF  = number_format($totalCustoEstoque, 2, ',', '.');
$totalDescontoEstoqueF = number_format($totalDescontoEstoque, 2, ',', '.');
$LucroEstoque = $totalValorEstoque - $totalCustoEstoque - $totalDescontoEstoque;
$LucroEstoqueF = number_format($LucroEstoque, 2, ',', '.');

//CALCULANDO LUCRO DAS MOVIMENTAÇÕES 

$entradas = 0;
$saidas = 0;
$saldo = 0;
$query = $pdo->query("SELECT * from movimentacoes order by id desc");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){ 

	for($i=0; $i < $total_reg; $i++){
		foreach ($res[$i] as $key => $value){	}


			if($res[$i]['tipo'] == 'Entrada'){
				
				$entradas += $res[$i]['valor'];
			}else{
				
				$saidas += $res[$i]['valor'];
			}

			$saldo = $entradas - $saidas;

			$entradasF = number_format($entradas, 2, ',', '.');
			$saidasF = number_format($saidas, 2, ',', '.');
			$saldoF = number_format($saldo, 2, ',', '.');

			if($saldo < 0){
				$classeSaldo = 'text-danger';
			}else{
				$classeSaldo = 'text-success';
			}

    }
}
?>


<div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Pedidos Hoje</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo @$totalPedidosHoje ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Pedidos Encomendadas Hoje</div>
                        <div class="h5 mb-0 font-weight-bold text-success-800"><?php echo @$pedidosFinalizados ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Pedidos Pendentes Hoje</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo @$pedidosPendentes ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-danger"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Vendido Hoje</div>
                        <div class="h5 mb-0 font-weight-bold text-success-800"><?php echo @$total_dia ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total de Pedidos</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo @$totalPedidos ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-box fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Total Pedidos Pendentes</div>
                        <div class="h5 mb-0 font-weight-bold text-danger-800"><?php echo @$totalPedidosPendentes ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-boxes fa-2x text-danger"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Pedidos Mês</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo @$quantidade_vendas ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pending Requests Card Example -->
     <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Vendido Mês</div>
                        <div class="h5 mb-0 font-weight-bold text-success-800"><?php echo @$total_mes ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-money-check fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
</div>



<div class="row">


    
        <!-- Pending Requests Card Example -->
     <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Vendido Geral</div>
                        <div class="h5 mb-0 font-weight-bold text-success-800"><?php echo @$total_geral ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-money-check fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Clientes Cadastrados</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo @$quantidade_clientes ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-users fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Produtos Cadastrados</div>
                        <div class="h5 mb-0 font-weight-bold text-success-800"><?php echo @$quantidade_produtos ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-boxes fa-2x text-info"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- Pending Requests Card Example -->
     <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Produtos em Promoções</div>
                        <div class="h5 mb-0 font-weight-bold text-success-800"><?php echo @$quantidade_promocoes ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-boxes fa-2x text-warning"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>





<div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Valor do Estoque</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">R$ <?php echo @$totalValorEstoqueF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Custo do Estoque</div>
                        <div class="h5 mb-0 font-weight-bold text-danger-800">R$ <?php echo @$totalCustoEstoqueF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-danger "></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Promoções no Estoque</div>
                        <div class="h5 mb-0 font-weight-bold text-danger-800">R$ <?php echo @$totalDescontoEstoqueF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-danger "></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Lucro do Estoque</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">R$ <?php echo @$LucroEstoqueF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Entradas em caixa</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">R$ <?php echo @$entradasF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Saídas em caixa</div>
                        <div class="h5 mb-0 font-weight-bold text-danger-800">R$ <?php echo @$saidasF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-danger "></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Saldo em caixa</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">R$ <?php echo @$saldoF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    
        <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Clientes Online</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo @$clientesOnline ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-users fa-2x text-warning"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-secondary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-secondary text-uppercase mb-1">Carrinhos Abandonados</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?php echo @$carrinho_abandonados ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-clipboard-list fa-2x text-secondary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>

<?php
require_once 'server/Relatorios.php';
$relatorio = new Relatorios();
                          
                            
?>

<div class="card mb-3">
  <div class="card-header">

    Pedidos em cada mês no ano atual</div>
  <div class="card-body">
    <canvas id="grafico" width="100%" height="15px"></canvas>
  </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       


<!--
<div class="card mb-3">
  <div class="card-header">

    Relatório de visitas, cadastros e vendas no dia atual</div>
  <div class="card-body">
    <div id="columnchart_material" width="100%" height="15px"></div>
  </div>
</div>
-->



<script type="text/javascript">
let json = <?php echo $relatorio->vendas_anual();?>;

    
let chaves = [];
let valores = [];
    
for(let i in json){
 // adiciona na array nomes a key do campo do json
 chaves.push(i);
 // adiciona na array de valore o value do campo do json
 valores.push(json[i]);
}
    
var limiteMaximo = Math.max.apply(null, valores ); 
    
window.onload = function(){
    var contexto = document.getElementById("grafico").getContext("2d");
    var grafico = new Chart(contexto, {
        type:'bar',
        data: {
            labels: chaves,
            datasets: [{
              label: "vendas",
              lineTension: 0.3,
              backgroundColor: "#F56C28",
              borderColor: "rgba(2,117,216,1)",
              pointRadius: 1,
              pointBackgroundColor: "rgba(2,117,216,1)",
              pointBorderColor: "rgba(255,255,255,0.8)",
              pointHoverRadius: 1,
              pointHoverBackgroundColor: "rgba(2,117,216,1)",
              pointHitRadius: 50,
              pointBorderWidth: 2,
              data: valores,
            }]
        },
              options: {
        scales: {
          xAxes: [{
            time: {
              unit: 'date'
            },
            gridLines: {
              display: false
            },
            ticks: {
              maxTicksLimit: 7
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: limiteMaximo,
              maxTicksLimit: 5
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            }
          }],
        },
        legend: {
          display: false
        }
      }
        
        
    });
}	



</script>



<!--
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Mês', 'Visitas', 'Cadastros', 'Vendas'],
          ['Janeiro',    1000,        400,      200],
          ['Fevereiro',    1170,        460,      250],
          ['Março',     660,       500,      300],
          ['Abril',    758,        540,      350],
          ['Maio',    890,        580,      350],
          ['Junho',    940,        480,      350],
          ['Julho',    1005,        540,      350],
          ['Agosto',    1100,        550,      350],
          ['Setembro',    1150,        575,      350],
          ['Outubro',    1300,        650,      350],
          ['Novembro',    1550,        775,      350],
          ['Dezembro',    1800,        900,      350]

        ]);
          console.log(chaves, valores);

        var options = {
          chart: {
            title: 'Visitas, Cadastros, e Vendas: ano atual',
            subtitle: '',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
-->






        
          










