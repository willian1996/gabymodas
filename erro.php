<?php
require_once 'header.php';
$erro =  isset($_GET['error'])?$_GET['error']:'';
?>
<div class="usuariojacadastrado">
    <h3>erro: <?php echo $erro ?></h3>
    <button  onclick="history.back()">voltar</button>
</div>
<?php
require_once 'footer.php';

?>