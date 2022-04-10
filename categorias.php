<?php
require_once("cabecalho.php");
?>

<?php
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
$nome_pag = 'categorias.php';
 ?>

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
  <div class="container">
    <div class="row">
<?php 
$query = $pdo->query("SELECT * FROM sub_categorias");
$rescat = $query->fetchAll(PDO::FETCH_ASSOC);

for ($icat=0; $icat < count($rescat); $icat++) { 
    foreach ($rescat[$icat] as $keycat => $valuecat) {
}

$nome_cat = $rescat[$icat]['nome'];

$nome_url = $rescat[$icat]['nome_url'];
$id_cat = $rescat[$icat]['id'];
?>
        
<div class="col-lg-4 col-md-6">
        <div class="latest-product__text">
          <h4><?php echo $nome_cat; ?></h4>
          <div id="novosProdutos" class="latest-product__slider owl-carousel">
            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where sub_categoria = $id_cat order by id desc limit 3 ");
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
                <div class="latest-product__item__pic">
                    <img src="img/produtos/<?php echo $imagem ?>" alt="">
                </div>
                <div class="latest-product__item__text">
                    <h6><?php echo $nome ?></h6>
                    <span>R$ <?php echo $valor ?></span>
                </div>
            </a>

              <?php } ?>


            </div>


            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where sub_categoria = $id_cat and ativo = 'Sim' and estoque > 0 order by id desc limit 3,3 ");
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
                    <div class="latest-product__item__pic">
                        <img src="img/produtos/<?php echo $imagem ?>" alt="">
                    </div>
                    <div class="latest-product__item__text">
                        <h6><?php echo $nome ?></h6>
                        <span>R$ <?php echo $valor ?></span>
                    </div>
                </a>

              <?php } ?>


            </div>



            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where sub_categoria = $id_cat and ativo = 'Sim' and estoque > 0 order by id desc limit 6,3 ");
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
                    <div class="latest-product__item__pic">
                        <img src="img/produtos/<?php echo $imagem ?>" alt="">
                    </div>
                    <div class="latest-product__item__text">
                        <h6><?php echo $nome ?></h6>
                        <span>R$ <?php echo $valor ?></span>
                    </div>
                </a>

              <?php } ?>


            </div>


          </div>
        </div>
      </div>

<?php } ?>
  </div>
  </div>
</section>

<!-- Latest Product Section End -->


<?php
require_once("rodape.php");
?>