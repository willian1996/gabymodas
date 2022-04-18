<?php
require_once("cabecalho.php");
require_once("conexao.php");
@session_start();
?>

 

 
<!-- Hero Section Begin -->
<section class="hero hero-mobile">
  <div class="container">
    <div class="row">
      <div class="col-lg-3">
        <div class="hero__categories">
          <div class="hero__categories__all">
            <i class="fa fa-bars"></i>
            <span>Categorias</span>
          </div>
          <ul>
            <?php 
            $query = $pdo->query("SELECT * FROM sub_categorias order by nome asc ");
            $res = $query->fetchAll(PDO::FETCH_ASSOC);

            for ($i=0; $i < count($res); $i++) { 
              foreach ($res[$i] as $key => $value) {
              }

              $nome = $res[$i]['nome'];

              $nome_url = $res[$i]['nome_url'];
              $id = $res[$i]['id'];
              ?>
              <li><a href="produtos-<?php echo $nome_url ?>"><?php echo $nome ?></a></li>

              <?php } ?>
          </ul>
        </div>
      </div>
      <div class="col-lg-9">
        <div class="hero__search">
          <div class="hero__search__form">
           <form action="lista-produtos.php" method="get">

            <input name="txtBuscar" type="text" placeholder="Deseja buscar um Produto?">
            <button type="submit" class="site-btn">BUSCAR</button>
          </form>
        </div>
      </div>
      <div class="hero__item set-bg bg-light" data-setbg="img/hero/img5.jpg">
        <div class="hero__text justify-content-center align-items-center">

          <span>São Sebastião, Caraguatatuba <br>e Ilhabela</span>
          <h2>Pague <br /> na Entrega</h2>
          <p class="text-white">Compre hoje, recebe na próxima semana</p>
          <a  href="lista-produtos.php" class="primary-btn">VER TODOS OS PRODUTOS</a>
        </div>
      </div>
    </div>
  </div>
</div>
</section>
<!-- Hero Section End -->

<!-- Categories Section Begin -->
<section class="categories">
  <div class="container">
    <div class="row">
      <div class="categories__slider owl-carousel">

       <?php 
       $query = $pdo->query("SELECT * FROM sub_categorias order by id ");
       $res = $query->fetchAll(PDO::FETCH_ASSOC);

       for ($i=0; $i < count($res); $i++) { 
        foreach ($res[$i] as $key => $value) {
        }

        $nome = $res[$i]['nome'];
        $imagem = $res[$i]['imagem'];
        $nome_url = $res[$i]['nome_url'];

        ?>

        <div class="col-lg-3">
          <div class="categories__item set-bg" data-setbg="img/sub-categorias/<?php echo $imagem ?>">
            <h5><a href="produtos-<?php echo $nome_url ?>"><?php echo $nome ?></a></h5>
          </div>
        </div>

      <?php } ?>

    </div>
  </div>
</div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="section-title">
         <a class="text-dark" href="produtos.php"><span ><small>Ver + Produtos</small></span></a>
         <h2>Produtos Destaques </h2>

       </div>
       <div class="featured__controls">
        <ul>
         <?php 
         $query = $pdo->query("SELECT * FROM sub_categorias order by id limit 12 ");
         $res = $query->fetchAll(PDO::FETCH_ASSOC);

         for ($i=0; $i < count($res); $i++) { 
          foreach ($res[$i] as $key => $value) {
          }

          $nome = $res[$i]['nome'];

          $nome_url = $res[$i]['nome_url'];

          ?>
          <li><a href="produtos-<?php echo $nome_url ?>" class="text-dark"><?php echo $nome ?></a></li>
        <?php } ?>

      </ul>
    </div>
  </div>
</div>
<div class="row featured__filter">


 <?php 
 $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by vendas desc limit 8 ");
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

  $valor = number_format($valor, 2, ',', '.');

  if($promocao == 'Sim'){
    $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id' ");
    $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
    $valor_promo = $resp[0]['valor'];
    $desconto = $resp[0]['desconto'];
    $valor_promo = number_format($valor_promo, 2, ',', '.');

    ?>
<a href="produto-<?php echo $nome_url ?>">
    <div class="col-lg-3 col-md-4 col-sm-6 mix sapatos fresh-meat">
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
  </div>
</a>
<?php }else{ ?>
<a href="produto-<?php echo $nome_url ?>">
  <div class="col-lg-3 col-md-4 col-sm-6 mix sapatos fresh-meat">
    <div class="featured__item">
      <div class="featured__item__pic set-bg" data-setbg="img/produtos/<?php echo $imagem ?>">
        </div>
        <div class="featured__item__text">
          <a href="produto-<?php echo $nome_url ?>"><h6><?php echo $nome ?></h6>
            <h5>R$ <?php echo $valor ?></h5></a>
          </div>
        </div>
      </div>
</a>
    <?php } } ?>


  </div>
</div>
</section>
<!-- Featured Section End -->


<!-- Banner Begin -->
<div class="banner">
  <div class="container">
    <div class="row">

     <?php 
     $query = $pdo->query("SELECT * FROM promocao_banner where ativo = 'Sim' order by id desc limit 2 ");
     $res = $query->fetchAll(PDO::FETCH_ASSOC);

     for ($i=0; $i < count($res); $i++) { 
      foreach ($res[$i] as $key => $value) {
      }

      $titulo = $res[$i]['titulo'];
      $link = $res[$i]['link'];

      $imagem = $res[$i]['imagem'];


      ?>

      <div class="col-lg-6 col-md-6 col-sm-6">
        <div class="banner__pic">
         <a href="<?php echo $link ?>" title="<?php echo $titulo ?>"> <img src="img/promocoes/<?php echo $imagem ?>" alt="<?php echo $titulo ?>"> </a>
       </div>
     </div>

   <?php } ?>

 </div>
</div>
</div>
<!-- Banner End -->
<br><br>

<section class="latest-product spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-6">
        <div class="latest-product__text">
          <a href="lista-produtos.php"><h4>Novidades<small> ver +</small></h4></a>
          <div id="novosProdutos" class="latest-product__slider owl-carousel">
            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by data desc limit 3 "); 
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
              $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by data desc limit 3,3 ");
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
              $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by data desc limit 6,3 ");
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
      <div class="col-lg-4 col-md-6">
        <div class="latest-product__text">
          <a href="produtos.php"><h4>Mais vendidos<small> ver +</small></h4></a>
          <div id="maisVendidos" class="latest-product__slider owl-carousel">


            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by vendas desc limit 3 ");
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
              $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by vendas desc limit 3,3 ");
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
              $query = $pdo->query("SELECT * FROM produtos where ativo = 'Sim' and estoque > 0 order by vendas desc limit 6,3 ");
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
      <div class="col-lg-4 col-md-6">
        <div class="latest-product__text">

          <a href="promocoes.php"><h4>Promoções<small> ver +</small></h4></a>
          <div id="combosPromocionais" class="latest-product__slider owl-carousel">



            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where promocao = 'Sim' and ativo = 'Sim' and estoque > 0 limit 3 ");
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
                    $valor_desc = $resp[0]['valor'];
                    $desconto = $resp[0]['desconto'];
                    $valor_desc = number_format($valor_desc, 2, ',', '.');
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
                         <strike> R$ <?php echo $valor ?> </strike>
                         <small>-<?php echo $desconto ?>%</small>
                         <span> R$ <?php echo $valor_desc ?></span>
                    </div>
                    
                </a>

              <?php } ?>
                
                


            </div>


            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where promocao = 'Sim' and ativo = 'Sim' and estoque > 0 limit 3,3 ");
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
                    $valor_desc = $resp[0]['valor'];
                    $desconto = $resp[0]['desconto'];
                    $valor_desc = number_format($valor_desc, 2, ',', '.');
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
                         <strike> R$ <?php echo $valor ?></strike>
                         <small>-<?php echo $desconto ?>%</small>
                         <span> R$ <?php echo $valor_desc ?></span>
                    </div>
                </a>

              <?php } ?>


            </div>



            <div class="latest-prdouct__slider__item">

              <?php 
              $query = $pdo->query("SELECT * FROM produtos where promocao = 'Sim' and ativo = 'Sim' and estoque > 0 limit 6,3 ");
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
                    $valor_desc = $resp[0]['valor'];
                    $desconto = $resp[0]['desconto'];
                    $valor_desc = number_format($valor_desc, 2, ',', '.');
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
                         <strike> R$ <?php echo $valor ?></strike>
                         <small>-<?php echo $desconto ?>% </small>
                         <span> R$ <?php echo $valor_desc ?></span>
                    </div>
                </a>
              <?php } ?>


            </div>



          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<?php
require_once("rodape.php");
require_once("modal-carrinho.php");

?>







