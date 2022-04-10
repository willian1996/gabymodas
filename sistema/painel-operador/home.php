<?php 
require_once('../../conexao.php');
require_once('verificar-permissao.php');
@session_start(); 
$id_usuario = $_SESSION['id_usuario'];
$pag = 'vendas';
//VERIFICAR SE O CAIXA ESTÁ ABERTO
$query = $pdo->query("SELECT * from caixa where operador = '$id_usuario' and status = 'Aberto' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){ 
	$aberto = 'Sim';
	$caixa = $res[0]['caixa'];
	$id_abertura = $res[0]['id'];
	$valor_abertura = $res[0]['valor_ab'];

	//TOTALIZAR VENDA PARA DEFINIR QUEBRA
	$valor_vendido = 0;
	$query = $pdo->query("SELECT * from vendas where operador = '$id_usuario' and abertura = '$id_abertura' ");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){
		for($i=0; $i < $total_reg; $i++){
			foreach ($res[$i] as $key => $value){	}

				$valor_vendido += $res[$i]['total'];
		}
	}

	$valor_tot = $valor_abertura + $valor_vendido;


?>



<div class="mt-4" style="margin-right:25px">
	<?php 
	$query = $pdo->query("SELECT * from vendas where abertura = '$id_abertura' order by id desc");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){ 
		?>
		<small>
			<table id="example" class="table table-hover my-4" style="width:100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Status</th>
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
                        
                        $idvenda = $res[$i]['id'];
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
								
								<?php echo $idvenda ?></td>
								<td><i class="bi bi-square-fill <?php echo $classe ?>"></i> <?php echo $res[$i]['status'] ?></td>
								<td>R$ <?php echo $total ?></td>
								<td><?php echo $data2.' '.$res[$i]['hora'] ?></td>
								<td><?php echo $nome_operador ?></td>
								<td><?php echo $nome_pgto ?></td>


								<td>
									<a href="../painel-operador/comprovante_class.php?id=<?php echo $res[$i]['id'] ?>" title="Gerar Comprovante" target="_blank" style="text-decoration: none">
										<i class="bi bi-clipboard-check text-primary"></i>
									</a>

									<?php if($res[$i]['status'] == 'Concluída'){ ?>

									<a href="index.php?pagina=<?php echo $pag ?>&funcao=deletar&id=<?php echo $res[$i]['id'] ?>" title="Cancelar Venda">
										<i class="bi bi-archive text-danger mx-1"></i>
									</a>
								<?php } ?>
								</td>
							</tr>

						<?php } ?>

					</tbody>

				</table>
			</small>
		<?php }else{
			echo '<p>Neste caixa ainda não houve vendas para serem exibidas!!';
		} ?>
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
}else{
	$aberto = 'Não';
}
        
?>



<div class="modal fade" tabindex="-1" id="modalAbertura" data-bs-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Abrir Caixa</h5>
				
			</div>
			<form method="POST" id="form-abertura">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Caixa</label>
								
								<select class="form-select mt-1" aria-label="Default select example" name="caixa">
									<?php 
									$query = $pdo->query("SELECT * from caixas order by nome asc");
									$res = $query->fetchAll(PDO::FETCH_ASSOC);
									$total_reg = @count($res);
									if($total_reg > 0){ 

										for($i=0; $i < $total_reg; $i++){
											foreach ($res[$i] as $key => $value){	}
												?>

											<option value="<?php echo $res[$i]['id'] ?>"><?php echo $res[$i]['nome'] ?></option>

										<?php }

									}else{ 
										echo '<option value="">Cadastre um Caixa</option>';

									} ?>
									

								</select>

							</div> 
						</div>
						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Gerente</label>
								<select class="form-select mt-1" aria-label="Default select example" name="gerente">
									<?php 
									$query = $pdo->query("SELECT * from usuarios where nivel = 'Admin' order by nome asc");
									$res = $query->fetchAll(PDO::FETCH_ASSOC);
									$total_reg = @count($res);
									if($total_reg > 0){ 

										for($i=0; $i < $total_reg; $i++){
											foreach ($res[$i] as $key => $value){	}
												?>

											<option value="<?php echo $res[$i]['id'] ?>"><?php echo $res[$i]['nome'] ?></option>

										<?php }

									}else{ 
										echo '<option value="">Cadastre um Administrador</option>';

									} ?>


								</select>
							</div>  
						</div>
					</div>




					<div class="row">
						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Valor Abertura</label>
								<input type="text" class="form-control" id="valor_ab" name="valor_ab" placeholder="Valor da Abertura" required="" >
							</div> 
						</div>

						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Senha Gerente</label>
								<input type="password" class="form-control" id="senha_gerente" name="senha_gerente" placeholder="Senha Gerente" required="" >
							</div> 
						</div>
					</div>

					

					<small><div align="center" class="mt-1" id="mensagem-abertura">
						
					</div> </small>

				</div>
				<div class="modal-footer">
                    <a href="<?php echo $url_loja ?>/sistema/painel-admin" class="btn btn-warning">Painel ADM</a>
					
					<button name="btn-salvar-perfil" id="btn-salvar-abertura" type="submit" class="btn btn-primary">Abrir Caixa</button>

					<input name="id-abertura" type="hidden" value="<?php echo @$id_usu ?>">

					

				</div>
			</form>
		</div>
	</div>
</div>






<div class="modal fade" tabindex="-1" id="modalFechamento" data-bs-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Fechar Caixa</h5>

				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form method="POST" id="form-fechamento">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Caixa</label>
								<input type="text" class="form-control" id="caixa_fec" name="caixa_fec" value="<?php echo $caixa ?>" readonly required="" >
								

							</div> 
						</div>
						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Gerente</label>
								<select class="form-select mt-1" aria-label="Default select example" name="gerente_fec">
									<?php 
									$query = $pdo->query("SELECT * from usuarios where nivel = 'Admin' order by nome asc");
									$res = $query->fetchAll(PDO::FETCH_ASSOC);
									$total_reg = @count($res);
									if($total_reg > 0){ 

										for($i=0; $i < $total_reg; $i++){
											foreach ($res[$i] as $key => $value){	}
												?>

											<option value="<?php echo $res[$i]['id'] ?>"><?php echo $res[$i]['nome'] ?></option>

										<?php }

									}else{ 
										echo '<option value="">Cadastre um Administrador</option>';

									} ?>


								</select>
							</div>  
						</div>
					</div>




					<div class="row">
						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Valor Fechamento</label>
								<input type="text" class="form-control" id="valor_fec" name="valor_fec" placeholder="Total do Caixa" required="" value="<?php echo @$valor_tot ?>">
							</div> 
						</div>

						<div class="col-md-6">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Senha Gerente</label>
								<input type="password" class="form-control" id="senha_gerente_fec" name="senha_gerente_fec" placeholder="Senha Gerente" required="" >
							</div> 
						</div>
					</div>

					

					<small><div align="center" class="mt-1" id="mensagem-fechamento">
						
					</div> </small>

				</div>
				<div class="modal-footer">
                    <a href="<?php echo $url_loja ?>/sistema/painel-admin" class="btn btn-warning">Painel ADM</a>
                    
					<a href="pdv.php" class="btn btn-primary">Abrir PDV</a>
					
					<button name="btn-salvar-fechamento" id="btn-salvar-fechamento" type="submit" class="btn btn-danger">Fechar Caixa</button>

					<input name="id-fechamento" type="hidden" value="<?php echo @$id_usu ?>">

					

				</div>
			</form>
		</div>
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function() {
		var aberto = "<?=$aberto?>";
		if(aberto === 'Sim'){
			var myModal = new bootstrap.Modal(document.getElementById('modalFechamento'), {
				backdrop: 'static'
			});
		}else{
			var myModal = new bootstrap.Modal(document.getElementById('modalAbertura'), {
				backdrop: 'static'
			});
		}
		

		myModal.show();
	} );
</script>






<script type="text/javascript">
	$("#form-abertura").submit(function () {
		
		event.preventDefault();
		var formData = new FormData(this);

		$.ajax({
			url: "abertura.php",
			type: 'POST',
			data: formData,

			success: function (mensagem) {

				$('#mensagem-abertura').removeClass()

				if (mensagem.trim() == "Aberto com Sucesso!") {

                    //$('#nome').val('');
                    //$('#cpf').val('');
                    $('#btn-fechar-perfil').click();
                    window.location = "pdv.php";

                } else {

                	$('#mensagem-abertura').addClass('text-danger')
                }

                $('#mensagem-abertura').text(mensagem)

            },

            cache: false,
            contentType: false,
            processData: false,
            xhr: function () {  // Custom XMLHttpRequest
            	var myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) { // Avalia se tem suporte a propriedade upload
                	myXhr.upload.addEventListener('progress', function () {
                		/* faz alguma coisa durante o progresso do upload */
                	}, false);
                }
                return myXhr;
            }
        });
	});
</script>






<script type="text/javascript">
	$("#form-fechamento").submit(function () {
		
		event.preventDefault();
		var formData = new FormData(this);

		$.ajax({
			url: "fechamento.php",
			type: 'POST',
			data: formData,

			success: function (mensagem) {

				$('#mensagem-fechamento').removeClass()

				if (!isNaN(mensagem.trim())) {

        
                    window.location = "mapacaixa_class.php?id="+mensagem; 
                    document.getElementById("btn-salvar-fechamento").disabled = true;
                    $('#mensagem-fechamento').addClass('text-info');
                    $('#mensagem-fechamento').text("Aguarde...");
                  
 
                } else {
                    
                	$('#mensagem-fechamento').addClass('text-danger')
                    $('#mensagem-fechamento').text(mensagem);
                }
                
                

             

            },

            cache: false,
            contentType: false,
            processData: false,
            xhr: function () {  // Custom XMLHttpRequest
            	var myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) { // Avalia se tem suporte a propriedade upload
                	myXhr.upload.addEventListener('progress', function () {
                		/* faz alguma coisa durante o progresso do upload */
                	}, false);
                }
                return myXhr;
            }
        });
	});
</script>

