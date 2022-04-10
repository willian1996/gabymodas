
<!--  Modal Rel Servicos-->
<div class="modal fade" id="ModalRelServicos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Relatório de Serviços</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>



            <form action="../rel/rel_servicos.php" method="POST" target="_blank">
                <div class="modal-body">

                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>


                    </div>

                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Concluídos</label>
                            <select class="form-control" name="status" >
                                <option value="">Todos</option>
                                <option value="Não">Não</option>
                                <option value="Sim">Sim</option>
                            </select>
                        </div>


                    </div>

                </div>     

            </div>
            <div class="modal-footer">

                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>





<!--  Modal Rel Orc-->
<div class="modal fade" id="ModalRelOrc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Relatório de Orçamentos</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>



            <form action="../rel/rel_orcamentos.php" method="POST" target="_blank">
                <div class="modal-body">

                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>


                    </div>

                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Status</label>
                            <select class="form-control" name="status" >
                                <option value="">Todos</option>
                                <option value="Aberto">Aberto</option>
                                <option value="Aprovado">Aprovado</option>
                                <option value="Concluído">Concluído</option>
                            </select>
                        </div>


                    </div>

                </div>     

            </div>
            <div class="modal-footer">

                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>





<!--  Modal Rel Mov-->
<div class="modal fade" id="ModalRelMov" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Relatório de Movimentações</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>



            <form action="../rel/rel_mov.php" method="POST" target="_blank">
                <div class="modal-body">

                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>


                    </div>

                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Status</label>
                            <select class="form-control" name="status" >
                                <option value="">Todos</option>
                                <option value="Entrada">Entrada</option>
                                <option value="Saída">Saída</option>
                               
                            </select>
                        </div>


                    </div>

                </div>     

            </div>
            <div class="modal-footer">

                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>





<!--  Modal Rel Pagar-->
<div class="modal fade" id="ModalRelPagar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Contas à Pagar</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>



            <form action="../rel/rel_pagar.php" method="POST" target="_blank">
                <div class="modal-body">

                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>


                    </div>

                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Pago</label>
                            <select class="form-control" name="status" >
                                <option value="">Todas</option>
                                <option value="Sim">Sim</option>
                                <option value="Não">Não</option>
                               
                            </select>
                        </div>


                    </div>

                </div>     

            </div>
            <div class="modal-footer">

                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>







<!--  Modal Rel Receber-->
<div class="modal fade" id="ModalRelReceber" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Contas à Receber</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>



            <form action="../rel/rel_receber.php" method="POST" target="_blank">
                <div class="modal-body">

                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>


                    </div>

                    <div class="col-md-4">

<!--
                        <div class="form-group">
                            <label >Pago</label>
                            <select class="form-control" name="status" >
                                <option value="">Todas</option>
                                <option value="Sim">Sim</option>
                                <option value="Não">Não</option>
                               
                            </select>
                        </div>
-->


                    </div>

                </div>     

            </div>
            <div class="modal-footer">

                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>







<!--  Modal Rel Compras-->
<div class="modal fade" id="ModalRelCompras" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Relatório de Compras</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>



            <form action="../rel/rel_compras.php" method="POST" target="_blank">
                <div class="modal-body">

                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-4">

                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>


                    </div>

                   

                </div>     

            </div>
            <div class="modal-footer">

                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>

<!--  Modal Rel Vendas-->
<div class="modal fade" id="ModalRelVendas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Relatório de Vendas x Lucro</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>



            <form action="../rel/rel_vendas.php" method="POST" target="_blank">
                <div class="modal-body">

                 <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>


                    </div>
  
                </div>     

            </div>
            <div class="modal-footer">

                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>


<!--  Modal Rel Encomendas-->
<div class="modal fade" id="ModalRelEncomendas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Relatório de Encomendas</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div> 
            <form action="../rel/rel_encomendas.php" method="POST" target="_blank">
                <div class="modal-body">
                 <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label >Data Inicial</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataInicial" >
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label >Data Final</label>
                            <input value="<?php echo date('Y-m-d') ?>" type="date" class="form-control"  name="dataFinal" >
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label >Fornecedor</label>
                            <select class="form-select" aria-label="Default select example" name="pedidofornecedor" id="pedidofornecedor" required>
                                <option value="">Selecione</option>
                                <?php 
                                $query = $pdo->query("SELECT * from fornecedores order by id asc");
                                $res = $query->fetchAll(PDO::FETCH_ASSOC);
                                $total_reg = @count($res);
                                if($total_reg > 0){ 
                                    for($i=0; $i < $total_reg; $i++){
                                    foreach ($res[$i] as $key => $value){ }
                                        ?>
                                    <option value="<?php echo $res[$i]['id'] ?>"><?php echo $res[$i]['nome'] ?></option>
                                    <?php }
                                }else{ 
                                    echo '<option value="">Cadastre um fornecedor</option>';
                                } ?>
                
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label >Status</label>
                            <select class="form-select" aria-label="Default select example" name="pedidostatus" id="pedidostatus" required>
                                <option value="">Selecione</option>
                                <option value="Comprado">Comprado</option>
                                <option value="Encomendado">Encomendado</option>
                                <option value="Concluido">Concluido</option>
                            
                            </select>
                        </div>
                    </div>
                </div>     
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Gerar Relatório</button>
            </div>
        </form>


    </div>
</div>
</div>

