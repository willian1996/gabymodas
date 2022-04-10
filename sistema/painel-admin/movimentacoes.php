<?php 
$pag = 'movimentacoes'; 
@session_start();
$entradas = 0;
$saidas = 0;

require_once("../../conexao.php"); 
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}

?>

	<?php 
	$query = $pdo->query("SELECT * from movimentacoes order by id desc");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){ 
		?>
<center><h4>Movimentações</h4></center><br>
<div class="card shadow mb-4">
 
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>Tipo</th>
						<th>Descrição</th>
						<th>Valor</th>
                        <th>PGTO</th>
						<th>Usuário</th>
						<th>Data</th>
						
					</tr>
				</thead>
				<tbody>

					<?php 
					for($i=0; $i < $total_reg; $i++){
						foreach ($res[$i] as $key => $value){	}
                        $tipo_pgto = $res[$i]['forma_pgto'];

							//BUSCAR OS DADOS DO USUARIO
							$id_usu = $res[$i]['usuario'];
						$query_f = $pdo->query("SELECT * from usuarios where id = '$id_usu'");
						$res_f = $query_f->fetchAll(PDO::FETCH_ASSOC);
						$total_reg_f = @count($res_f);
						if($total_reg_f > 0){ 
							$nome_usuario = $res_f[0]['nome'];
							
						}
                        
                        //BUSCAR A FORMA DE PAGAMENTO
                        $res_2 = $pdo->query("SELECT * from forma_pgtos where codigo = '$tipo_pgto' ");
						$dados = $res_2->fetchAll(PDO::FETCH_ASSOC);
						$nome_pgto = $dados[0]['nome'];


						if($res[$i]['tipo'] == 'Entrada'){
							$classe = 'text-success';
							
						}else{
							$classe = 'text-danger';
							
						}


						
						?>

						<tr>
							<td>								<i class="<?php echo $classe ?>"><?php echo $res[$i]['tipo']?></i> 
								<span class="d-none"><?php echo $res[$i]['tipo'] ?></span>
							</td>

							<td><?php echo $res[$i]['descricao'] ?></td>
							<td>R$ <?php echo number_format($res[$i]['valor'], 2, ',', '.'); ?></td>
                            <td> <?php echo $nome_pgto; ?></td>

							<td><?php echo $nome_usuario ?></td>

							

							<td><?php echo implode('/', array_reverse(explode('-', $res[$i]['data']))); ?></td>

							

							
							
						</tr>

					<?php } ?>

				</tbody>

			</table>

        </div></div>
	<?php }else{
		echo '<p>Não existem dados para serem exibidos!!';
	} ?>
</div>

<?php 
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
    <div class="col-xl-4 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Entradas</div>
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
    <div class="col-xl-4 col-md-6 mb-4">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Saídas</div>
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
    <div class="col-xl-4 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Saldo</div>
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

 

<script type="text/javascript">
    $(document).ready(function() {
        $('#dataTable').DataTable({
            "ordering": false
        });
    } );
</script>




