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


?>


<style type="text/css">
	*{
	margin:0px;
	padding:5px;
	background-color:#f7fccc;

}
.text {
	&-center { text-align: center; }
}
.ttu { text-transform: uppercase;
	font-weight: bold;
	font-size: 1.2em;
 }

.printer-ticket {
	display: table !important;
	width: 100%;
	max-width: 400px;
	font-weight: light;
	line-height: 1.3em;
	padding: 5px;
	font-family: Tahoma, Geneva, sans-serif; 
	font-size: 12px; 
	
	
	
	}
	
	th { 
		font-weight: inherit;
		padding:5px;
		text-align: center;
		border-bottom: 1px dashed #BCBCBC;
	}

	

	
	
		
	.cor{
		color:#BCBCBC;
	}
	
	
	.title { font-size: 1.5em;  }

	.margem-superior{
		padding-top:25px;
	}
	
	
}
</style>



<table class="printer-ticket">

	<tr>
		<th class="title" colspan="3">Pedido <?php echo $id_venda ?></th>

	</tr>
	<tr>
		<th colspan="3"><?php echo $data ?></th>
	</tr>
    <tr>
		<th class="ttu margem-superior" colspan="3">
			<?php echo $nome ?>
		</th>
	</tr>
	<tr>
		<th colspan="3">
            CPF <?php echo $cpf ?> <br />
			WhatsApp <?php echo $telefone ?> <br />
			Endereço <?php echo $rua .', '. $numero ?> <br />
			 <b><?php echo $bairro .' - '. $cidade ?></b> <br />
             <?php echo $cep ?> <br />
            Ponto de referência <?php echo $complemento ?> <br />
		</th>
	</tr>
	
	
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

                    $sub_total = number_format( $sub_total_item , 2, ',', '.');
                    $valor = number_format( $valor , 2, ',', '.');

                    //echo '<td><img src="../../img/produtos/'. $imagem .'" width="50"> </td>';
                    ?>
                    <tr>
                        <td colspan="2" width="50%"><?php echo $quantidade ?> - <?php echo $nome_produto ?> <br>
					   
                    
                    <?php

                    $query_c = $pdo->query("SELECT * from carac_prod where id_prod = '$id_produto'");
                    $res_c = $query_c->fetchAll(PDO::FETCH_ASSOC);
                    $total_prod_carac = @count($res_c);


                    if($total_prod_carac > 0){
                        $query4 = $pdo->query("SELECT * from carac_itens_car where id_carrinho = '$id_carrinho'");
                        $res4 = $query4->fetchAll(PDO::FETCH_ASSOC);

                        for ($i2=0; $i2 < count($res4); $i2++) { 
                            foreach ($res4[$i2] as $key => $value) {
                            }

                            $nome_item_carac = $res4[$i2]['nome'];
                            $id_carac = $res4[$i2]['id_carac'];

                            $query1 = $pdo->query("SELECT * from carac where id = '$id_carac' ");
                            $res1 = $query1->fetchAll(PDO::FETCH_ASSOC);
                            $nome_carac = $res1[0]['nome'];

                            echo $nome_carac.' : '.$nome_item_carac ;

                        }
                    } 
                    ?>
                </td>
                <td align="right">
                        
                     <?php echo $sub_total; ?>   
                </td>
            </tr>
                
                    <?php

                }

            ?>
                            
		
	</tbody>
	<tfoot>

		<tr>
			<td colspan="3" class="cor">
				--------------------------------------------------------------------------------------------------------------------------------------------------------------
			</td>
		</tr>

		 
		<tr>
			<td colspan="2">Subtotal</td>
			<td align="right">R$ <?php echo number_format($res_v[0]['sub_total'] , 2, ',', '.') ?></td>
		</tr>
		<tr>
			<td colspan="2">Taxa cartão </td>
			<td align="right">R$ <?php echo number_format($res_v[0]['taxas'] , 2, ',', '.') ?></td>
		</tr>

		<tr>
			<td colspan="2">Frete</td>
			<td align="right">A combinar</td>
		</tr>

		

		<tr>
			<td colspan="3" class="cor">
				--------------------------------------------------------------------------------------------------------------------------------------------------------------
			</td>
		</tr>

		<tr>
			<td align="center" class="ttu" colspan="3">
				Total R$ <?php echo number_format($res_v[0]['total'] , 2, ',', '.') ?>
			</td>

		</tr>

		<tr> 
			<td colspan="3" class="cor">
				--------------------------------------------------------------------------------------------------------------------------------------------------------------
			</td>
		</tr>

		<tr>
			<td colspan="2">Forma de Pagamento</td>
			<td align="right"><?php echo $res_v[0]['meio_pagamento'] ?></td>
		</tr>

			

		<tr>
			<td colspan="3" class="cor">
				--------------------------------------------------------------------------------------------------------------------------------------------------------------
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="center">
				
			</td>
		</tr>
	</tfoot>
</table>