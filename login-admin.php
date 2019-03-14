<?php
require_once 'header.php';
?>
<div class="containerLogin">
    <div id="modal-login">
        <div id="loginUsuario" class="col s12 m6">
            <center ><h5>Login Administrador</h5><div id="loginTitulo"></div></center>
            <div class="input-field col s12 ">
                <label for="email">E-mail:</label><input type="text" required name="email" id="login_email"><br/>
            </div>
            <div class="input-field col s12 ">
                <label for="senha">Senha:</label><input type="password" required name="senha" id="login_senha"><br/>
            </div>
            <input type="submit" onclick="login()" value="login" class=" blue-grey darken-4 btn">
        </div>
    </div>
</div>
<?php
require_once 'footer.php';
?>