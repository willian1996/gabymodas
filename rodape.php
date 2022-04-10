<?php 

require_once("conexao.php");
$query = $pdo->query("SELECT * FROM alertas where data >= curDate() and ativo = 'Sim' order by id limit 1");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$linhas = @count($res);
if($linhas > 0){
  $titulo = $res[0]['titulo_alerta'];
  $titulo_mensagem = $res[0]['titulo_mensagem'];
  $mensagem = $res[0]['mensagem'];
  $link = $res[0]['link'];
  $imagem = $res[0]['imagem'];


 ?>

  <div class="row">
      <a data-toggle="modal" href="#modalPromocoes">
      <div class="alert alert-danger fixed-bottom col-md-2" role="alert">
        <small><?php echo $titulo ?></small>
      </div>
      </a>

   </div>

<?php } ?>

<!-- Footer Section Begin -->
<!--
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="footer__about">
                    <ul>
                        <li><?php echo $endereco_loja ?></li>
                        <li>WhatsApp: <?php echo $telefone ?></li>
                        <li>Email: <?php echo $email ?></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Principais Links</h6>
                    <ul>
                        <li><a href="lista-produtos">Lista de Produtos</a></li>
                        <li><a href="categorias.php">Categorias</a></li>
                        <li><a href="sacola.php">Sacola</a></li>
                        <li><a href="promocoes.php">Promoções</a></li>
                        <li><a href="contatos.php">Contato</a></li>
                        
                    </ul> 

                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Ainda não possui Cadastro?</h6>
                    <p>Insira seu CPF para se cadastrar em nosso site!!</p>
                    <form action="sistema/index.php" method="get">
                        <input type="text" name="cpf" placeholder="Insira seu CPF" required>
                        <button type="submit" class="site-btn">Cadastre-se</button>
                    </form>
                    <div class="footer__widget__social">
                        <a target="_blank" title="Ir para página do Facebook" href="https://www.facebook.com/gabytavares.com.br"><i class="fa fa-facebook"></i></a>
                        <a target="_blank" href="https://www.instagram.com/gabymodasoficialsp/"><i class="fa fa-instagram"></i></a>
                        <a target="_blank" href="http://api.whatsapp.com/send?1=pt_BR&phone=<?php echo $whatsapp_link ?>" title="<?php echo $whatsapp ?>"><i class="fa fa-whatsapp"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text"><p>
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> <i class="fa fa-heart" aria-hidden="true"></i> desenvolvido por <a href="https://saleswebdev.com/">SalesWebDev</a>
                    </p></div>
                </div>
            </div>
        </div>
    </div>
</footer>
-->



<!-- Footer section -->
<section class="footer-section">
		<div class="container">
			<div class="footer-logo text-center">
				<a href="index.html"><img src="./img/logo-light.png" alt=""></a>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>Sobre a Loja</h2>
						<p>A Gaby Modas é uma loja online sobre encomenda, os clientes do Litoral Norte SP tem a vantagem de comprar e pagar somente na entrega, as entregas são feitas em até 7 dias via motoboy. Para clientes de outras cidades o pagamento é feito via Mercado Pago e entregas via Correios.</p>
						<img src="img/cards.png" alt="">
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>Categorias</h2>
						<ul>
                            <?php 
                             $query = $pdo->query("SELECT * FROM sub_categorias order by id limit 6 ");
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
						<ul>
                            <?php 
                             $query = $pdo->query("SELECT * FROM sub_categorias order by id limit 6,6 ");
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
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>Mais Vendidos</h2>
						<div class="fw-latest-post-widget">
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
                              $desconto = $resp[0]['desconto'];
                              $valor = number_format($valor, 2, ',', '.');
                            }else{
                              $valor = number_format($valor, 2, ',', '.');
                            }
                            ?>

                            <a href="produto-<?php echo $nome_url ?>" >
                            <div class="lp-item">
								<div class="lp-thumb set-bg" data-setbg="img/produtos/<?php echo $imagem ?>"></div>
								<div class="lp-content">
									<h6><?php echo $nome ?></h6>
									<span>R$ <?php echo $valor ?></span>
                                    <a href="#" class="readmore">Ver</a>
								</div>
							</div>
                            </a>
                          <?php } ?>                           

						</div>
                
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget contact-widget">
						<h2>Empresa</h2>
						<div class="con-info">
							<span>Loja</span>
							<p>Gaby Modas Feminina</p>
						</div>
						<div class="con-info">
							<span>Local</span>
							<p>Litoral Norte - SP</p>
						</div>
						<div class="con-info">
							<span>Tel</span>
							<p>(12) 98181-9956</p>
						</div>
						<div class="con-info">
							<span>Email</span>
							<p>gabymodas39@gmail.com</p>
						</div>
                        <div class="footer__widget">
                    <h6>Ainda não possui cadastro na loja?</h6>
                    <form action="sistema/index.php" method="get">
                        <input type="text" name="cpf" placeholder="Insira seu CPF" required>
                        <button type="submit" class="site-btn">Cadastrar</button>
                    </form>
                
                </div>
					</div>
                
				</div>
			</div>
		</div>
<!--
		<div class="social-links-warp">
			<div class="container">
				<div class="social-links">
					<a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
					<a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
					<a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
					<a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
					<a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
					<a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
					<a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
				</div>



			</div>
		</div>
-->
</section>
	<!-- Footer section end -->
  <!-- Footer Section End -->

  <!-- Js Plugins -->
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.nice-select.min.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/jquery.slicknav.js"></script>
  <script src="js/mixitup.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/main.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

  <script src="js/mascara.js"></script>




</body>

</html>




<div class="modal" id="modalPromocoes" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><?php echo @$titulo ?> - <?php echo $titulo_mensagem ?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <span class="text-muted"><i><?php echo $mensagem ?> 
              <?php if($link != ""){ ?>
              clique <a class="text-danger" href="<?php echo $link ?>" target="_blank"> aqui</a> para ir para ver!!
            <?php } ?>
            </i></span>

            <div class="mt-3">
<!--            <img src="img/alertas/<?php echo $imagem ?>" width="100%">-->
           </div>

                <div align="center" id="mensagem_excluir" class="">

                </div>

            </div>
            
        </div>
    </div>
</div>

