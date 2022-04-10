<?php 
require_once("../../../conexao.php"); 

$id_venda = $_GET['id'];

 

$query_v = $pdo->query("SELECT * FROM vendas where id = '$id_venda' ");
$res_v = $query_v->fetchAll(PDO::FETCH_ASSOC);
$id_usu = $res_v[0]['id_usuario'];
$data = implode('/', array_reverse(explode('-', $res_v[0]['data'])));

$query_u = $pdo->query("SELECT * FROM usuarios where id = '$id_usu' ");
$res_u = $query_u->fetchAll(PDO::FETCH_ASSOC);
$cpf_usu = $res_u[0]['cpf'];

$query = $pdo->query("SELECT * FROM clientes where cpf = '$cpf_usu' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

$nome = $res[0]['nome'];
$cpf = $res[0]['cpf'];
$telefone = $res[0]['telefone'];
$rua = $res[0]['rua'];
$numero = $res[0]['numero'];
$cep = $res[0]['cep'];
$bairro = $res[0]['bairro'];
$cidade = $res[0]['cidade'];
$estado = $res[0]['estado'];
$email_cli = $res[0]['email'];
$complemento = $res[0]['complemento'];
$status = $res_v[0]['status'];
$pago = $res_v[0]['pago'];
$quantidadeTotal = 0;


?>
<style type="text/css">
    * {
        -webkit-print-color-adjust: exact;
    }
    .td-res {
        background-color: #f0f0f0;
    }
    th.force-w {
        width: 270px !important;
    }
    @media  print {
        .thead-light, .table .thead-light th {
            background-color: #e9ecef !important;
        }
        .td-res {
            background-color: #f0f0f0;
        }
    }
</style>
<div class="container my-4">
    <div class="row">
        <div class="col-4">
            <img class="img-fluid" src="https://www.escoladeecommerce.com/ferramentas/images/correios.png">
        </div>
        <div class="col-8">
            <h2 class="text-right">Declaração de Conteúdo</h2>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12">
            <div class="card">
                <table class="table table-sm m-0">
                    <tbody>
                        <tr>
                            <th class="force-w">Remetente:</th>
                            <td colspan="3">
                                <?php echo $nome_loja; ?>                        
                            </td>
                        </tr>
                        <tr>
                            <th class="force-w">CPF/CNPJ:</th>
                            <td colspan="3">
                                <?php echo $cnpj_sistema; ?>                            
                            </td>
                        </tr>
                        <tr>
                            <th>Endereço:</th>
                            <td colspan="3">
                                <?php echo $endereco_loja.' - '.$estado_loja ?>                            
                            </td>
                        </tr>
                        <tr>
                            <th>Cidade/UF:</th>
                            <td>
                                <?php echo $cidade_loja; ?>                           
                            </td>
                            <th>CEP:</th>
                            <td>
                                <?php echo $cep_origem; ?>                           
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12">
            <div class="card">
                <table class="table table-sm m-0">
                    <tbody>
                        <tr>
                            <th class="force-w">Destinatário:</th>
                            <td colspan="3">
                                <?php echo $nome; ?>                            
                            </td>
                        </tr>
                        <tr>
                            <th class="force-w">CPF/CNPJ:</th>
                            <td colspan="3">
                                <?php echo $cpf; ?>                            
                            </td>
                        </tr>
                        <tr>
                            <th>Endereço:</th>
                            <td colspan="3">
                                <?php echo $rua.', '.$numero.', '.$bairro; ?>                           
                            </td>
                        </tr>
                        <tr>
                            <th>Cidade/UF:</th>
                            <td>
                                <?php echo $cidade .' - '. $estado; ?>                            
                            </td>
                            <th>CEP:</th>
                            <td>
                                <?php echo $cep; ?>                            
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12">
            <table class="table table-sm table-bordered m-0">
                <thead>
                    <tr class="thead-light">
                        <th colspan="3" class="text-center">Identificação dos Bens</th>
                    </tr>
                    <tr>
                        <th class="text-center">Discriminação do Conteúdo</th>
                        <th class="text-center">Quantidade</th>
                        <th class="text-center">Valor</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                //PEGANDO OS ITENS DO CARRINHO 
                $res = $pdo->query("SELECT * from carrinho where id_venda = '$id_venda' ");
                $dados = $res->fetchAll(PDO::FETCH_ASSOC);

                for ($i=0; $i < count($dados); $i++) { 
                    foreach ($dados[$i] as $key => $value) {
                    }

                    $id_produto = $dados[$i]['id_produto'];
                    $id_carrinho = $dados[$i]['id'];	
                    $combo = $dados[$i]['combo'];
                    $quantidade = $dados[0]['quantidade'];

                    if($combo != 'Sim'){
                        $res2 = $pdo->query("SELECT * from produtos where id = '$id_produto' ");
                        $dados2 = $res2->fetchAll(PDO::FETCH_ASSOC);
                        $promocao = $dados2[0]['promocao'];
                    }else{
                        $res2 = $pdo->query("SELECT * from combos where id = '$id_produto' ");
                    }

                    if($promocao == 'Sim'){
                        $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id_produto' ");
                        $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
                        $valor = $resp[0]['valor'];

                    }else{
                        $valor = $dados2[0]['valor'];
                    }


                    $nome_produto = $dados2[0]['nome'];

                    $sub_total_item = $quantidade * $valor;
                    $imagem = $dados2[0]['imagem'];
                    $codigo = $dados2[0]['descricao_longa'];
                    $quantidadeTotal += $quantidade;

                    $sub_total = number_format( $sub_total_item , 2, ',', '.');
                    $valor = number_format( $valor , 2, ',', '.');
                    
                    ?>
                    <tr>
                        <td class="text-center">
                            <?php echo $nome_produto; ?>                        
                        </td>
                        <td class="text-center">
                            <?php echo $quantidade; ?>                        
                        </td>
                        <td class="text-center">
                            <?php echo $sub_total; ?>                        
                        </td>
                    </tr>
                    <?php

                    }

                    ?>
                    <tr>
                        <td class="text-right td-res font-weight-bold">Totais</td>
                        <td class="text-center">
                            <?php echo $quantidadeTotal; ?>                     
                        </td>
                        <td class="text-center">
                            R$ <?php echo number_format($res_v[0]['sub_total'] , 2, ',', '.') ?>                       
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right td-res font-weight-bold"> Peso Total (kg)</td>
                        <td class="text-right" colspan="2"></td>
                    </tr>
                 </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table table-sm table-bordered m-0">
                <thead class="thead-light">
                    <tr>
                        <th class="text-center">Declaração</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="p-2">
                            <small>
                                Declaro ainda que não estou postando conteúdo inflamável, explosivo, causador de
                                combustão espontânea, tóxico, corrosivo, gás ou
                                qualquer outro conteúdo que constitua perigo, conforme o art. 13 da Lei Postal nº
                                6.538/78.
                            </small><br>
                            <small>
                                Declaro que não me enquadro no conceito de contribuinte previsto no art. 4º da Lei
                                Complementar nº 87/1996, uma vez que não realizo,
                                com habitualidade ou em volume que caracterize intuito comercial, operações de
                                circulação de mercadoria, ainda que se iniciem no exterior,
                                ou estou dispensado da emissão da nota fiscal por força da legislação tributária
                                vigente, responsabilizando-me, nos termos da lei e a quem de
                                direito, por informações inverídicas.
                            </small>
                            <br><br>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-3 p-0">
                                        <p class="m-0 text-center" style="border-bottom: 1px solid #000;float:left;width:95%">
                                            <?php echo $cidade_loja; ?>                                        
                                        </p>,
                                    </div>
                                    <div class="col-1 p-0">
                                        <p class="m-0 text-center" style="border-bottom: 1px solid #000;float:left;width:65%">
                                            <?php echo date('d') ?>                                        
                                        </p> de
                                    </div>
                                    <div class="col-2 p-0">
                                        <p class="m-0 text-center" style="border-bottom: 1px solid #000;float:left;width:75%;">
                                            <?php echo $mes_extenso[date('M')];  ?>                                        
                                        </p> de
                                    </div>
                                    <div class="col-1 p-0">
                                        <p class="m-0 text-center" style="border-bottom: 1px solid #000;">
                                            <?php echo date('Y') ?>                                        
                                        </p>
                                    </div>
                                    <div class="col-5">
                                        <p class="m-0" style="border-bottom: 1px solid #000;">&nbsp;</p>
                                        <p class="m-0 text-center">Assinatura do<br>Declarante/Remetente</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <table class="table table-sm m-0">
                    <thead>
                        <tr>
                            <td style="border-top:0px;" colspan="2"><strong>Atenção:</strong> O declarante/remetente é
                                responsável exclusivamente pelas informações declaradas.</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2">Observações:</td>
                        </tr>
                        <tr>
                            <td style="border-top:0px;"><small>Constitui crime contra a ordem tributária suprimir ou
                                    reduzir tributo, ou contribuição social e qualquer acessório (Lei 8.137/90 Art. 1o,
                                    V).</small></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
<script>
    window.print();
</script>