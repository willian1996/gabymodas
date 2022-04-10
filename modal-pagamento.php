<div class="modal fade" id="modal-pgto" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">

 
                <?php 

                 $query = $pdo->query("SELECT * FROM vendas where id = '" . $id_venda . "' ");
                    $res = $query->fetchAll(PDO::FETCH_ASSOC);
                    $vlr_venda = $res[0]['total'];
                    $vlr_venda = number_format($vlr_venda, 2, ',', '.');

                 ?>
                
                           
                <h4  class="modal-title">Compra Finalizada R$ <?php echo $vlr_venda ?></h4>
                

<!--
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
-->
            </div>
            <div class="modal-body ">
                <h6>Escolha a forma de pagamento:</h6>
                <br><br>
               <div class="row">
                        <div class="col-md-1">
                        </div>
                      <div class="col-md-10 col-sm-12 mb-1">

                          <a title="Pagar com o Pagseguro" target="_blank" href="pagamentos/pagseguro/checkout.php?codigo=<?php echo $id_venda; ?>"><img src="img/pagamentos/pagseguro.png" width="400"></a>
<!--
                          <span class="text-muted"><i><small><br>Cartão Crédito, Débito ou Boleto </small></i></span>
                          <br><br><br>
-->
                      </div>

                        <div class="col-md-1">
                        </div>
                     

<!--                      <div class="col-md-6 col-sm-12 mb-1">-->

                        <?php 
                          //botao do mercado pago
                        
//                        $nome_produto = $nome_loja;
//                        $btn = $pagar->PagarMP($id_venda, $nome_produto, (float)$vlr_venda, $url_loja);
//                         echo $btn;
                         ?>

<!--
                          <span class="text-muted"><i><small><br>Cartão de Crédito ou Boleto </small></i></span>
                       </div>
-->

                     </div>


                      <div class="row mt-4">
                       <div class="col-md-12">
                        
                     

                      

                        <small> Se já efetuou o pagamento <a title="Ir para o Painel" href="painel-cliente/index.php?pag=pedidos" class="text-success" target="_blank">Clique aqui</a> </small>

                       </div>
                     </div>


            </div>
           
        </div>
    </div>
</div>



<?php 

if (@$_GET["id_venda"] != null) {
    
    echo "<script>$('#modal-pgto').modal('show');</script>";
}

 ?>