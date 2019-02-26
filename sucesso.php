<?php
require_once 'header.php'; 
$id = $_GET['id'];
$whatsapp = $_GET['whatsapp'];
?>
<div id="sessaoSucesso">
    <div class="col s12 m12 l6">
        <div class="card-panel">
          <h5 class="header2">Cadastro Finalizado!</h5>
            <div id="dadosCliente" class="row">
                <?php
                
                require 'server/conexao.php';
                try{
                    $stmt = $conn->prepare("SELECT * FROM clientes WHERE (id = '$id') and (whatsapp = '$whatsapp')"); 
                    $stmt->execute();
                    $resultado = $stmt->fetchAll(); 
                } catch(PDOException $e){
                    echo $e->getMessage();
                }
                foreach($resultado as $valor){
                ?> 
                
                
                <p>Nome: <?php echo $valor['nome_completo']; ?></p>
                <p>Whatsapp: <strong class="telefone"><?php echo $valor['whatsapp'];   ?></strong></p>
                <p>Rua: <?php echo $valor['rua'];   ?></p>
                <p>Número: <?php  echo $valor['numeroCasa'];  ?></p>
                <p>Ponto de Referência: <?php  echo $valor['pontoDeReferencia'];  ?></p>
                <p>Bairro: <?php echo $valor['bairro'];   ?></p>
                <p>Cidade: <?php echo $valor['cidade'];   ?></p>
                <p>CEP: <?php echo $valor['cep'];   ?></p>
                <p>Telefone 1: <strong class="telefone"> <?php echo $valor['telefone1'];   ?></strong></p>
                <p>Telefone 2: <strong class="telefone"> <?php echo $valor['telefone2'];  ?></strong></p>
                <?php
                }
                ?>
            </div>
            <p class="paragrafoCopiarLink">Agora clique no botão "COPIAR LINK" e envie o link do seu cadastro para o whatsapp (12)98181-9956 para identificarmos o seu cadastro</p>
            <br>

            
            <input type="text" id="urlColado">
            
            
            <div class="row">
                <div class="input-field col s12">
                    <button class="btn cyan waves-effect waves-light center"  onclick="copiarURL()" type="button">Copiar Link
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
require_once 'footer.php';

?>
