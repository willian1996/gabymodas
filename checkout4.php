<?php
require_once("cabecalho.php");
require_once("conexao.php");
 
  
?>  

<?php
//require_once("cabecalho-busca.php");
@session_start();

if(@$_SESSION['id_usuario'] == null){
    echo "<script language='javascript'> window.location='sistema' </script>";
 
}

$id_venda = @$_GET['id_venda'];
$id_usuario = @$_SESSION['id_usuario'];
$nome_usuario = @$_SESSION['nome_usuario'];
//$cpf_usuario = @$_SESSION['cpf_usuario'];
$email_usuario = @$_SESSION['email_usuario'];
$total = 0;
$total_custo = 0;
$frete_correios;


$res = $pdo->query("SELECT * from usuarios where id = '$id_usuario'");
$dados = $res->fetchAll(PDO::FETCH_ASSOC);
$cpf_usuario = $dados[0]['cpf'];


$res = $pdo->query("SELECT * from clientes where cpf = '$cpf_usuario'");
$dados = $res->fetchAll(PDO::FETCH_ASSOC);
$telefone = $dados[0]['telefone'];
$rua = $dados[0]['rua'];
$numero = $dados[0]['numero']; 
$bairro = $dados[0]['bairro'];
$complemento = $dados[0]['complemento'];
$cep = $dados[0]['cep'];
$cidade = $dados[0]['cidade'];
$estado = $dados[0]['estado'];

?>

<!-- checkout section  -->
<section class="checkout-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 order-2 order-lg-1">
                <form class="checkout-form" method="post" id="form-dados">
                    <div class="cf-title">Confirme Dados de Entrega</div>
                    <div class="row address-inputs">
                        <div class="col-md-12">
                            <input type="text" value="<?php echo @$nome_usuario ?>" name="nome" id="nome" placeholder="nome completo" required>
                            <input value="<?php echo @$cpf_usuario ?>" type="text" name="cpf" id="cpf" placeholder="CPF" required>
                            <input value="<?php echo @$email_usuario ?>" type="hidden" name="email" id="email" placeholder="email">
                            <input type="text" value="<?php echo @$telefone ?>" name="telefone" id="telefone" placeholder="whatsapp" required>
                            <input type="text" value="<?php echo @$cep ?>" name="cep" id="cep" placeholder="cep" required>
                            <input type="text" value="<?php echo @$rua ?>" name="rua" id="logradouro" placeholder="endereço" required>
                            <input type="text" value="<?php echo @$numero ?>" name="numero" id="numero" placeholder="número da casa" required>
                            <input type="text" value="<?php echo @$bairro ?>" name="bairro" id="bairro" placeholder="bairro" required>
                            <input type="text" class="form-control" value="<?php echo @$cidade ?>" id="localidade" name="cidade" placeholder="cidade" required>
                            <input type="hidden" value="SP" name="estado" id="uf" >
                            <input type="text" value="<?php echo @$complemento ?>" name="complemento" id="complemento" placeholder="ponto de referência" required>

                        </div>
                    </div>
                    <div class="cf-title">Forma de Pagamento na Entrega</div>
                    <div class="row shipping-btns">
                        <div class="col-6">
                            <h4>Dinheiro/ PIX</h4>
                        </div>
                        <div class="col-6">
                            <div class="cf-radio-btns">
                                <div class="cfr-item">
                                    <input value="0" type="radio" name="taxapgto" id="dinheiro_pix">
                                    <label for="dinheiro_pix"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <h4>Debito</h4>
                        </div>
                        <div class="col-6">
                            <div class="cf-radio-btns">
                                <div class="cfr-item">
                                    <input value="4" type="radio" name="taxapgto" id="debito">
                                    <label for="debito"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <h4>Credito 1x</h4>
                        </div>
                        <div class="col-6">
                            <div class="cf-radio-btns">
                                <div class="cfr-item">
                                    <input value="5" type="radio" name="taxapgto" id="credito_1x">
                                    <label for="credito_1x"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <h4>Credito 2x</h4>
                        </div>
                        <div class="col-6">
                            <div class="cf-radio-btns">
                                <div class="cfr-item">
                                    <input value="6" type="radio" name="taxapgto" id="credito_2x">
                                    <label for="credito_2x"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <h4>Credito 3x</h4>
                        </div>
                        <div class="col-6">
                            <div class="cf-radio-btns">
                                <div class="cfr-item">
                                    <input value="7" type="radio" name="taxapgto" id="credito_3x">
                                    <label for="credito_3x"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cf-title">Resumo do Pedido</div>


            </div>
        </div>
    
    
        <div class="checkout__form pl-1 pt-1 pr-1 col-lg-12 col-md-6">

                    
                        <div class="checkout__order">
                            <div class="checkout__order__products">Produtos <span>Total</span></div>
                            <ul>

                                <?php 
                                $res = $pdo->query("SELECT * from carrinho where id_usuario = '$id_usuario' and id_venda = 0 order by id asc");
                                $dados = $res->fetchAll(PDO::FETCH_ASSOC);
                                $linhas = count($dados);

                                if($linhas == 0){
                                  $linhas = 0;
                                  $total = 0;
                                  $total_custo = 0;
                              }
                 
                              $total;
                              $total_custo;
                              $total_peso;
                              
                              for ($i=0; $i < count($dados); $i++) { 
                               foreach ($dados[$i] as $key => $value) {
                               }

                               $id_produto = $dados[$i]['id_produto'];    
                               $quantidade = $dados[$i]['quantidade'];
                               $id_carrinho = $dados[$i]['id'];
                               $combo = $dados[$i]['combo'];

                               if($combo == 'Sim'){
                                 $res_p = $pdo->query("SELECT * from combos where id = '$id_produto' ");
                             }else{
                              $res_p = $pdo->query("SELECT * from produtos where id = '$id_produto' ");
                          }

                          $dados_p = $res_p->fetchAll(PDO::FETCH_ASSOC);
                          $nome_produto = $dados_p[0]['nome'];
                          $tipo_envio = $dados_p[0]['tipo_envio'];
                          $valor_frete = $dados_p[0]['valor_frete'];

                         

                          if($combo == 'Sim'){ 
                              $promocao = ""; 
                              $pasta = "combos";
                          }else{
                              $promocao = $dados_p[0]['promocao']; 
                              $pasta = "produtos";
                          }


                          if($promocao == 'Sim'){
                              $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id_produto' ");
                              $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
                              $valor = $resp[0]['valor'];
                              $valor_custo = $resp[0]['custo'];

                          }else{
                              $valor = $dados_p[0]['valor'];
                              $valor_custo = $dados_p[0]['custo'];
                          }

                         
                          
                                  
                          $imagem = $dados_p[0]['imagem'];


                          $total_item = $valor * $quantidade;
                          @$total = @$total + $total_item;
                          
                          $total_item_custo = $valor_custo * $quantidade;
                          $total_custo = $total_custo + $total_item_custo;

                          if($valor_frete > 0){
                                
                                @$total = @$total + @$valor_frete;
                              }


                          $valor = number_format( $valor , 2, ',', '.');
                            //$total = number_format( $total , 2, ',', '.');
                          $total_item = number_format( $total_item , 2, ',', '.');


                          ?>
                          <li><?php echo $nome_produto ?> <span>R$<?php echo $total_item ?></span></li>
<br><br>
                          

                          <?php } 
                          @$total = number_format(@$total, 2, ',', '.');
                           ?>
                      </ul>
                      <div class="checkout__order__subtotal">Subtotal <span>R$ <?php echo $total; ?></span></div>
                      <div class="checkout__order__combinar">Taxa de entrega <span>a combinar</span></div>  
                      <div class="checkout__order__combinar">Taxa de cartão<span id="taxa_cartao">a calcular</span></div>     

      

 
                                      

                      <div  class="checkout__order__total">Total <span id="total_final"></span></div>
                     

                      <input type="hidden" value="0" id="vlr_frete" name="vlr_frete">
                      <input type="hidden" value="<?php echo @$frete_correios ?>" id="existe_frete" name="existe_frete">
                      <input type="hidden" value="" id="tipotaxacartao" name="tipotaxacartao">
                      <input type="hidden" value="<?php echo @$total ?>" id="total_compra" name="total_compra">
                      <input type="hidden" value="<?php echo @$total_custo ?>" id="total_custo" name="total_custo">
                      <input type="hidden" value="<?php echo @$cpf_usuario ?>" id="antigo" name="antigo">

                      <button id="btn-finalizar" type="submit" class="site-btn bg-success">FINALIZAR COMPRA</button>
                     </form>

                      <div class="mt-2" id="mensagem-finalizar"></div>
                  </div>
              
          </div>
     
  </div>

</section>
<!-- Checkout Section End -->






<?php
require_once("rodape.php");
?>


<!--BUSCANDO ENDEREÇO POR CEP-->
<script type="text/javascript">
const cep = document.querySelector("#cep");
    
const showData = (result)=>{
    for(const campo in result){
        if(document.querySelector("#"+campo)){
            document.querySelector("#"+campo).value = result[campo];
            
        }
    }
}

cep.addEventListener("blur",(e)=>{
    let search = cep.value.replace("-", "");
    const options = {
        method: 'GET',
        mode: 'cors',
        cache: 'default'
    }
    fetch(`https://viacep.com.br/ws/${search}/json/`, options)
    .then(response=>{ response.json()
        .then( data => showData(data))
    })
    .catch(e => console.log('Deu erro: '+ e, message))

    
    
        
    })
</script>


<script type="text/javascript">
  $( document ).ready(function() {
    var total = "<?=$total?>";
    var id_venda = "<?=$id_venda?>";

    if(total == "0,00" &&  id_venda == ""){
        window.location="produtos.php";
    }
  
    
    $('#total_final').text("R$ " + total);
    $('#total_pgto').text("R$ " + total);
    
      
    //CALCULANDO A PORCENTAGEM DAS TAXAS 
    total = total.replace(',', '.');
    total = parseFloat(total);
    
    var taxaDebito = total * 4 / 100;
    var taxaCredito1x = total * 5 / 100;
    var taxaCredito2x = total * 6 / 100;
    var taxaCredito3x = total * 7 / 100;
    
    //FORMATANDO PARA MOEDA NACIONAL 
    taxaDebito = taxaDebito.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'});
    taxaCredito1x = taxaCredito1x.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'});
    taxaCredito2x = taxaCredito2x.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'});
    taxaCredito3x = taxaCredito3x.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'});
    
    //MOSTRANDO AS TAXAS PARA O USUARIO ESCOLHER
    $("label[for='dinheiro_pix']").html(" + R$ "+ 0,00);
    $("label[for='debito']").html("+ "+taxaDebito);
    $("label[for='credito_1x']").html("+ "+taxaCredito1x);
    $("label[for='credito_2x']").html("+ "+taxaCredito2x);
    $("label[for='credito_3x']").html("+ "+taxaCredito3x);
      
    //VERIFICANDO QUAL IMPUT RADIO O USUARIO ESCOLHEU E PEGANDO O VALOR
    $('input[name="taxapgto"]').click(function() {     
        var tipotaxapgto = $('input[name="taxapgto"]:checked').val();
        
        //TOTALIZANDO TAXA CARTÃO NO RESUMO DA VENDA
        var taxaCartao = total * tipotaxapgto / 100
        taxaCartao = taxaCartao.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'});
        $('#tipotaxacartao').val(tipotaxapgto);
        $('#taxa_cartao').text(taxaCartao);
        
        totalF = total + (total * tipotaxapgto / 100);
        totalF = totalF.toLocaleString('pt-BR', {style: 'currency', currency: 'BRL'});
        
        $('#total_final').text(totalF);
        $('#total_pgto').text(totalF);
    });
   
      
    






  })
</script>


<script type="text/javascript">
    $('#btn-cupom').click(function(event){
        event.preventDefault();
                
        $.ajax({
            url:"cupom/usar-cupom.php",
            method:"post",
            data: $('form').serialize(),
            dataType: "text",
            success: function(msg){
                if(msg.trim() === 'Insira um valor para o Cupom'){
                    
                    $('#mensagem-cupom').addClass('text-danger')
                    $('#mensagem-cupom').text(msg);
                    }

                 else if (msg.trim() === 'Esse código de cupom é inexistente!'){
                    $('#mensagem-cupom').addClass('text-danger')
                    $('#mensagem-cupom').text(msg);



                    

                 }else{
                    var tot;
                    total_final = $('#total_final').text();
                    total_final = total_final.replace(",",".");
                    total_final = total_final.replace("R$","");
                    tot = parseFloat(total_final) - parseFloat(msg);
                    tot = tot.toFixed(2);
                    $('#total_compra').val(tot);
                    tot = "R$ " + tot.replace(".",",");
                    console.log(tot);
                    $('#total_final').text(tot);
                    $('#total_pgto').text(tot);


                    $('#mensagem-cupom').addClass('text-success')
                    $('#mensagem-cupom').text("Cupom de desconto no valor de R$" + msg + " Reais");
                 }
            }
        })
    })
</script>


<script type="text/javascript">
    $('#codigo_servico').change(function(event){
        event.preventDefault();

        $.ajax({
      url:  "correios/pegarDadosFrete.php",
      method: "post",
      data: $('#frm').serialize(),
      dataType: "html",
      success: function(result){

        var array = result.split(" ");
        var tot_frete = array[7];
        tot_frete = tot_frete.replace(",",".");
        vlr_frete_antigo = $('#vlr_frete').val();
        console.log(vlr_frete_antigo);
        console.log(tot_frete);
        total_final = $('#total_final').text();
        total_final = total_final.replace(",",".");
        total_final = total_final.replace("R$","");
        tot = parseFloat(total_final) + parseFloat(tot_frete) - parseFloat(vlr_frete_antigo);
        tot = tot.toFixed(2);
        $('#total_compra').val(tot);
        tot = "R$ " + tot.replace(".",",");
        console.log(tot);
        $('#total_final').text(tot);
        $('#total_pgto').text(tot);

        $('#listar-frete').html(result);
        $('#vlr_frete').val(tot_frete);
        $('#mensagem-finalizar').text("");
      },
     })

    })
</script>





<script type="text/javascript">
    $('#btn-finalizar').click(function(event){
        event.preventDefault();

        $.ajax({
      url:  "finalizar-compra.php",
      method: "post",
      data: $('#form-dados').serialize(),
      dataType: "html",
      success: function(msg){
        console.log(msg);
        if(msg.trim() === 'Selecione um CEP válido para o Frete!'){
            $('#listar-frete').html('');
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Escolha a forma de pagamento!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Erro ao calcular a taxa de cartão!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o campo nome!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o nome completo!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha a rua ou avênida!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o número da casa!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o bairro!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha a cidade!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o cep!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === "Preencha o cep correto!"){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o ponto de referencia!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o whatsapp!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'WhatsApp esta faltando números! preencha com o DDD exemplo 12981819956'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === 'Preencha o campo CPF!'){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === "Preencha o CPF correto"){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === "Erro ao atualizar usuário no banco de dados"){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === "Erro ao atualizar cliente no banco de dados"){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === "Erro ao inserir a venda no banco de dados"){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
            
        }else if(msg.trim() === "Erro ao inserir o carrinho no banco de dados"){
            $('#mensagem-finalizar').addClass('text-danger')
            $('#mensagem-finalizar').text(msg);
        }else{ 
            // receber vendas por pagseguro 
//            window.location="pagamentos/pagseguro/checkout.php?codigo=" + msg;
            
            
//            window.location="https://api.whatsapp.com/send?phone=5512981819956&text=Ol%C3%A1%20acabei%20de%20finalizar%20minha%20compra%2C%20veja%20https%3A%2F%2Fgabymodas.com%2Fsistema%2Findex.php%3Fcpf%3D"+msg;
            
            window.location= "http://localhost/gabymodas/sistema/painel-cliente";
        }
        
      },
     })

    })
</script>




<script type="text/javascript">
    $('#local').change(function(event){
        event.preventDefault();

        $('#mensagem-finalizar').text("");
        var check = document.getElementsByName("local"); 
        for (var i=0;i<check.length;i++){ 
        if (check[i].checked == true){ 
            document.getElementById("div-frete").style.display = 'none';

        }  else {
           document.getElementById("div-frete").style.display = 'block';
        }
    }

    })
</script>

<script type="text/javascript">
// In your Javascript (external .js resource or <script> tag)
$(document).ready(function() {
    $('.js-example-ajax').select2();
});


</script>


<?php 
require_once("modal-pagamento.php");
 ?>


