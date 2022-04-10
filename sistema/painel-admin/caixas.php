<?php 
$pag = 'caixas';
@session_start();

require_once("../../conexao.php"); 
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}
?>

<a href="index.php?pag=<?php echo $pag ?>&funcao=novo" type="button" class="btn btn-secondary mt-2">Novo Caixa</a>
<a href="index.php?pag=<?php echo $pag ?>&funcao=novo" type="button" class="btn btn-info mt-2">Abrir PDV</a><br><br>
<div class="row">
	<?php 
	$query = $pdo->query("SELECT * from caixas order by nome asc");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){ 

    for($i=0; $i < $total_reg; $i++){
    foreach ($res[$i] as $key => $value){	}

        ?>
    


    <div class=" col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100  py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><?php echo $res[$i]['nome'] ?></div>
                        <a href="index.php?pagina=<?php echo $pag ?>&funcao=editar&id=<?php echo $res[$i]['id'] ?>" title="Editar Registro"><i class="bi bi-pencil-square text-primary"></i></a>
                        <a href="index.php?pagina=<?php echo $pag ?>&funcao=deletar&id=<?php echo $res[$i]['id'] ?>" title="Excluir Registro"><i class='far fa-trash-alt text-danger'></i></a>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-cash-register fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>


      
    <?php } ?>


        
	<?php }else{
		echo '<p>Não existem caixas para serem exibidos!!';
	} ?>
</div>

<center><h4>Fechamentos de Caixas</h4></center><br>
	<?php 
	$query = $pdo->query("SELECT * from caixa order by id desc");
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
						<th>Status</th>
						<th>Data Abertura</th>
						<th>Vendido</th>
						<th>Quebra</th>
						<th>Caixa</th>
						<th>Operador</th>						
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>

					<?php 
					for($i=0; $i < $total_reg; $i++){
						foreach ($res[$i] as $key => $value){	}

							$id_operador = $res[$i]['operador'];
						$id_caixa = $res[$i]['caixa'];
						
						$data2 = implode('/', array_reverse(explode('-', $res[$i]['data_ab'])));

						$valor_quebra = number_format( $res[$i]['valor_quebra'] , 2, ',', '.');
						$total_vendido = number_format( $res[$i]['valor_vendido'] , 2, ',', '.');

						

						$res_2 = $pdo->query("SELECT * from usuarios where id = '$id_operador' ");
						$dados = $res_2->fetchAll(PDO::FETCH_ASSOC);
						$nome_operador = $dados[0]['nome'];


						$res_2 = $pdo->query("SELECT * from caixas where id = '$id_caixa' ");
						$dados = $res_2->fetchAll(PDO::FETCH_ASSOC);
						$nome_caixa = $dados[0]['nome'];


						if($res[$i]['status'] == 'Aberto'){
							$classe = 'text-success';
						}else{
							$classe = 'text-danger';
						}


						?>

						<tr>
                            <td><?php echo $res[$i]['id'] ?></td>
							     <td><i class="bi bi-square-fill <?php echo $classe ?>"></i>
								<?php echo $res[$i]['status'] ?></td>
								<td><?php echo $data2 ?></td>
								<td>R$ <?php echo $total_vendido ?></td>
								<td>R$ <?php echo $valor_quebra ?></td>
								<td><?php echo $nome_caixa ?></td>
								<td><?php echo $nome_operador ?></td>
								


								<td>
									<a href="../painel-operador/mapacaixa_class.php?id=<?php echo $res[$i]['id'] ?>" title="Fluxo de Caixa" target="_blank" style="text-decoration: none">
										<i class="fa fa-clipboard-check text-primary"></i>
									</a>

									
								
								</td>
							</tr>

						<?php } ?>

					</tbody>
 
				</table>
        </div>
		<?php }else{
			echo '<p>Não existem fechamentos de caixas para serem exibidos!!';
		} ?>
</div></div>


<?php 
if(@$_GET['funcao'] == "editar"){
	$titulo_modal = 'Editar Registro';
	$query = $pdo->query("SELECT * from caixas where id = '$_GET[id]'");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){ 
		$nome = $res[0]['nome'];
		

	}
}else{
	$titulo_modal = 'Inserir Registro';
}
?>


<div class="modal fade" tabindex="-1" id="modalCadastrar" data-bs-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?php echo $titulo_modal ?></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form method="POST" id="form">
				<div class="modal-body">

					
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">Nome</label>
						<input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" required="" value="<?php echo @$nome ?>">
					</div> 


					
										
					
				

				<small><div align="center" class="mt-1" id="mensagem">

				</div> </small>

			</div>
			<div class="modal-footer">
				<button type="button" id="btn-fechar" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
				<button name="btn-salvar" id="btn-salvar" type="submit" class="btn btn-primary">Salvar</button>

				<input name="id" type="hidden" value="<?php echo @$_GET['id'] ?>">

				<input name="antigo" type="hidden" value="<?php echo @$nome ?>">
				

			</div>
		</form>
	</div>
</div>
</div>






<div class="modal fade" tabindex="-1" id="modalDeletar" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Excluir Registro</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form method="POST" id="form-excluir">
				<div class="modal-body">

					<p>Deseja Realmente Excluir o Registro?</p>

					<small><div align="center" class="mt-1" id="mensagem-excluir">
						
					</div> </small>

				</div>
				<div class="modal-footer">
					<button type="button" id="btn-fechar" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
					<button name="btn-excluir" id="btn-excluir" type="submit" class="btn btn-danger">Excluir</button>

					<input name="id" type="hidden" value="<?php echo @$_GET['id'] ?>">

				</div>
			</form>
		</div>
	</div>
</div>



<?php 
if(@$_GET['funcao'] == "novo"){ ?>
	<script type="text/javascript">
		var myModal = new bootstrap.Modal(document.getElementById('modalCadastrar'), {
			backdrop: 'static'
		})

		myModal.show();
	</script>
<?php } ?>



<?php 
if(@$_GET['funcao'] == "editar"){ ?>
	<script type="text/javascript">
		var myModal = new bootstrap.Modal(document.getElementById('modalCadastrar'), {
			backdrop: 'static'
		})

		myModal.show();
	</script>
<?php } ?>



<?php 
if(@$_GET['funcao'] == "deletar"){ ?>
	<script type="text/javascript">
		var myModal = new bootstrap.Modal(document.getElementById('modalDeletar'), {
			
		})

		myModal.show();
	</script>
<?php } ?>




<!--AJAX PARA INSERÇÃO E EDIÇÃO DOS DADOS COM IMAGEM -->
<script type="text/javascript">
	$("#form").submit(function () {
		var pag = "<?=$pag?>";
		event.preventDefault();
		var formData = new FormData(this);

		$.ajax({
			url: pag + "/inserir.php",
			type: 'POST',
			data: formData,

			success: function (mensagem) {

				$('#mensagem').removeClass()

				if (mensagem.trim() == "Salvo com Sucesso!") {

                    //$('#nome').val('');
                    //$('#cpf').val('');
                    $('#btn-fechar').click();
                    window.location = "index.php?pagina="+pag;

                } else {

                	$('#mensagem').addClass('text-danger')
                }

                $('#mensagem').text(mensagem)

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
	$(document).ready(function() {
		$('#example').DataTable({
			"ordering": false
		});
	} );
</script>






<!--SCRIPT PARA CARREGAR IMAGEM -->
<script type="text/javascript">

    function carregarImg() {

        var target = document.getElementById('target');
        var file = document.querySelector("input[type=file]").files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            target.src = reader.result;
        };

        if (file) {
            reader.readAsDataURL(file);


        } else {
            target.src = "";
        }
    }

</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#dataTable').dataTable({
            "ordering": false
        })

    });
</script>