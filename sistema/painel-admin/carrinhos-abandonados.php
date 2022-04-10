<?php  
$pag = "carrinhos-abandonados";
require_once("../../conexao.php"); 
require_once("../../pagamentos/pagseguro/PagSeguro.class.php");
$PagSeguro = new PagSeguro();
@session_start();
$id_usuario = @$_SESSION['id_usuario'];
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}


?>
 

<center><h3>Carrinhos Abandonados</h3></center>
<!-- DataTales Example -->
<div class="card shadow mb-4">

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Itens Sacola</th>
                        <th>Cliente</th>
                        <th>WhatsApp</th>
                        <th>Link Sacola</th>
                        <th>Data</th>
                        <th>Ações</th>
                    </tr>
                </thead>

                <tbody>

                   <?php 

                   $query_car = $pdo->query("SELECT * FROM carrinho where id_venda = '0' group by id_usuario order by data desc ");
                   $res_car = $query_car->fetchAll(PDO::FETCH_ASSOC);

                   for ($i=0; $i < count($res_car); $i++) { 
                      foreach ($res_car[$i] as $key => $value) {
                      }
                       
                        $id_carrinho = $res_car[$i]['id'];
                        $id_usuario = $res_car[$i]['id_usuario'];
                        $id_produto = $res_car[$i]['id_produto'];
                        $quantidade = $res_car[$i]['quantidade'];
                        $id_venda = $res_car[$i]['id_venda'];
                        $data = $res_car[$i]['data'];


                        $data = implode('/', array_reverse(explode('-', $data)));
//                        $total = number_format($total, 2, ',', '.');

                        $query2 = $pdo->query("SELECT * FROM carrinho where id_venda = '0' and id_usuario = '$id_usuario' order by id desc ");
                        $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
                        $total_produtos = @count($res2);
            
                        $query_u = $pdo->query("SELECT * FROM usuarios where id = '$id_usuario' ");
                        $res_u = $query_u->fetchAll(PDO::FETCH_ASSOC);
                        $cpf_usu = $res_u[0]['cpf'];

                        $query = $pdo->query("SELECT * FROM clientes where cpf = '$cpf_usu' ");
                        $res = $query->fetchAll(PDO::FETCH_ASSOC);
                        $nome_usu2 = $res[0]['nome'];
                        $cpf_usu2 = $res[0]['cpf'];
                        $telefone_usu2 = "+55".$res[0]['telefone'];
                        $nomeCompleto = explode(' ', trim($nome_usu2));
                        $primeiroNome = $nomeCompleto[0];
                        
                        if($total_produtos == 1){
                            $total_produtos = $total_produtos." item";
                        }else{
                            $total_produtos = $total_produtos." itens";
                        }
                       
                        $linkSacola = $url_loja.'/sacola.php?cpf='.$cpf_usu2;
                       
                       
                        $linkWhatsapp = "https://api.whatsapp.com/send?phone=$telefone_usu2&text=Ol%C3%A1%20$primeiroNome%20tudo%20bem%3F%20notei%20que%20voc%C3%AA%20tem%20$total_produtos%20em%20sua%20sacola%2C%20ficou%20alguma%20duvida%20para%20finalizar%20sua%20compra%3F%20voc%C3%AA%20pode%20finalizar%20no%20link%20abaixo%20$linkSacola";
                        ?>


                    <tr>
                        <td>
                            <?php echo $total_produtos; ?><br>
                            <a class="linkvisitado"  target="_blank"  href="<?php echo $linkWhatsapp ?>">Recuperar</a>
                        </td>
                        <td>
                            <?php echo $nome_usu2 ?>
                        </td>
                        <td>
                            <?php echo $telefone_usu2 ?>
                        </td>
                        
                        <td>
                            <a class="linkvisitado"  target="_blank"  href="<?php echo $linkSacola ?>" class="linkvisitado"><?php echo $linkSacola ?></a>
                        </td>
                        <td>
                            <?php echo $data ?>
                        </td>
                        <td>
                            <a href="index.php?pag=<?php echo $pag ?>&funcao=excluir&id=<?php echo $id_carrinho ?>" class='text-danger mr-1' title='Excluir Registro'><i class='far fa-trash-alt'></i></a>
                        </td>
                    </tr>
<?php } ?>





                </tbody>
            </table>
        </div>
    </div>
</div>

 <!-- Area Chart Example-->
<?php
require_once 'server/Relatorios.php';
$relatorio = new Relatorios();
                          
                            
?>

<div class="card mb-3">
  <div class="card-header">

    Relatório de carrinhos abandonados este mês</div>
  <div class="card-body">
    <canvas id="grafico" width="100%" height="15px"></canvas>
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

<div class="modal" id="modal-cliente" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Dados do Cliente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <?php 
                 $id_ven = @$_GET['id'];
                  $query_v = $pdo->query("SELECT * FROM vendas where id = '$id_ven' ");
                   $res_v = $query_v->fetchAll(PDO::FETCH_ASSOC);
                   $id_usu = $res_v[0]['id_usuario'];

                   $query_u = $pdo->query("SELECT * FROM usuarios where id = '$id_usu' ");
                   $res_u = $query_u->fetchAll(PDO::FETCH_ASSOC);
                   $cpf_usu = $res_u[0]['cpf'];

                $query = $pdo->query("SELECT * FROM clientes where cpf = '$cpf_usu' ");
                 $res = $query->fetchAll(PDO::FETCH_ASSOC);
                
                  $nome = $res[0]['nome'];
                  $cpf = $res[0]['cpf'];
                  $telefone = $res[0]['telefone'];
                  $rua = $res[0]['rua'];
                  $numero = $res[0]['numero'];
                  $cep = $res[0]['cep'];
                  $bairro = $res[0]['bairro'];
                  $cidade = $res[0]['cidade'];
                  $estado = $res[0]['estado'];
                  $email_cli = $res[0]['email'];
                
                  

                 ?>

                
                <span><b>Nome: </b><?php echo $nome ?> </span><br>
                <span><b>CPF: </b> <?php echo $cpf ?></span><br>
                <span><b>Email:</b> <?php echo $email_cli ?></span><br>
                
                <span><b>Rua:</b> <?php echo $rua ?> </span><br>
                <span><b>Número: </b> <?php echo $numero ?></span><br>
                <span><b>Bairro: </b> <?php echo $bairro ?></span><br>
                <span><b>Cidade: </b> <?php echo $cidade ?></span><br>
                
                <span><b>Estado: </b> <?php echo $estado ?></span><br>
                <span><b>CEP: </b> <?php echo $cep ?></span><br>
                <span><b>Whatsapp: </b> <a href="https://api.whatsapp.com/send?phone=55<?php echo $telefone."&text=Oi%20$nome%20" ?>" target="_blank"><?php echo $telefone ?></a></span><br>
                
                

                

            </div>
            
        </div>
    </div>
</div>







<?php 



if (@$_GET["funcao"] != null && @$_GET["funcao"] == "excluir") {
    echo "<script>$('#modal-deletar').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "cliente") {
    echo "<script>$('#modal-cliente').modal('show');</script>";
}

?>





<!--AJAX PARA INSERÇÃO E EDIÇÃO DOS DADOS COM IMAGEM -->
<script type="text/javascript">
    $("#form").submit(function () {
        var pag = "<?=$pag?>";
        event.preventDefault();
        var formData = new FormData(this);

        $.ajax({
            url: "vendas/inserir.php",
            type: 'POST',
            data: formData,

            success: function (mensagem) {

                $('#mensagem').removeClass()

                if (mensagem.trim() == "Salvo com Sucesso!!") {
                    
                    //$('#nome').val('');
                    //$('#cpf').val('');
                    $('#btn-fechar').click();
                    window.location.reload();

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
                url: "vendas/excluir.php",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function (mensagem) {

                    if (mensagem.trim() === 'Excluído com Sucesso!!') {


                        $('#btn-cancelar-excluir').click();
                        window.location.reload();
                    }

                    $('#mensagem_excluir').text(mensagem)



                },

            })
        })
    })
</script>





<!--AJAX PARA EDITAR DADOS -->
<script type="text/javascript">
    $(document).ready(function () {
       var pag = "<?=$pag?>";
        $('#btn-editar').click(function (event) {

            event.preventDefault();

            $.ajax({
                url: "vendas/editar-status.php",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function (mensagem) {

                    if (mensagem.trim() === 'Editado com Sucesso!!') {


                        $('#btn-cancelar-editar').click();
                       window.location.reload();
                    }

                    $('#mensagem_editar').addClass('text-danger')
                    $('#mensagem_editar').text(mensagem)



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




<!-- Modal -->
<div class="modal fade" id="modalProdutos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" style="overflow-y: initial !important">
    <div class="modal-content mb-4">
      <div class="modal-header">


        <h5 class="cart-inline-title">Produtos do Pedido</h5>
        <input type="hidden" id="txtquantidade">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
        <div class="modal-body">

          <div id='listar-produtos'></div>;
        
          <small><div align="center" id="mensagem"></div></small>


         
        </div>


    </div>
  </div>
</div>





<!--AJAX PARA INSERÇÃO DOS DADOS VINDO DE UMA FUNÇÃO -->
<script>
function verProdutos(idvenda) {
  var pag = "<?=$pag?>";
  event.preventDefault();

  $.ajax({
      url: "vendas/listar-produtos.php",
      method: "post",
      data: {idvenda},
      dataType: "html",
      success: function(result){
        $("#modalProdutos").modal("show");  
        $('#listar-produtos').html(result)

      },
     })
}
</script>




<script type="text/javascript">
let json = <?php echo $relatorio->vendas_mensal("Não");?>;

    
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
              backgroundColor: "#FF0000",
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


