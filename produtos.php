<?php
require_once("cabecalho.php");
require_once("conexao.php");

require_once("cabecalho-busca.php");

?>

<?php 
//PEGAR PAGINA ATUAL PARA PAGINAÇAO
if(@$_GET['pagina'] != null){
    $pag = $_GET['pagina'];
}else{
    $pag = 0;
}

$limite = $pag * @$itens_por_pagina;
$pagina = $pag;
$nome_pag = 'lista-produtos.php';
?>


<?php  
//recuperar o nome da subcat para filtrar os produtos
$subcategoria_get = @$_GET['nome'];
$query = $pdo->query("SELECT * FROM sub_categorias where nome_url = '$subcategoria_get' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$id_subcategoria = @$res[0]['id'];
 ?>


 <?php 
//recuperar o valor inicial e valor final para filtrar produto
$valor_inicial = @$_GET['valor-inicial'];
$valor_final = @$_GET['valor-final'];
 ?>

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                  <div class="sidebar__item hiddenOnMobile">
                    <h4>Categorias</h4>
                    <ul>
                        <?php 
                        $query = $pdo->query("SELECT * FROM sub_categorias order by nome asc ");
                        $res = $query->fetchAll(PDO::FETCH_ASSOC);

                        for ($i=0; $i < count($res); $i++) { 
                          foreach ($res[$i] as $key => $value) {
                          }

                          $nome = $res[$i]['nome'];

                          $nome_url = $res[$i]['nome_url'];

                          ?>
                          <li><a href="produtos-<?php echo $nome_url ?>"><?php echo $nome ?></a></li>

                      <?php } ?>

                  </ul>
              </div>
                    
            
        <div class="sidebar__item spad d-none d-md-block">
          <div class="latest-product__text">
            <h4>Lançamentos</h4>


            <div class="latest-product__slider owl-carousel">
              <div class="latest-prdouct__slider__item">

                <?php 
                $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by data desc limit 6 ");
                $res = $query->fetchAll(PDO::FETCH_ASSOC);

                for ($i=0; $i < count($res); $i++) { 
                  foreach ($res[$i] as $key => $value) {
                  }

                  $nome = $res[$i]['nome'];
                  $valor = $res[$i]['valor'];
                  $nome_url = $res[$i]['nome_url'];
                  $imagem = $res[$i]['imagem'];
                  $promocao = $res[$i]['promocao'];
                  $id = $res[$i]['id'];

                  if($promocao == 'Sim'){
                    $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id' ");
                    $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
                    $valor = $resp[0]['valor'];
                    $valor = number_format($valor, 2, ',', '.');
                  }else{
                    $valor = number_format($valor, 2, ',', '.');
                  }

                  ?>


                  <a href="produto-<?php echo $nome_url ?>" class="latest-product__item">
                    <div class="row">
                      <div class="col-md-7">
                        <div class="latest-product__item__pic">
                          <img src="img/produtos/<?php echo $imagem ?>" alt="">
                        </div>
                      </div>
                      <div class="col-md-5">
                        <div class="latest-product__item__text">
                          <h6><?php echo $nome ?></h6>
                          <span>R$ <?php echo $valor ?></span>
                        </div>
                      </div>
                    </div>
                  </a>

                <?php } ?>


              </div>


              <div class="latest-prdouct__slider__item">

                <?php 
                $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by data desc limit 6,6 ");
                $res = $query->fetchAll(PDO::FETCH_ASSOC);

                for ($i=0; $i < count($res); $i++) { 
                  foreach ($res[$i] as $key => $value) {
                  }

                  $nome = $res[$i]['nome'];
                  $valor = $res[$i]['valor'];
                  $nome_url = $res[$i]['nome_url'];
                  $imagem = $res[$i]['imagem'];
                  $promocao = $res[$i]['promocao'];
                  $id = $res[$i]['id'];

                  if($promocao == 'Sim'){
                    $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id' ");
                    $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
                    $valor = $resp[0]['valor'];
                    $valor = number_format($valor, 2, ',', '.');
                  }else{
                    $valor = number_format($valor, 2, ',', '.');
                  }


                  ?>


                  <a href="produto-<?php echo $nome_url ?>" class="latest-product__item">
                    <div class="row">
                    <div class="col-md-7">
                      <div class="latest-product__item__pic">
                        <img src="img/produtos/<?php echo $imagem ?>" alt="">
                      </div>
                    </div>
                    <div class="col-md-5">
                      <div class="latest-product__item__text">
                        <h6><?php echo $nome ?></h6>
                        <span>R$ <?php echo $valor ?></span>
                      </div>
                    </div>
                  </div>
                  </a>

                <?php } ?>


              </div>



              <div class="latest-prdouct__slider__item">

                <?php 
                $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by data desc limit 12,6 ");
                $res = $query->fetchAll(PDO::FETCH_ASSOC);

                for ($i=0; $i < count($res); $i++) { 
                  foreach ($res[$i] as $key => $value) {
                  }

                  $nome = $res[$i]['nome'];
                  $valor = $res[$i]['valor'];
                  $nome_url = $res[$i]['nome_url'];
                  $imagem = $res[$i]['imagem'];
                  $promocao = $res[$i]['promocao'];
                  $id = $res[$i]['id'];

                  if($promocao == 'Sim'){
                    $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id' ");
                    $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
                    $valor = $resp[0]['valor'];
                    $valor = number_format($valor, 2, ',', '.');
                  }else{
                    $valor = number_format($valor, 2, ',', '.');
                  }
                  ?>


                  <a href="produto-<?php echo $nome_url ?>" class="latest-product__item">
                    <div class="row">
                    <div class="col-md-7">
                      <div class="latest-product__item__pic">
                        <img src="img/produtos/<?php echo $imagem ?>" alt="">
                      </div>
                    </div>
                    <div class="col-md-5">
                      <div class="latest-product__item__text">
                        <h6><?php echo $nome ?></h6>
                        <span>R$ <?php echo $valor ?></span>
                      </div>
                    </div>
                  </div>
                  </a>

                <?php } ?>


              </div>


            </div>


          </div>
        </div>


    </div>
</div>


<div class="col-lg-9 col-md-7">




   


        <?php
        if(@$_GET['txtBuscar'] != "") {
            $buscar = '%'.@$_GET['txtBuscar'].'%';

        }else{
            $buscar = '%';
        }
        
        if($subcategoria_get == "" and $valor_inicial == "") {
        $query = $pdo->query("SELECT * FROM produtos where (nome LIKE '$buscar' or palavras like '$buscar') and ativo = 'Sim' and estoque > 0 order by vendas desc LIMIT $limite, $itens_por_pagina ");
        }else if($valor_inicial != ""){
            $query = $pdo->query("SELECT * FROM produtos where valor >= '$valor_inicial' and valor <= '$valor_final' and ativo = 'Sim' and estoque > 0 order by vendas desc");
        }

        else{
            $query = $pdo->query("SELECT * FROM produtos where sub_categoria = '$id_subcategoria' and ativo = 'Sim' and estoque > 0 order by vendas desc");
        }
        $res = $query->fetchAll(PDO::FETCH_ASSOC);
        $total_prod = @count($res);
        if(@$_GET['txtBuscar'] != "" or @$id_subcategoria!= "" or @$valor_inicial!= "") {
        echo $total_prod.' Produtos Encontrados!';
        }

        echo '<div class="row mt-4">';

        for ($i=0; $i < count($res); $i++) { 
          foreach ($res[$i] as $key => $value) {
          }

          $nome = $res[$i]['nome'];
          $valor = $res[$i]['valor'];
          $nome_url = $res[$i]['nome_url'];
          $imagem = $res[$i]['imagem'];
          $promocao = $res[$i]['promocao'];
          $id = $res[$i]['id'];

          $valor = number_format($valor, 2, ',', '.');

   //BUSCAR O TOTAL DE REGISTROS PARA PAGINAR
          $query3 = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0");
          $res3 = $query3->fetchAll(PDO::FETCH_ASSOC);
          $num_total = @count($res3);
          $num_paginas = ceil($num_total/$itens_por_pagina);

          if($promocao == 'Sim'){
            $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id' ");
            $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
            $valor_promo = $resp[0]['valor'];
            $desconto = $resp[0]['desconto'];
            $valor_promo = number_format($valor_promo, 2, ',', '.');




            ?>

            <a href="produto-<?php echo $nome_url ?>"><div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__discount__item">
                    <div class="product__discount__item__pic set-bg"
                    data-setbg="img/produtos/<?php echo $imagem ?>">
                    <div class="product__discount__percent">-<?php echo $desconto ?>%</div>
                
                 </div>
                 <div class="product__discount__item__text">

                    <h5><a href="produto-<?php echo $nome_url ?>"><?php echo $nome ?></a></h5>
                    <div class="product__item__price">R$ <?php echo $valor_promo ?> <span>R$ <?php echo $valor ?></span></div>
                </div>
            </div>
            </div></a>

    <?php }else{ ?>


     <a href="produto-<?php echo $nome_url ?>"><div class="col-lg-4 col-md-6 col-sm-6">
       <div class="featured__item">
        <div class="featured__item__pic set-bg" data-setbg="img/produtos/<?php echo $imagem ?>">
        </div>
        <div class="featured__item__text">
            <a href="produto-<?php echo $nome_url ?>"><h6><?php echo $nome ?></h6>
                <h5>R$ <?php echo $valor ?></h5></a>
            </div>
        </div>
    </div></a>

<?php } } ?>



</div>

<?php if(@$_GET['txtBuscar'] == "" and @$id_subcategoria == "" and @$valor_inicial == ""){ ?>
<div class="product__pagination">
                <a href="<?php echo $nome_pag ?>?pagina=0"><i class="fa fa-long-arrow-left"></i></a>

                <?php 
                    for($i = 0; $i < @$num_paginas; $i++){
                        $estilo = '';
                        if($pagina == $i){
                            $estilo = 'bg-info text-light';
                        }

                        if($pagina >= ($i - 2) && $pagina <= ($i + 2)){ ?>
                         <a href="<?php echo $nome_pag ?>?pagina=<?php echo $i ?>" class="<?php echo $estilo ?>"><?php echo $i + 1 ?></a>

                       <?php } 

                    }
                 ?>
                
                
                <a href="<?php echo $nome_pag ?>?pagina=<?php echo $num_paginas - 1 ?>"><i class="fa fa-long-arrow-right"></i></a>
 </div>
<?php } ?>


</div>
</div>
</div>
</section>

<?php

require_once("rodape.php");
require_once("modal-carrinho.php");
?>