<?php
require_once 'header.php';
$whatsapp =  isset($_GET['whatsapp'])?$_GET['whatsapp']:'';
?>
<div class="usuariojacadastrado">
    
    
    <h3>Whatsapp <br><strong class="telefone"><?php echo $whatsapp ?></strong> já cadastrado</h3>
    <button  onclick="history.back()">voltar</button>






    


</div>
<?php
require_once 'footer.php';

?>