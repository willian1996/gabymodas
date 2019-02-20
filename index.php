<?php
require_once 'header.php';
require_once 'server/conexao.php';
?>



<div id="listagemClientes">
    <div class="col s12 m6 push-m3">
        <h3 class="light">Clientes Cadastrados</h3>
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
                try{
                    $stmt = $conn->prepare("SELECT * FROM usuarios order by dataCadastro DESC"); 
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
                    <td><a href="editar.php?id=<?php echo $valor['id']; ?>" class="btn-floating orange"><i class="material-icons">edit</i></a></td>
                    
                    <td><a href="#modal<?php echo $valor['id']; ?>" class="btn-floating red modal-trigger"><i class="material-icons" >delete</i></a></td>
                    
                    <!-- Modal Structure -->
                      <div id="modal<?php echo $valor['id']; ?>" class="modal">
                        <div class="modal-content">
                          <h4>Opa!</h4>
                          <p>tem certeza que deseja excluir esse parâmetros?</p>
                        </div>
                        <div class="modal-footer">
        
                            <form action="php_action/delete.php" method="post">
                                <input type="hidden" name="id" value="<?php echo $valor['id']; ?>">
                                <button type="submit" name="btn-deletar" class="btn red">Sim, quero deletar</button>
                                
                                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
                                        
                            </form>
                        </div>
                      </div>
                    
                </tr>
                <?php 
                }
                ?>
            </tbody>
        </table>
        <br/>
        <a href="cadastro.php" class="btn">Adicionar Cliente</a>
    </div>




</div>








































<?php
require_once 'footer.php';
?>
