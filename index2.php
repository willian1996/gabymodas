<?php
require_once("cabecalho.php");
require_once("cabecalho-busca.php");
require_once("conexao.php");
@session_start();
?>

<!-- Hero section -->
<section class="hero-section">
    <div class="hero-slider owl-carousel">
        <div class="hs-item set-bg" data-setbg="img/hero/bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-7 text-white">
                        <span>New Arrivals</span>
                        <h2>jaquetas jeans</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum sus-pendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. </p>
                        <a href="#" class="site-btn sb-line">DESCOBRIR</a>
                        <a href="#" class="site-btn sb-white">ADICIONAR AO CARRINHO</a>
                    </div>
                </div>
                <div class="offer-card text-white">
                    <span>de</span>
                    <h2>$29</h2>
                    <p>COMPRE AGORA</p>
                </div>
            </div>
        </div>
        <div class="hs-item set-bg" data-setbg="img/hero/bg-2.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-7 text-white">
                        <span>Novas chegadas</span>
                        <h2>jaquetas jeans</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum sus-pendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. </p>
                        <a href="#" class="site-btn sb-line">DESCOBRIR</a>
                        <a href="#" class="site-btn sb-white">ADICIONAR AO CARRINHO</a>
                    </div>
                </div>
                <div class="offer-card text-white">
                    <span>de</span>
                    <h2>$29</h2>
                    <p>COMPRE AGORA</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="slide-num-holder" id="snh-1"></div>
    </div>
</section>
<!-- Hero section end -->

  





<?php
require_once("rodape.php");
require_once("modal-carrinho.php");

?>







