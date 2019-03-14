<?php
session_start();
if(!isset($_SESSION['id_admin'])){
    header("Location: login-admin.php");
}
require_once 'header.php';
require_once 'server/conexao.php';
require_once 'server/estatistica.php';
?>
<div class="botaoLogout"><a href="server/logout.php"class="btn-floating black modal-trigger"><i class="material-icons" >cancel</i></a></div>
<div class="estatistica">
    <h5>Estatísticas</h5>
    <p>Caraguatatuba: <?php echo caraguatatuba($conn); ?></p>
    <p>São Sebastião: <?php echo saoSebastiao($conn); ?></p>
    <p>Ilha Bela: <?php echo ilhaBela($conn); ?></p>
    <p>Ubatuba: <?php echo ubatuba($conn); ?></p>
    <p><b>Total: <?php echo total($conn); ?></b></p>
</div>
<div id="listagemClientes">
    <div class="col s12 m6 push-m3">
        <h3 class="light">Clientes Cadastrados</h3>
        <!--filtro pesquisar cliente-->
        <form method="get" action="">
            <strong class="textoPesquisa">Pesquisar por</strong>
                <select name="opcao" class="select">
                    <option value="whatsapp" selected>Whatsapp</option>
                    <option value="nome_completo">Nome</option>
                </select>
                <input  class="campoPesquisa" type="text" name="filtro"  required/>
            <input class="botaoPesquisa"  type="submit" value="Pesquisar"/>
        </form>
        <table class="striped">
            <thead>
                <tr>
                    <th>Data de cadastro: </th>
                    <th>Nome completo:</th>
                    <th>Cidade: </th>
                    <th>Whatsapp:</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $opcao =isset($_GET['opcao'])?$_GET['opcao']:"whatsapp";
                $filtro = isset($_GET['filtro'])?$_GET['filtro']:"";
                $filtro = addslashes($filtro);
                try{
                    $stmt = $conn->prepare("SELECT * FROM clientes where $opcao like '%$filtro%' order by dataCadastro DESC"); 
                    $stmt->execute();
                    $resultado = $stmt->fetchAll(); 
                }catch(PDOException $e){
                    echo $e->getMessage();
                }
                foreach($resultado as $valor){
                ?>
                <tr>
                    <td><?php echo date('d/m/Y H:i',strtotime($valor['dataCadastro'])); ?></td>
                    <td><?php echo $valor['nome_completo']; ?></td>
                    <td><?php echo $valor['cidade']; ?></td>
                    <td><strong class="telefone"><?php echo $valor['whatsapp']; ?></strong></td>
                    <td><a href="info-cliente.php?id=<?php echo $valor['id']; ?>" class="btn-floating orange"><i class="material-icons">folder_shared</i></a></td>
                    <td><a href="#modal<?php echo $valor['id']; ?>" class="btn-floating red modal-trigger"><i class="material-icons" >delete</i></a></td>
                    <!-- Modal Structure -->
                      <div id="modal<?php echo $valor['id']; ?>" class="modal">
                        <div class="modal-content">
                          <h4>Opa!</h4>
                          <p>tem certeza que deseja excluir este cliente?</p>
                        </div>
                        <div class="modal-footer"> 
                            <button name="btn-deletar" onclick="excluirCliente(<?php echo $valor['id']; ?>)" class="btn red">Sim, quero deletar</button>
                            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a> 
                        </div>
                      </div>
                </tr>
                <?php 
                }
                ?>
            </tbody>
        </table>
        <br/>
    </div>
</div>
<?php
require_once 'footer.php';
?>