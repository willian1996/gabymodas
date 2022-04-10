<?php 
$pag = "dre";
require_once("../../conexao.php"); 
@session_start();
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}

//-------------TOTAL VENDIDO GERAL---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$faturamento = 0;



 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
     @$faturamento += $dados_total[$i2]['total'];
    
     
}    
$faturamentoF = number_format($faturamento, 2, ',', '.');


//---------------TOTAL PEDIDOS ONLINE---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where tipo = 'pedido_online'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_pedidos_online = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_pedidos_online += $dados_total[$i2]['total'];
}    
$total_pedidos_onlineF = number_format($total_pedidos_online, 2, ',', '.');

//---------------TOTAL VENDAS ONLINE---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where tipo = 'venda_online'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_online = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_online += $dados_total[$i2]['total'];
}    
$total_vendas_onlineF = number_format($total_vendas_online, 2, ',', '.');

//---------------TOTAL Vendas Fisicas---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where tipo = 'venda_fisica'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_fisica = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_fisica += $dados_total[$i2]['total'];
}    
$total_vendas_fisicaF = number_format($total_vendas_fisica, 2, ',', '.');

//---------------TOTAL Vendas Canceladas---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where tipo = 'venda_cancelada'");
$dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
$total_vendas_cancelada = 0;
 for ($i2=0; $i2 < count($dados_total); $i2++) { 
          foreach ($dados_total[$i2] as $key => $value) {
      }
   @$total_vendas_cancelada += $dados_total[$i2]['total'];
}    
$total_vendas_canceladaF = number_format($total_vendas_cancelada, 2, ',', '.');


//-------------TOTAL DEMAIS CUSTOS---------------------------
$res_todos = $pdo->query("SELECT * FROM vendas where tipo != 'venda_cancelada' and pago = 'Sim'");
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
$res_todos = $pdo->query("SELECT * FROM vendas where tipo != 'venda_cancelada' and pago !='Sim'");
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








