<?php 
$pag = 'vendas';
@session_start();

require_once("../../conexao.php"); 
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}

?>   

<center><h4>Vendas Presenciais</h4></center><br>
	<?php 
	$query = $pdo->query("SELECT * from vendas where tipo = 'venda_fisica' order by id desc");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){ 
		?>
<div class="card shadow mb-4">

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>ID</th>
						<th>Valor</th>
						<th>Data</th>
						<th>Operador</th>
						<th>Pagamento</th>						
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>

					<?php 
					for($i=0; $i < $total_reg; $i++){
						foreach ($res[$i] as $key => $value){	}

				        $id_operador = $res[$i]['operador'];
						$tipo_pgto = $res[$i]['id_forma_pagamento'];

						$data2 = implode('/', array_reverse(explode('-', $res[$i]['data'])));

						$total = number_format( $res[$i]['total'] , 2, ',', '.');

						$res_2 = $pdo->query("SELECT * from forma_pgtos where codigo = '$tipo_pgto' ");
						$dados = $res_2->fetchAll(PDO::FETCH_ASSOC);
						$nome_pgto = $dados[0]['nome'];

						$res_2 = $pdo->query("SELECT * from usuarios where id = '$id_operador' ");
						$dados = $res_2->fetchAll(PDO::FETCH_ASSOC);
						$nome_operador = $dados[0]['nome'];


						if($res[$i]['status'] == 'Concluída'){
							$classe = 'text-success';
						}else{
							$classe = 'text-danger';
						}


						?>

						<tr>
							<td>
								<i class="bi bi-square-fill <?php echo $classe ?>"></i>
								<?php echo $res[$i]['id'] ?></td>
								<td>R$ <?php echo $total ?></td>
								<td><?php echo $data2 . '  ' .$res[$i]['hora'] ?></td>
								<td><?php echo $nome_operador ?></td>
								<td><?php echo $nome_pgto ?></td>


								<td>
									<a href="../painel-operador/comprovante_class.php?id=<?php echo $res[$i]['id'] ?>" title="Gerar Comprovante" target="_blank" style="text-decoration: none">
										<i class="bi bi-clipboard-check text-primary"></i>
									</a>

									<?php if($res[$i]['status'] == 'Concluída'){ ?>

									<a href="index.php?pagina=<?php echo $pag ?>&funcao=deletar&id=<?php echo $res[$i]['id'] ?>" title="Cancelar venda">
										<i class="fas fa-trash text-danger mx-1"></i>
									</a>
								<?php } ?>
								</td>
							</tr>

						<?php } ?>

					</tbody>

				</table>
		<?php }else{
			echo '<p>Não existem dados para serem exibidos!!';
		} ?>
	</div>
    </div>




	<div class="modal fade" tabindex="-1" id="modalDeletar" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Cancelar Venda</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form method="POST" id="form-excluir">
					<div class="modal-body">

						<p>Deseja Realmente Cancelar Esta Venda?</p>

						<small><div align="center" class="mt-1" id="mensagem-excluir">

						</div> </small>

					</div>
					<div class="modal-footer">
						<button type="button" id="btn-fechar" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
						<button name="btn-excluir" id="btn-excluir" type="submit" class="btn btn-danger">Cancelar</button>

						<input name="id" type="hidden" value="<?php echo @$_GET['id'] ?>">

					</div>
				</form>
			</div>
		</div>
	</div>




	<?php 
	if(@$_GET['funcao'] == "deletar"){ ?>
		<script type="text/javascript">
			var myModal = new bootstrap.Modal(document.getElementById('modalDeletar'), {

			})

			myModal.show();
		</script>
	<?php } ?>






	<!--AJAX PARA EXCLUIR DADOS -->
	<script type="text/javascript">
		$("#form-excluir").submit(function () {
			var pag = "<?=$pag?>";
			event.preventDefault();
			var formData = new FormData(this);

			$.ajax({
				url: pag + "/excluir.php",
				type: 'POST',
				data: formData,

				success: function (mensagem) {

					$('#mensagem').removeClass()

					if (mensagem.trim() == "Excluído com Sucesso!") {

						$('#mensagem-excluir').addClass('text-success')

						$('#btn-fechar').click();
						window.location = "index.php?pagina="+pag;

					} else {

						$('#mensagem-excluir').addClass('text-danger')
					}

					$('#mensagem-excluir').text(mensagem)

				},

				cache: false,
				contentType: false,
				processData: false,

			});
		});
	</script>



	
    
<script type="text/javascript">
    $(document).ready(function () {
        $('#dataTable').dataTable({
            "ordering": false
        })

    });
</script>



