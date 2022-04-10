<?php

require_once("cabecalho.php");
require_once("cabecalho-busca.php");



?>
 
<section class="hero hero-mobile">
  <div class="container">
    <div class="row">
<!--
      <div class="col-lg-3">
        <div class="hero__categories">
          <div class="hero__categories__all">
            <i class="fa fa-bars"></i>
            <span>Categorias</span>
          </div>
          <ul>
            <?php 
            $query = $pdo->query("SELECT * FROM categorias order by nome asc ");
            $res = $query->fetchAll(PDO::FETCH_ASSOC);

            for ($i=0; $i < count($res); $i++) { 
              foreach ($res[$i] as $key => $value) {
              }

              $nome = $res[$i]['nome'];

              $nome_url = $res[$i]['nome_url'];

              ?>
              <li><a href="sub-categoria-de-<?php echo $nome_url ?>"><?php echo $nome ?></a></li>

            <?php } ?>

          </ul>
        </div>
      </div> 
-->
<!-- Shoping Cart Section Begin -->

<section class="shoping-cart spad col-lg-9">
<!--    <div class="container">-->
        <div class="row">
            <input type="hidden" id="txtquantidade">
            <div class="col-lg-12">
                <div id='listar-carrinho'></div>
                
            </div>
            
        </div>

          <div class="total-cost">
            <small><div  id="mensagem-carrinho"></div></small>
            <h5>Total: R$<span id="valor_total" class="ml-1"> </span></h5>
        </div> 
      



       

<!--    </div>-->
</section>
        
<!-- Shoping Cart Section End -->
    <div class="col-lg-4 card-right">
        <a href="lista-produtos.php" type="button" id="btn-comprar" class="site-btn sb-dark">Comprar mais</a>
        <a href="" onclick="finalizarPedido()" type="submit" name="btn-finalizar" id="btn-finalizar" class="site-btn">Finalizar compra</a>
        
     </div>
      </div>


    </div>
</section>


<div class="modal" id="modal-faca-login" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Localizar Cadastro</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="get">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">CPF</label>
                                <input type="text" class="form-control" id="login" name="cpf" placeholder="Digite seu CPF para colocar na sacola">
                            </div>
                        </div>
                    </div>
                    <small><div id="div-mensagem"></div></small>
                    <div class="modal-footer">
                        <button type="button" id="btn-fechar-login" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" id="btn-login" class="btn btn-info">Entrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





<?php
require_once("rodape.php");

if(isset($_GET['cpf']) and validaCPF(@$_GET['cpf'])){
    $cpf_login = $_GET['cpf'];

}

if(!isset($_GET['cpf'])){
    $cpf = 0;
    @session_start();
    @session_destroy();
    echo "<script language='javascript'> $('#modal-faca-login').modal('show'); </script>";
    
}
?>

    






<script type="text/javascript">
   $(document).ready(function(event){
        
        $.ajax({
            url:"sistema/autenticar-ajax.php",
            method:"post",
            data: {cpf_login : <?php echo $cpf_login; ?>},
            dataType: "text",
            success: function(msg){
                if(msg.trim() === "Logado com sucesso!"){
                   
                }else if(msg.trim() === "CPF não cadastrado!"){
                    window.location='index.php';
                    
                }else{
                    alert(msg.trim());
                   

                 }
            }
        })
  
        })
    
</script>


<!--SCRIPT PARA ALTERAR O INPUT NUMBER -->
<script type="text/javascript">
  jQuery('<span class="dec qtybtn">-</span>').insertBefore('.pro-qty input'); 
  jQuery('<span class="inc qtybtn">+</span>').insertAfter('.pro-qty input'); 
  jQuery('.pro-qty').each(function() {
    var spinner = jQuery(this),
    input = spinner.find('input[type="text"]'),
    btnUp = spinner.find('.inc'),
    btnDown = spinner.find('.dec'),
    min = input.attr('min'),
    max = input.attr('max');

    btnUp.click(function() {
      var oldValue = parseFloat(input.val());
      if (oldValue >= max) {
        var newVal = oldValue;
    } else {
        var newVal = oldValue + 1;
    }
    spinner.find("input").val(newVal);
    document.getElementById('txtquantidade').value = newVal;
    spinner.find("input").trigger("change");


});

    btnDown.click(function() {

      var oldValue = parseFloat(input.val());
      if (oldValue <= min) {
        var newVal = oldValue;
    } else {
        var newVal = oldValue - 1;
    }
    spinner.find("input").val(newVal);
    document.getElementById('txtquantidade').value = newVal;
    spinner.find("input").trigger("change");



});




});
</script>








<!--AJAX PARA LISTAR OS DADOS -->
<script type="text/javascript">
  $( document ).ready(function() {

    atualizarCarrinho();


    
})
</script>




<script>
    function atualizarCarrinho() {
        $.ajax({
          url:  "carrinho/listar-carrinho.php",
          method: "post",
          data: $('#frm').serialize(),
          dataType: "html",
          success: function(result){
            $('#listar-carrinho').html(result)

        },
    })
    }
</script>



<script>
    function deletarCarrinho(id) {

     event.preventDefault();

     $.ajax({

        url: "carrinho/excluir-carrinho.php",
        method: "post",
        data: {id},
        dataType: "text",
        success: function(mensagem){

            $('#mensagem').removeClass()

            if(mensagem == 'Excluido com Sucesso!!'){
                atualizarCarrinho();
                       //$("#modal-carrinho").modal("show");

                   }else{


                   }

                   $('#mensagem').text(mensagem)

               },

           })

 }
</script>



<script type="text/javascript">
 function editarCarrinho(id) {
    console.log(id)
    var quantidade = document.getElementById('txtquantidade').value;
    event.preventDefault();

    $.ajax({

        url: "carrinho/editar-carrinho.php",
        method: "post",
        data: {id, quantidade},
        dataType: "text",
        success: function(mensagem){

            $('#mensagem').removeClass()

            if(mensagem == 'Editado com Sucesso!!'){
                atualizarCarrinho();
                       //$("#modal-carrinho").modal("show");

                   }else{


                   }

                   $('#mensagem').text(mensagem)

               },

           })


}
</script>






<script type="text/javascript">
 function addCarac(id, id_carrinho) {

    event.preventDefault();

    $.ajax({

        url: "carrinho/carac-produtos.php",
        method: "post",
        data: {id, id_carrinho},
        dataType: "text",
        success: function(mensagem){

            $('#mensagem-caract').removeClass()
            $("#modal-caract").modal("show");
            $('#listar-caract').html(mensagem)



        },

    })


}
</script>





<script type="text/javascript">
   function finalizarPedido() {
             
        event.preventDefault();
            
            $.ajax({

                url: "carrinho/verificar-carac.php",
                method: "post",
                data: {},
                dataType: "text",
                success: function(mensagem){

                  if(mensagem.trim() === 'Selecione as Características dos Produtos!'){
                    $('#mensagem-carrinho').addClass('text-danger');
                    $('#mensagem-carrinho').text(mensagem);
                  }else{
                    window.location="checkout.php";
                    //$('#mensagem').text(mensagem);
                  }

                                                         
                    

                },
                
            })

        
      }
</script>



