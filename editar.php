<?php
session_start();
if(!isset($_SESSION['id_admin'])){
    header("Location: login-admin.php");
}
require_once 'header.php';
$id = $_GET['id'];
require 'server/conexao.php';
?>
<!---------------formulario----------------->
<div id="formulario-de-editar" >
    <div class="col s12 m12 l6">
        <div class="card-panel">
          <h5 class="header2">Cadastre-se</h5>
          <div class="row">
            <?php
            try{
                $stmt = $conn->prepare("SELECT * FROM clientes WHERE (id = '$id')"); 
                $stmt->execute();
                $resultado = $stmt->fetchAll(); 
            } catch(PDOException $e){
                echo $e->getMessage();
            }
            foreach($resultado as $valor){
            ?> 
            <form id="form-dados"  class="col s12" action="server/editar-backend.php" method="post">
                <input type="hidden" name="id" value="<?php echo $valor['id'] ?>">
                <!--nome completo-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">person_pin</i>
                        <input placeholder="Nome Completo*" name="nome_completo" value="<?php echo $valor['nome_completo']; ?>" type="text" required>
                    </div>
                </div>
                <!--numero de whatsapp-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">phone_android</i>
                        <input class="telefone" placeholder="whatsapp* (o mesmo do pedido)" value="<?php echo $valor['whatsapp']; ?>" name="whatsapp" type="tel" maxlength="12" required>
                    </div>
                </div>
                <!--Rua-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">location_on</i>
                        <input placeholder="Rua (endereço)*" name="rua" value="<?php echo $valor['rua']; ?>" type="text" required>
                    </div>
                </div>
                <!--Numero da casa-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">home</i>
                        <input placeholder="Número da casa*" name="numeroCasa" value="<?php echo $valor['numeroCasa']; ?>" type="text" maxlength="5" required>
                    </div>
                </div>
                <!-- Ponto de referencia -->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">location_searching</i>
                        <input placeholder="Ponto de Referência" name="pontoDeReferencia" value="<?php echo $valor['pontoDeReferencia'] ?>" type="text">
                    </div>
                </div>
                <!--Bairro-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">domain</i>
                        <input placeholder="Bairro*" name="bairro" value="<?php echo $valor['bairro']; ?>" type="text" required>
                    </div>
                </div>
                <!--Cidade-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">location_city</i>
                        <select name="cidade" required>
                            <option value="<?php echo $valor['cidade']; ?>"><?php echo $valor['cidade']; ?></option>
                            <option value="Caraguatatuba">Caraguatatuba</option>
                            <option value="Sao Sebastiao">São Sebastião</option>
                            <option value="Ubatuba">Ubatuba</option>
                            <option value="Ilha Bela">Ilha Bela</option>
                        </select>
                    </div>
                </div>
                <!--CEP-->
                <div class="row">
                    <div class="input-field col s12">
                        <img src="img/endereco-cep.png"/>
                        <input class="cep" placeholder="CEP (opcional)" name="cep" value="<?php echo $valor['cep']; ?>" type="text">
                    </div>
                </div>
                <!--Telefone 1-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">phone</i>
                        <input class="telefone" placeholder="Telefone 1 (opcional)" name="telefone1" value="<?php echo $valor['telefone1']; ?>" maxlength="12" type="tel">
                    </div>
                </div>
                <!--Telefone 2-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">phone</i>
                        <input class="telefone" placeholder="Telefone 2 (opcional)" name="telefone2" value="<?php echo $valor['telefone2'] ?>" maxlength="12" type="tel">
                    </div>
                </div>
                <!----Botão enviar---->
                <div class="row">
                    <div class="input-field col s12">
                        <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Atualizar
                        </button>
                    </div>
                </div>
            </form>
            <?php
            } 
            ?>
          </div>
        </div>
    </div>
</div>
<?php
require_once 'footer.php';
?>