<?php  
$pag = "pedido";
require_once("../../conexao.php"); 
require_once("../../pagamentos/pagseguro/PagSeguro.class.php");
$PagSeguro = new PagSeguro();
@session_start();
$id_usuario = @$_SESSION['id_usuario'];
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";

}

$id_venda = $_GET['id'];

 

$query_v = $pdo->query("SELECT * FROM vendas where id = '$id_venda' ");
$res_v = $query_v->fetchAll(PDO::FETCH_ASSOC);
$id_usu = $res_v[0]['id_usuario'];
$data = implode('/', array_reverse(explode('-', $res_v[0]['data'])));

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
$complemento = $res[0]['complemento'];
$status = $res_v[0]['status'];
$pago = $res_v[0]['pago'];


?>

<!-- DataTales Example -->
<div class="row">
    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card shadow mb-4">
            <div class="card-header">
                <h5><b>Pedido: <?php echo $id_venda." Data: ".$data ?></b></h5>
            </div>
            <div class="card-body">
                <span><b>Nome: </b><?php echo $nome ?> </span><br>
                <span><b>CPF: </b> <?php echo $cpf ?></span><br>
                <span><b>Whatsapp: </b> <a href="https://api.whatsapp.com/send?phone=55<?php echo $telefone."&text=Oi%20$nome%20" ?>" target="_blank"><?php echo $telefone ?></a></span><br>
                <span><b>Endereço:</b> <?php echo $rua ?> </span><br>
                <span><b>Número: </b> <?php echo $numero ?></span><br>
                <span><b>Bairro: </b> <?php echo $bairro ?></span><br>
                <span><b>Cidade: </b> <?php echo $cidade."-".$estado ?></span><br>
                <span><b>CEP: </b> <?php echo $cep ?></span><br>
                <span><b>Ponto de referência: </b> <?php echo $complemento; ?></span><br><br>

                <?php

                //PEGANDO OS ITENS DO CARRINHO 
                $res = $pdo->query("SELECT * from carrinho where id_venda = '$id_venda' ");
                $dados = $res->fetchAll(PDO::FETCH_ASSOC);

                for ($i=0; $i < count($dados); $i++) { 
                    foreach ($dados[$i] as $key => $value) {
                    }

                    $id_produto = $dados[$i]['id_produto'];
                    $id_carrinho = $dados[$i]['id'];	
                    $combo = $dados[$i]['combo'];
                    $quantidade = $dados[0]['quantidade'];

                    if($combo != 'Sim'){
                        $res2 = $pdo->query("SELECT * from produtos where id = '$id_produto' ");
                        $dados2 = $res2->fetchAll(PDO::FETCH_ASSOC);
                        $promocao = $dados2[0]['promocao'];
                    }else{
                        $res2 = $pdo->query("SELECT * from combos where id = '$id_produto' ");
                    }
 
                    if($promocao == 'Sim'){
                        $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id_produto' ");
                        $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
                        $valor = $resp[0]['valor'];
                    }else{
                        $valor = $dados2[0]['valor'];
                    }


                    $nome_produto = $dados2[0]['nome'];

                    $sub_total_item = $quantidade * $valor;
                    $imagem = $dados2[0]['imagem'];
                    $codigo = $dados2[0]['descricao_longa'];

                    $sub_total = number_format( $sub_total_item , 2, ',', '.');
                    $valor = number_format( $valor , 2, ',', '.');

                    echo '<td><img src="../../img/produtos/'. $imagem .'" width="50"> </td>';

                    echo '<span><b>'.$nome_produto.'</b></span><br>';



                    $query_c = $pdo->query("SELECT * from carac_prod where id_prod = '$id_produto'");
                    $res_c = $query_c->fetchAll(PDO::FETCH_ASSOC);
                    $total_prod_carac = @count($res_c);


                    if($total_prod_carac > 0){
                        $query4 = $pdo->query("SELECT * from carac_itens_car where id_carrinho = '$id_carrinho'");
                        $res4 = $query4->fetchAll(PDO::FETCH_ASSOC);

                        for ($i2=0; $i2 < count($res4); $i2++) { 
                            foreach ($res4[$i2] as $key => $value) {
                            }

                            $nome_item_carac = $res4[$i2]['nome'];
                            $id_carac = $res4[$i2]['id_carac'];

                            $query1 = $pdo->query("SELECT * from carac where id = '$id_carac' ");
                            $res1 = $query1->fetchAll(PDO::FETCH_ASSOC);
                            $nome_carac = $res1[0]['nome'];

                            echo '<u><i><small><span class="mr-2 ml-2"><i class="mr-1 fa fa-check text-info"></i>'.$nome_carac.' : '.$nome_item_carac.'</span></small></i></u><br>';

                        }
                    } 

                    echo '<span><b>Valor </b>R$'.$sub_total_item.'</span><br><br>';

                }

                ?>

            </div>
            <div class="card-footer">
            <?php
            echo '<span><b>Subtotal</b> - R$ '.$res_v[0]['sub_total'].'<span><br>';
            echo '<span><b>Taxa cartão</b> - R$ '.$res_v[0]['taxas'].'<span><br>';
            echo '<span><b>Pgto </b> - '.$res_v[0]['meio_pagamento'].'<span><br>';
            echo '<span><b>Frete</b> - A combinar<span><br><br>';
            echo '<h6><b>Total - R$ '.$res_v[0]['total'].'</b></h6>';
            ?>
            </div>
        </div>


    </div>
    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card shadow mb-4">
            <div class="card-header">
                <h5><b>Ações</b></h5>
            </div>
            <div class="card-body">
                
                <span class='text-secondary mr-1'><i class="fas fa-print"></i>
                <a href="vendas/pedidoimpresso_class.php?id=<?php echo $id_venda ?>" target="_blank"  class='text-secondary mr-1' >Imprimir pedido</a>
                </span><br><br>
                
                <span class='text-secondary mr-1'><i class="fas fa-print"></i>
                <a href="vendas/declaracao_conteudo.php?id=<?php echo $id_venda ?>" target="_blank"  class='text-secondary mr-1' >Declaração de Conteúdo</a>
                </span><br><br>
                
                <span class='text-dark mr-1'><i class="fab fa-whatsapp"></i>
                <a href="https://api.whatsapp.com/send?phone=55<?php echo $telefone."&text=Oi%20$nome%20" ?>" target="_blank" class='text-dark mr-1' >WhatsApp</a>
                </span><br><br>
                
                <span class='text-warning mr-1'><i class="fas fa-fw fa-comment"></i>
                <?php 
                $query2 = $pdo->query("SELECT * FROM mensagem where id_venda = '$id_venda' order by id desc limit 1");
                $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
                $usuario_ultimo = @$res2[0]['usuario'];
                $total_msg = @count($res2);
                  ?>
                 <a href="index.php?pag=<?php echo $pag ?>&funcao=mensagem&id=<?php echo $id_venda ?>" class='text-warning mr-1'>Mensagens</a>
                </span><br><br>
                
                <span class='text-primary mr-1'><i class="fas fa-fw fa-shopping-cart"></i> 
                <a href="index.php?pag=<?php echo $pag ?>&funcao=editar&id=<?php echo $id_venda ?>" class='text-primary mr-1' title='Editar Status'><?php  echo $status; ?> </a>
                </span><br><br>
                
                 <?php if($pago != 'Sim'){  ?>
                <span class='text-danger mr-1' ><i class='far fa-fw fa-trash-alt'></i>
                <a href="index.php?pag=<?php echo $pag ?>&funcao=excluir&id=<?php echo $id_venda ?>" class='text-danger mr-1' >Excluir pedido</a>
                </span><br><br>
                 <?php } ?>
                
                <span class='text-success mr-1'><i class="fas fa-money-bill-alt"></i>
                <a href="index.php?pag=<?php echo $pag ?>&funcao=aprovar&id=<?php echo $id_venda ?>" class='text-success mr-1' >Pagamento</a>
                </span><br><br>
                
                <span class='text-info mr-1'><i class="fas fa-university"></i>
                <a href="index.php?pag=<?php echo $pag ?>&funcao=cliente&id=<?php echo $id_venda ?>" class='text-info mr-1'>Conciliação Bancária</a>
                </span><br><br>
                
                
            </div>
            <div class="card-footer">

            </div>
        </div>
    </div>
</div>

                         






<div class="modal" id="modalMensagem" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Mensagens do Pedido</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

            <div class="row">
                <div class="col-md-6 mb-2">
                    <form method="post">
                     <div class="form-group">
                            <label >Nova Mensagem</label>
                            <textarea maxlength="1000" class="form-control" id="titulo-mensagem" name="titulo-mensagem"></textarea>
                        </div>
                         

                   
                    <button type="submit" id="btn-mensagem" name="btn-mensagem" class="btn btn-info mt-2">Enviar</button>
                </form>
                </div>
                 <div class="col-md-6 mb-2">
               
                     <?php 
                $id_ven = $_GET['id'];
                $query2 = $pdo->query("SELECT * FROM mensagem where id_venda = '$id_ven' order by id desc");
                $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
                 for ($i=0; $i < count($res2); $i++) { 
                      foreach ($res2[$i] as $key => $value) {
                      }

                      $usuario = $res2[$i]['usuario'];
                      $texto = $res2[$i]['texto'];
                      $data = $res2[$i]['data'];
                      $hora = $res2[$i]['hora'];
                       $data = implode('/', array_reverse(explode('-', $data)));

                      if($usuario == 'Admin'){
                        echo '<p><small><i><u> Administrador:</u></i> - <small>'.$data.' - '.$hora.'</small><br>' .$texto.' </p></small> ';
                      }else{
                        echo '<p><small><i><u> Cliente: </u></i>- <small>'.$data.' - '.$hora.'</small><br>' .$texto.' </p></small> ';
                      }

                    }


               ?>

                </div>
            </div>
             
            </div>
           
        </div>
    </div>
</div>






<div class="modal" id="modal-deletar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Excluir Pedido</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <span>Deseja realmente excluir este pedido?</span><br>
                <small>Esta ação não pode ser desfeita</small>
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







<div class="modal" id="modal-aprovar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Lançar Pagamento</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> 
        <form method="post" id="form-aprovar-pgto">
            <div class="modal-body">

          <div class="mb-3">
              <p class="background mt-3">FORMA DE PAGAMENTO</p>
            <select class="form-select mt-1" aria-label="Default select example" name="formapgto" id="formapgto" required>
                <option value="">Selecione</option>
              <?php 
              $query = $pdo->query("SELECT * from forma_pgtos order by id asc");
              $res = $query->fetchAll(PDO::FETCH_ASSOC);
              $total_reg = @count($res);
              if($total_reg > 0){ 

                for($i=0; $i < $total_reg; $i++){
                  foreach ($res[$i] as $key => $value){ }
                    ?>

                  <option value="<?php echo $res[$i]['codigo'] ?>"><?php echo $res[$i]['nome'] ?></option>

                <?php }

              }else{ 
                echo '<option value="">Cadastre uma Forma de Pagamento</option>';

              } ?>

 
            </select>
                           
              

          </div>  


          
          <small><div align="center" class="mt-1" id="mensagem-aprovar-pagamento">

          </div> </small>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancelar-aprovar">Cancelar</button>
            <input type="hidden" id="id"  name="id" value="<?php echo @$_GET['id'] ?>" required>
            <button type="submit" id="btn-aprovar" name="btn-aprovar" class="btn btn-success">Aprovar</button>
        </div>
            </form>
        </div>
    </div>
</div>





<!-- Modal -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <?php 
                
                    $id2 = $_GET['id'];

                    $query = $pdo->query("SELECT * FROM vendas where id = '" . $id2 . "' ");
                    $res = $query->fetchAll(PDO::FETCH_ASSOC);

                    $rastreio = $res[0]['rastreio'];
                    $status = $res[0]['status'];
                                                            


                ?>
                
                <h5 class="modal-title" id="exampleModalLabel">Editar Status do Pedido <?php echo @$_GET['id'] ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="form" method="POST">
                <div class="modal-body">


            <div class="form-group">
                <label >Status</label>
                <select class="form-control form-control-sm" name="rastreio" id="rastreio">
                    <option value="Comprado" <?php if(@$status == 'Comprado'){ ?> selected <?php } ?>>Comprado</option>
                    <option value="Encomendado" <?php if(@$status == 'Encomendado'){ ?> selected <?php } ?>>Encomendado</option>
                </select>
            </div>
<!--
                    <div class="form-group">
                        <label >Rastreio</label>
                        <input value="Encomendado" type="text" class="form-control" id="rastreio" name="rastreio">
                    </div>
-->
                    <small>
                        <div id="mensagem_editar">
                        </div>
                    </small> 
                </div>
                <div class="modal-footer">
                <input value="<?php echo @$_GET['id'] ?>" type="hidden" name="txtid2" id="txtid2">
                    <button type="button" id="btn-cancelar-editar" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" name="btn-editar" id="btn-editar" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>







<div class="modal" id="modal-cliente" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">DETALHES DA TRANSAÇÃO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form" method="POST">
                <div class="modal-body">
                    
<?php 
$id_ven = @$_GET['id'];
$query_v = $pdo->query("SELECT * FROM vendas where id = '$id_ven' ");
$res_v = $query_v->fetchAll(PDO::FETCH_ASSOC);
$total = $res_v[0]['total'];
$taxas = $res_v[0]['taxas'];
$total_liquido = $res_v[0]['total_liquido'];
$meio_pagamento = $res_v[0]['meio_pagamento'];
$data_liberacao = $res_v[0]['data_liberacao'];
$frete = $res_v[0]['frete'];

?>

<div class="row">
    <div class="col-md-4">
       <div class="form-group">
            <label >Valor</label>
            <input value="<?php echo @$total ?>" type="text" class="form-control" id="$total" name="$total" placeholder="" disabled>
        </div>
    </div>
    <div class="col-md-4">                
        <div class="form-group">
            <label >Taxas</label>
            <input value="<?php echo @$taxas ?>" type="text" class="form-control" id="taxas" name="taxas" placeholder="">
        </div>
    </div>
    <div class="col-md-4">                
        <div class="form-group">
            <label >Total (líquido) </label>
            <input value="<?php echo @$total_liquido ?>" type="text" class="form-control" id="total_liquido" name="total_liquido" placeholder="">
        </div>
    </div>
</div>
                    
<div class="row">
    <div class="col-md-6">
       <div class="form-group">
            <label >Meio de pagamento</label>
            <input value="<?php echo @$meio_pagamento ?>" type="text" class="form-control" id="meio_pagamento" name="meio_pagamento" placeholder="">
        </div>
    </div>
    <div class="col-md-6">                
        <div class="form-group">
            <label >Liberação do pagamento</label>
            <input value="<?php echo @$data_liberacao ?>" type="date" class="form-control" id="data_liberacao" name="data_liberacao" placeholder="">
        </div>
    </div>
</div>
<div class="row">

    <div class="col-md-12">   
        <p>Complete os dados acima para gerar relatórios financeiros</p> 
        
    </div>
</div>
    
                    

                  
                   

                    <small>
                        <div id="mensagem_editar_detalhes">

                        </div>
                    </small> 

                </div>



                <div class="modal-footer">



                <input value="<?php echo @$_GET['id'] ?>" type="hidden" name="txtid3" id="txtid3">
               

                    <button type="button" id="btn-cancelar-editar" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" name="btn-editar-detalhes" id="btn-editar-detalhes" class="btn btn-primary">Salvar</button>
                </div>
            </form>

              
                
                

                

            </div>
            
        </div>
    </div>
</div>

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





<?php 



if (@$_GET["funcao"] != null && @$_GET["funcao"] == "mensagem") {
    echo "<script>$('#modalMensagem').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "excluir") {
    echo "<script>$('#modal-deletar').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "editar") {
    echo "<script>$('#modalEditar').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "aprovar") {
    echo "<script>$('#modal-aprovar').modal('show');</script>";
}

if (@$_GET["funcao"] != null && @$_GET["funcao"] == "cliente") {
    echo "<script>$('#modal-cliente').modal('show');</script>";
}
//MANTER NA MESMA PAGINA APOS CARREGAR A FUNÇÃO
$pag = $pag . "&id=". $id_produto;
?>



<?php 
if(isset($_POST["btn-mensagem"])){
$id_venda = $_GET['id'];
$texto = $_POST['titulo-mensagem'];
$res = $pdo->prepare("INSERT mensagem SET id_venda = :id_venda, texto = :texto, usuario = :usuario, data = curDate(), hora = curTime()");
        $res->bindValue(":id_venda", $id_venda);
        $res->bindValue(":texto", $texto);
        $res->bindValue(":usuario", 'Admin');
        $res->execute();

echo "<script language='javascript'> window.location='index.php?pag=pedido&funcao=mensagem&id=$id_venda' </script>";


} ?>



<?php 
//if(isset($_POST["btn-aprovar"])){
//$id_venda = $_GET['id'];
//$id_forma_pagamento = $_GET['formapgto'];
//
//require('../../aprovar_compra.php');
//
//echo "<script language='javascript'> location.reload()' </script>";
//
//
//}
?>








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
                        window.location = "index.php?pag="+pag;
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
                        window.location = "index.php?pag="+pag;
                    }

                    $('#mensagem_editar').addClass('text-danger')
                    $('#mensagem_editar').text(mensagem)



                },

            })
        })
    })
</script>


<!--AJAX PARA APROVAR PAGAMENTO -->
<script type="text/javascript">
    $(document).ready(function () {
       var pag = "<?=$pag?>";
        $('#btn-aprovar').click(function (event) {

            event.preventDefault();
            document.getElementById("btn-aprovar").disabled = true;
            $('#mensagem-aprovar-pagamento').addClass('text-info');
            $('#mensagem-aprovar-pagamento').text("Aguarde...");
            

            $.ajax({
                url: "vendas/aprovar_pgto.php",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function (mensagem) {

                    if (mensagem.trim() === 'Aprovado com Sucesso!!') {
//                        $('#btn-cancelar-editar').click();
//                        window.location = "index.php?pag="+pag;
                        $('#mensagem-aprovar-pagamento').removeClass('text-info');
                        $('#mensagem-aprovar-pagamento').addClass('text-success')
                        $('#mensagem-aprovar-pagamento').text(mensagem)
                    }else{
                        $('#mensagem-aprovar-pagamento').addClass('text-danger')
                        $('#mensagem-aprovar-pagamento').text(mensagem)
                        
                    }

                },

            })
        })
    })
</script>

















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


