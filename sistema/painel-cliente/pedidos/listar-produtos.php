
<?php 

require_once("../../../conexao.php"); 

$id_venda = $_POST['idvenda'];

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


?>

<span><b>*Pedido: <?php echo $id_venda." Data: ".$data ?>*</b></span><br><br>
<span><b>Nome: </b><?php echo $nome ?> </span><br>
<span><b>CPF: </b> <?php echo $cpf ?></span><br>
<span><b>Whatsapp: </b> <a href="https://api.whatsapp.com/send?phone=55<?php echo $telefone."&text=Oi%20$nome%20" ?>" target="_blank"><?php echo $telefone ?></a></span><BR>
<span><b>Endereço:</b> <?php echo $rua ?> </span><br>
<span><b>Número: </b> <?php echo $numero ?></span><br>
<span><b>Bairro: </b> <?php echo $bairro ?></span><br>
<span><b>Cidade: </b> <?php echo $cidade."-".$estado ?></span><br>
<span><b>CEP: </b> <?php echo $cep ?></span><br>
<span><b>Ponto de referência: </b> <?php echo $complemento; ?></span>
<br>-----------------------------------------<br>



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
}else{
	$res2 = $pdo->query("SELECT * from combos where id = '$id_produto' ");
}



$dados2 = $res2->fetchAll(PDO::FETCH_ASSOC);
$nome_produto = $dados2[0]['nome'];
$valor = $dados2[0]['valor'];
$sub_total_item = $quantidade * $valor;
$imagem = $dados2[0]['imagem'];
$codigo = $dados2[0]['descricao_longa'];

$sub_total = number_format( $sub_total_item , 2, ',', '.');
$valor = number_format( $valor , 2, ',', '.');
                          
//echo '<td><img src="../../img/produtos/'. $imagem .'" width="50"> </td>';

echo '<span><b>'.$nome_produto.'</b></span><br>';
    

    
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

echo '<u><i><small><span class="mr-2 ml-2"><i class="mr-1 fa fa-check text-info"></i>'.$nome_carac.' : '.$nome_item_carac.'</span></small></i></u><br>';

	  }
} 

echo '<span><b>Valor </b>R$'.$sub_total_item.'</span>';
echo "<br>-----------------------------------------<br>";

}

echo '<h6><b>Subtotal</b> - R$ '.$res_v[0]['sub_total'].'</h6>';
echo '<h6><b>Frete</b> - A combinar</h6>';
echo '<h6><b>Taxa cartão</b> - R$ '.$res_v[0]['taxas'].'</h6>';
echo '<h6><b>Pgto </b> - '.$res_v[0]['meio_pagamento'].'</h6><br>';
echo '<h6><b>*Total - R$ '.$res_v[0]['total'].'*</b></h6>';

?>


