<div class="modal fade" id="modal-pgto" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">


                <?php 

                 $query = $pdo->query("SELECT * FROM vendas where id = '" . $id_venda . "' ");
                    $res = $query->fetchAll(PDO::FETCH_ASSOC);
                    $vlr_venda = $res[0]['total'];
                    $vlr_venda = number_format($vlr_venda, 2, ',', '.');

                 ?>
                
                           
                <h5 class="modal-title">Escolha um meio de pagamento abaixo <small> Total: R$ <?php echo $vlr_venda ?></small></h5>

                
            </div>
            <div class="modal-body">

               <div class="row">
                   
                      <div class="col-md-4 col-sm-12 mb-5">

                        <?php 
                          //botao do mercado pago
                        
                        $nome_produto = $nome_loja;
                        $btn = $pagar->PagarMP($id_venda, $nome_produto, (float)$vlr_venda, $url_loja);
                         echo $btn;
                         ?>

                          <span class="text-muted"><i><small><br>Cartão de Crédito ou Boleto <br>
                          Boleto pode levar até 24 Horas para ser aprovado.</small></i></span>
                       </div>
                   
                      <div class="col-md-4 col-sm-12 mb-5">

                          <a  onclick="SalvarMeioPagamento('pagseguro', <?php echo $id_venda ?>)" title="Pagar com o Pagseguro" href="pagamentos/pagseguro/checkout.php?codigo=<?php echo $id_venda; ?>"><img src="img/pagamentos/pagseguro.png" width="355"></a>
                          <span class="text-muted"><i><small><br>Cartão Crédito/Débito ou Boleto <br>
                          Boleto pode levar até 24 Horas para ser aprovado.</small></i></span>

                      </div>
                   

                      <div class="col-md-4 col-sm-12 mb-5">
                        <a onclick="SalvarMeioPagamento('paypal', <?php echo $id_venda ?>)" title="Pagar com Paypal" href="pagamentos/paypal/checkout.php?id=<?php echo $id_venda; ?>" ><img src="img/pagamentos/paypal.png" width="355"></a> 
                          <span class="text-muted"><i><small><br>Cartão de Crédito <br>
                          Aceita Pagamentos Estrangeiro.</small></i></span>
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