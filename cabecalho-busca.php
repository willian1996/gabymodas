<?php  
require_once("conexao.php");
 ?>
<!-- Hero Section Begin -->
    <section class="hero hero-normal">
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
                               
                                <input name="txtBuscar" type="text" placeholder="Deseja buscar um Produto?" value="<?php echo @$_GET['txtBuscar'] ?>">
                                <button type="submit" class="site-btn">BUSCAR</button>
                            </form>
                        </div>
  
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->