<?php
    require_once 'header.php'; 
?>


<!---------------formulario----------------->
<div id="formaulario-de-contato" >
    <div class="col s12 m12 l6">
        <div class="card-panel">
          <h5 class="header2">Cadastre-se</h5>
          <div class="row">
            <form id="form-dados"  class="col s12" action="server/cadastro-backend.php" method="post">
                <!--nome completo-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">person_pin</i>
                        <input placeholder="Nome Completo*" name="nome_completo"  type="text" required>
                    </div>
                </div>
                <!--numero de whatsapp-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">phone_android</i>
                        <input class="telefone" placeholder="whatsapp* (o mesmo do pedido)" name="whatsapp" type="tel" maxlength="12" required>
                    </div>
                </div>
                <!--Rua-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">location_on</i>
                        <input placeholder="Rua (endereço)*" name="rua" type="text" required>
                    </div>
                </div>
                <!--Numero da casa-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">home</i>
                        <input placeholder="Número da casa*" name="numeroCasa" type="text" maxlength="5" required>
                    </div>
                </div>
                <!-- Ponto de referencia -->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">location_searching</i>
                        <input placeholder="Ponto de Referência" name="pontoDeReferencia" type="text">
                    </div>
                </div>
                <!--Bairro-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">domain</i>
                        <input placeholder="Bairro*" name="bairro" type="text" required>
                    </div>
                </div>
                <!--Cidade-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">location_city</i>
                        <input placeholder="Cidade*" name="cidade"  type="text" required>
                    </div>
                </div>
                <!--CEP-->
                <div class="row">
                    <div class="input-field col s12">
                        <img src="img/endereco-cep.png"/>
                        <input class="cep" placeholder="CEP (opcional)" name="cep" type="text">
                    </div>
                </div>
                <!--Telefone 1-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">phone</i>
                        <input class="telefone" placeholder="Telefone 1 (opcional)" name="telefone1" maxlength="12" type="tel">
                    </div>
                </div>
                <!--Telefone 2-->
                <div class="row">
                    <div class="input-field col s12">
                        <i class="small material-icons">phone</i>
                        <input class="telefone" placeholder="Telefone 2 (opcional)" name="telefone2" maxlength="12" type="tel">
                    </div>
                </div>
                <!----Botão enviar---->
                <div class="row">
                    <div class="input-field col s12">
                        <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Enviar
                        </button>
                    </div>
                </div>
            </form>
          </div>
        </div>
    </div>
</div>

<?php
require_once 'footer.php';


?>


