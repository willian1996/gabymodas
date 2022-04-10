<?php  
$pag = "estoque";
require_once("../../conexao.php"); 
@session_start();
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}

$totalValorEstoque = 0;
$totalCustoEstoque = 0;
$totalDescontoEstoque = 0;
$totalLucroEstoque = 0;

?>
	



<div class="card shadow mb-4">

    <div class="card-body">
        <div class="table-responsive">
<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <tr bgcolor='#f8f8ff'>
        <td>Quantidade</td>
        <td>Produto</td>

        <td>Código</td>
        <td>Cor</td>
        <td>Tamanho</td>
        <td>Vendas</td>
    </tr>
    <?php
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
        

    ?>
    
    <tr>
        <td><?php echo $quantidade; ?> </td>
        <td>
            <?php
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
        
            ?>
            <a class="text-primary" href="index.php?pag=produto&id=<?php echo $id_produto ?>">
                <?php echo $nome ?>
            </a>
        </td>


        <td><?php echo @$id_estoque; ?></td>

        <td>
            <?php
            if($id_cor != null){
                $query_cor = $pdo->query("SELECT * FROM carac_itens where id = $id_cor");
                $res = $query_cor->fetchAll(PDO::FETCH_ASSOC);
                $cor = $res[0]['nome'];
                echo $cor;
            }else{
                echo "Não informado";
            }

            ?> 
        </td>
        <td>
            <?php
            if($id_tamanho != null){
                $query_tam = $pdo->query("SELECT * FROM carac_itens where id = $id_tamanho");
                $res = $query_tam->fetchAll(PDO::FETCH_ASSOC);
                $tamanho = $res[0]['nome'];
                echo $tamanho;  
            }else{
                echo "Não informado";
            }

            ?>                
        </td>
        <td>
        <?php echo $num_vendas; ?>
        </td>
    </tr>
    <?php } ?>
    
</table>
        </div>
    </div>
</div>

<?php 
$totalValorEstoqueF  = number_format($totalValorEstoque, 2, ',', '.'); 
$totalCustoEstoqueF  = number_format($totalCustoEstoque, 2, ',', '.');
$totalDescontoEstoqueF = number_format($totalDescontoEstoque, 2, ',', '.');
$LucroEstoque = $totalValorEstoque - $totalCustoEstoque - $totalDescontoEstoque;
$LucroEstoqueF = number_format($LucroEstoque, 2, ',', '.');
?>

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
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Custo do Estoque</div>
                        <div class="h5 mb-0 font-weight-bold text-danger-800">R$ <?php echo @$totalCustoEstoqueF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-danger "></i>
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
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Lucro do Estoque</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">R$ <?php echo @$LucroEstoqueF ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-coins fa-2x text-success"></i>
                    </div>
                </div>
            </div>
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








