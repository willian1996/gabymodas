<?php
    require_once 'header.php'; 
?>
<div id="sessaoSucesso">
    <div class="col s12 m12 l6">
        <div class="card-panel">
          <h5 class="header2">Confira seus dados</h5>
            <div id="dadosCliente" class="row">
                <?php
                $id = $_GET['id'];
                $whatsapp = $_GET['whatsapp'];
                require 'server/conexao.php';
                try{
                    $stmt = $conn->prepare("SELECT * FROM usuarios WHERE (id = '$id') and (whatsapp = '$whatsapp')"); 
                    $stmt->execute();
                    $resultado = $stmt->fetchAll(); 
                } catch(PDOException $e){
                    echo $e->getMessage();
                }
                foreach($resultado as $valor){
                ?> 
                
                
                <p>Nome: <?php echo $valor['nome_completo']; ?></p>
                <p>Whatsapp: <?php echo $valor['whatsapp'];   ?></p>
                <p>Rua: <?php echo $valor['rua'];   ?></p>
                <p>Número: <?php  echo $valor['numeroCasa'];  ?></p>
                <p>Ponto de Referência: <?php  echo $valor['pontoDeReferencia'];  ?></p>
                <p>Bairro: <?php echo $valor['bairro'];   ?></p>
                <p>Cidade: <?php echo $valor['cidade'];   ?></p>
                <p>CEP: <?php echo $valor['cep'];   ?></p>
                <p>Telefone 1: <?php echo $valor['telefone1'];   ?></p>
                <p>Telefone 2: <?php echo $valor['telefone2'];  ?></p>
                <?php
                }
                ?>
            </div>
            
            <div class="row">
                <div class="input-field col s12">
                    <button class="btn cyan waves-effect waves-light center" type="button">Copiar Link
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
require_once 'footer.php';

?>
