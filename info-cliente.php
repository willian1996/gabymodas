<?php
    require_once 'header.php'; 
?>
<div id="infoCliente">
    <div class="col s12 m12 l6">
        <div class="card-panel">
          <p>==============================</p>
          <h5 class="header2">Dados do Cliente</h5>
          <p>==============================</p>
            <div id="dadosCliente" class="row">
                <?php
                $id = $_GET['id'];

                require 'server/conexao.php';
                try{
                    $stmt = $conn->prepare("SELECT * FROM clientes WHERE (id = '$id')"); 
                    $stmt->execute();
                    $resultado = $stmt->fetchAll(); 
                } catch(PDOException $e){
                    echo $e->getMessage();
                }
                foreach($resultado as $valor){
                ?> 
                
                <p><b>NOME:</b><br> <?php echo strtoupper($valor['nome_completo']); ?></p>
                <p><b>WHATSAPP:</b><br> <strong class="telefone"> <?php echo $valor['whatsapp'];   ?></strong></p>
                <p>==============================</p>
                <p><b>CIDADE:</b><br> <?php echo strtoupper($valor['cidade']);   ?></p>
                <p><b>BAIRRO:</b><br> <?php echo strtoupper($valor['bairro']);   ?></p>
                <p><b>RUA:</b><br> <?php echo strtoupper($valor['rua']);   ?></p>
                <p><b>NÚMERO:</b><br> <?php  echo $valor['numeroCasa'];  ?></p>
                <p><b>PONTO DE REFERÊNCIA:</b><br> <?php  echo strtoupper($valor['pontoDeReferencia']);  ?></p>
                <p><b>CEP:</b><br> <strong class="cep"> <?php echo $valor['cep'];   ?></strong></p>
                <p>==============================</p>
                <p><b>TELEFONE 1:</b><br> <strong class="telefone"> <?php echo $valor['telefone1'];   ?></strong></p>
                <p><b>TELEFONE 2:</b><br> <strong class="telefone"> <?php echo $valor['telefone2'];  ?></strong></p>
                <p>==============================</p>
                <?php
                }
                ?>
            </div>
            <div class="row">
                <div id="imprimir" class="input-field col s12">
                    <button class="btn cyan waves-effect waves-light center" type="button">IMPRIMIR
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
require_once 'footer.php';

?>
