<?php 
$pag = "pagamento-online";
require_once("../../conexao.php"); 
@session_start();
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}


//VERIFICAR SE OS PAGAMNETOS ONLINES OBRIGATÓRIOS JÁ ESTÃO CADASTRADOS, CASO CONTRÁRIO CADASTRAR
 $query = $pdo->query("SELECT * FROM pagamento_online where nome = 'PagSeguro' ");
 $res = $query->fetchAll(PDO::FETCH_ASSOC);
 if(@count($res)==0){
    $pdo->query("INSERT INTO pagamento_online (nome) values ('PagSeguro') ");
 }

  $query = $pdo->query("SELECT * FROM pagamento_online where nome = 'MercadoPago' ");
 $res = $query->fetchAll(PDO::FETCH_ASSOC);
 if(@count($res)==0){
    $pdo->query("INSERT INTO pagamento_online (nome) values ('MercadoPago') ");
 }

 

?>



<center><h4>Pagamentos Online - Check-out transparente</h4></center>
<!-- DataTales Example -->
<div class="card shadow mb-4">

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Ativar</th>
                        <th>Nome</th>
                        <th>Token Sandbox</th>
                        <th>Token Oficial</th>
                        <th>E-mail</th>
                        <th>Ações</th>
                        
                    </tr>
                </thead>

                <tbody>

                   <?php 

                   $query = $pdo->query("SELECT * FROM pagamento_online ");
                   $res = $query->fetchAll(PDO::FETCH_ASSOC);

                   for ($i=0; $i < count($res); $i++) { 
                      foreach ($res[$i] as $key => $value) {
                      }

                      $nome = $res[$i]['nome'];
                      $id = $res[$i]['id'];
                      $ativo = $res[$i]['ativo'];
                      $token_sandbox = $res[$i]['token_sandbox'];
                      $token_oficial = $res[$i]['token_oficial'];
                      $email = $res[$i]['email'];

                       
                      ?>


                    <tr>
                        <td>

                            <?php if($ativo == "Sim"){

                                    echo "
                                    <a href='#' class='mr-1' title='Desativar Pagamento'>
                                    <i class='far fa-check-square  text-success'></i> </a>";
                                }else{
                                    echo "
                                      <a href='index.php?pag=$pag&funcao=ativar&id=$id' class='mr-1' title='Ativar Pagamento'>
                                    <i class='far fa-square text-danger'></i></a>";
                            } ?>
                        </td>
                        <td><?php echo $nome ?></td>
                        <td><?php echo $token_sandbox ?></td>
                        <td><?php echo $token_oficial ?></td>
                        <td><?php echo $email ?></td>
                        <td><a href="index.php?pag=<?php echo $pag ?>&funcao=editar&id=<?php echo $id ?>" class='text-primary mr-1' title='Editar Dados'><i class='far fa-edit'></i></a></td>
                    </tr>
<?php } ?>





                </tbody>
            </table>
        </div>
    </div>
</div>





<!-- Modal -->
<div class="modal fade" id="modalDados" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <?php 
                if (@$_GET['funcao'] == 'editar') {
                    $titulo = "Editar Registro";
                    $id2 = $_GET['id'];

                    $query = $pdo->query("SELECT * FROM pagamento_online where id = '" . $id2 . "' ");
                    $res = $query->fetchAll(PDO::FETCH_ASSOC);

                    $nome2 = $res[0]['nome'];
                    $email2 = $res[0]['email'];
                    $token_sandbox2 = $res[0]['token_sandbox'];    
                    $token_oficial2 = $res[0]['token_oficial'];                                        

                } else {
                    $titulo = "Inserir Registro";

                }


                ?>
                
                <h5 class="modal-title" id="exampleModalLabel"><?php echo $titulo ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="form" method="POST">
                <div class="modal-body">

                    <div class="form-group">
                        <label >Nome</label>
                        <input value="<?php echo @$nome2 ?>" type="text" class="form-control" id="nome-cat" name="nome-cat" placeholder="nome">
                    </div>
                    <div class="form-group">
                        <label >E-mail</label>
                        <input value="<?php echo @$email2 ?>" type="text" class="form-control" id="email" name="email" placeholder="email">
                    </div>
                    <div class="form-group">
                        <label >Token Sandbox</label>
                        <input value="<?php echo @$token_sandbox2 ?>" type="text" class="form-control" id="token_sandbox" name="token_sandbox" placeholder="token sandbox">
                    </div>
                    <div class="form-group">
                        <label >Token Oficial</label>
                        <input value="<?php echo @$token_oficial2 ?>" type="text" class="form-control" id="token_oficial" name="token_oficial" placeholder="token oficial">
                    </div>

                  
                   

                    <small>
                        <div id="mensagem">

                        </div>
                    </small> 

                </div>



                <div class="modal-footer">



                <input value="<?php echo @$_GET['id'] ?>" type="hidden" name="txtid2" id="txtid2">
                <input value="<?php echo @$nome2 ?>" type="hidden" name="antigo" id="antigo">

                    <button type="button" id="btn-fechar" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" name="btn-salvar" id="btn-salvar" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>






<div class="modal" id="modal-deletar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Excluir Registro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <p>Deseja realmente Excluir este Registro?</p>

                <div align="center" id="mensagem_excluir" class="">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancelar-excluir">Cancelar</button>
                <form method="post">

                    <input type="hidden" id="id"  name="id" value="<?php echo @$_GET['id'] ?>" required>

                    <button type="button" id="btn-deletar" name="btn-deletar" class="btn btn-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal" id="modal-ativar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ativar Pagamento Online</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <p>Deseja realmente ativar esta pagamento?</p>

                <div align="center" id="mensagem_ativar" class="">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancelar-ativar">Cancelar</button>
                <form method="post">

                    <input type="hidden" id="id"  name="id" value="<?php echo @$_GET['id'] ?>" required>

                    <button type="button" id="btn-ativar" name="btn-ativar" class="btn btn-danger">Ativar</button>
                </form>
            </div>
        </div>
    </div>
</div>





<div class="modal" id="modal-desativar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Desativar Pagamanto Online</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <p>Deseja realmente desativar esta pagamento?</p>

                <div align="center" id="mensagem_ativar" class="">

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancelar-desativar">Cancelar</button>
                <form method="post">

                    <input type="hidden" id="id"  name="id" value="<?php echo @$_GET['id'] ?>" required>

                    <button type="button" id="btn-desativar" name="btn-desativar" class="btn btn-danger">Desativar</button>
                </form>
            </div>
        </div>
    </div>
</div>




<?php 

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "novo") {
    echo "<script>$('#modalDados').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "editar") {
    echo "<script>$('#modalDados').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "excluir") {
    echo "<script>$('#modal-deletar').modal('show');</script>";
}
                    
if (@$_GET["funcao"] != null && @$_GET["funcao"] == "ativar") {
    echo "<script>$('#modal-ativar').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "desativar") {
    echo "<script>$('#modal-desativar').modal('show');</script>";
}                    

?>




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

                if (mensagem.trim() == "Salvo com Sucesso!!") {
                    
                    //$('#nome').val('');
                    //$('#cpf').val('');
                    $('#btn-fechar').click();
                    window.location = "index.php?pag="+pag;

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





<!--AJAX PARA EXCLUSÃO DOS DADOS -->
<script type="text/javascript">
    $(document).ready(function () {
        var pag = "<?=$pag?>";
        $('#btn-deletar').click(function (event) {
            event.preventDefault();

            $.ajax({
                url: pag + "/excluir.php",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function (mensagem) {

                    if (mensagem.trim() === 'Excluído com Sucesso!!') {


                        $('#btn-cancelar-excluir').click();
                        window.location = "index.php?pag=" + pag;
                    }

                    $('#mensagem_excluir').text(mensagem)



                },

            })
        })
    })
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



<!--AJAX PARA ATIVAR ENVIO -->
<script type="text/javascript">
    $(document).ready(function () {
        var pag = "<?=$pag?>";
        $('#btn-ativar').click(function (event) {
            event.preventDefault();

            $.ajax({
                url: pag + "/ativar.php",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function (mensagem) {

                    if (mensagem.trim() === 'Ativado com Sucesso!!') {


                        $('#btn-cancelar-ativar').click();
                        window.location = "index.php?pag=" + pag;
                    }

                    $('#mensagem_ativar').addClass('text-danger')
                    $('#mensagem_ativar').text(mensagem)



                },

            })
        })
    })
</script>




<!--AJAX PARA DESATIVAR ENVIO -->
<script type="text/javascript">
    $(document).ready(function () {
        var pag = "<?=$pag?>";
        $('#btn-desativar').click(function (event) {
            event.preventDefault();

            $.ajax({
                url: pag + "/desativar.php",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function (mensagem) {

                    if (mensagem.trim() === 'Desativado com sucesso, ative outro pagamento!!') {

                       
                        $('#btn-cancelar-desativar').click();
                        window.location = "index.php?pag=" + pag;
                    }

                    $('#mensagem_desativar').text(mensagem)



                },

            })
        })
    })
</script>





<script type="text/javascript">
    $(document).ready(function () {
        $('#dataTable').dataTable({
            "ordering": false
        })

    });
</script>



