<?php 
require_once("../../../conexao.php");
@session_start();
$id_usuario = $_SESSION['id_usuario'];

//RECUPERAR O ID DA ABERTURA
$query_con = $pdo->query("SELECT * FROM caixa WHERE operador = '$id_usuario' and status = 'Aberto'");
$res = $query_con->fetchAll(PDO::FETCH_ASSOC);
$id_abertura = $res[0]['id'];

$quantidadeEstoque = "";
$novo_estoque = "";
$valor_totalF = "";
$nome = "Código não Cadastrado";
$descricao = "";
$imagem = "";
$valor = "";
$valor_total = "";
$total_vendaF = "";

$codigo = $_POST['codigo'];
$quantidade = $_POST['quantidade'];
$desconto = $_POST['desconto'];
$desconto = str_replace(',', '.', $desconto);
$valor_recebido = $_POST['valor_recebido'];
$valor_recebido = str_replace(',', '.', $valor_recebido);

$forma_pgto_input = $_POST['forma_pgto_input'];

//DEFINIR QUAL O TIPO DE PAGAMENTO E REDIRECIONAR PARA API
if($forma_pgto_input == '2'){
	//VAMOS REDIRECIONR PARA PAGAMENTO NO CRÉDITO
}

//FECHAR A VENDA SE TIVER PAGAMENTO
if($forma_pgto_input != ""){
	$troco = $_POST['valor_troco'];
	$troco = str_replace('R$', '', $troco);
	$troco = str_replace(',', '.', $troco);

	$total_compra = $_POST['total_compra'];
    $total_custo = $_POST['total_custo'];
	$total_compra = str_replace('R$', '', $total_compra);
	$total_compra = str_replace(',', '.', $total_compra);

	
	if($total_compra <= 0){
		echo 'Não é possível efetuar uma venda sem itens!';
		exit();
	}

	if($valor_recebido == ""){
		$valor_recebido = $total_compra;
	} 

//	if($desconto != ""){
//		if($desconto_porcentagem == 'Sim'){
//		$desconto = $desconto . '%';
//		}else{
//		$desconto = 'R$ '.$desconto . ',00';
//		}
//	}else{
//		$desconto = 'R$ 0,00';
//	}
    
	if($desconto == ""){
		$desconto = 0;
	}
	 
    //INSERINDO NA TABELA VENDASPDV
	$res = $pdo->prepare("INSERT INTO vendas SET total = :valor, data = curDate(), hora = curTime(),  operador = :usuario, valor_recebido = :valor_recebido, desconto = :desconto, troco = :troco, id_forma_pagamento = :forma_pgto, abertura = :abertura, status = 'Concluída', tipo = 'venda_fisica', total_custo = :total_custo, pago = 'Sim' ");
	$res->bindValue(":valor_recebido", $valor_recebido);
	$res->bindValue(":desconto", $desconto);
	$res->bindValue(":valor", $total_compra);
    $res->bindValue(":total_custo", $total_custo);
	$res->bindValue(":usuario", $id_usuario);
	$res->bindValue(":troco", $troco);
	$res->bindValue(":forma_pgto", $forma_pgto_input);
	$res->bindValue(":abertura", $id_abertura);
	$res->execute();
	$id_venda = $pdo->lastInsertId();

	//RELACIONAR OS ITENS DA VENDA COM A NOVA VENDA
	$query_con = $pdo->query("UPDATE carrinho SET id_venda = '$id_venda' WHERE id_usuario = '$id_usuario' and id_venda = 0");

	echo 'Venda Salva!&-/z'.$id_venda;
    
    //LANÇAR EM MOVIMENTAÇÕES
    $descricao = "Venda $id_venda - PDV";
    
    $res = $pdo->query("INSERT INTO movimentacoes SET tipo = 'Entrada', data = curDate(), usuario = '$id_usuario', descricao = '$descricao', valor = '$total_compra', id_mov = '$id_venda', forma_pgto = '$forma_pgto_input'");
	exit();
    
}

//INSERINDO PRODUTOS NO CARRINHO
$troco = 0;
$trocoF = 0;

if($desconto == ""){
	$desconto = 0;
}


//BUSCANDO O PRODUTO NO ESTOQUE
$query_con = $pdo->query("SELECT * FROM estoque WHERE id = '$codigo'");
$resEst = $query_con->fetchAll(PDO::FETCH_ASSOC);

//VERIFICANDO SE EXISTE NO ESTOQUE O CODIGO DIGITADO 
if(@count($resEst) > 0){
	$quantidadeEstoque = $resEst[0]['quantidade'];
    $id_produto = $resEst[0]['id_produto'];
    $id_cor = $resEst[0]['id_carac_itens_cor'];
    $id_tamanho = $resEst[0]['id_carac_itens_tamanho'];
    $vendas = $resEst[0]['vendas'];
    
    //verificando se existe a cor
    if($id_cor != null){
        $query_cor = $pdo->query("SELECT * FROM carac_itens where id = $id_cor");
        $res = $query_cor->fetchAll(PDO::FETCH_ASSOC);
        $cor = $res[0]['nome'];
    }else{
        $cor = "cor não cadastrada";
    }
    //verificando se existe o tamanho
    if($id_tamanho != null){
        $query_tam = $pdo->query("SELECT * FROM carac_itens where id = $id_tamanho");
        $res = $query_tam->fetchAll(PDO::FETCH_ASSOC);
        $tamanho = $res[0]['nome'];
    }else{
        $tamanho = "tamanho não informado";
    }
    
    
    $descricao =  $cor . ' - ' . $tamanho;
	$id_estoque = $resEst[0]['id'];
     
    //BUSCANDO OS DADOS DO PRODUTO
    $query_con2 = $pdo->query("SELECT * FROM produtos WHERE id = '$id_produto'");
    $resProd = $query_con2->fetchAll(PDO::FETCH_ASSOC);
    
	$nome = $resProd[0]['nome'];
	$imagem = $resProd[0]['imagem'];
    $promocao = $resProd[0]['promocao'];
    
    if($promocao == 'Sim'){
        $queryp = $pdo->query("SELECT * FROM promocoes where id_produto = '$id_produto' ");
        $resp = $queryp->fetchAll(PDO::FETCH_ASSOC);
        $valor = $resp[0]['valor'];
    }else{
        $valor = $resProd[0]['valor'];
    }
    
	
    $valor_custo = $resProd[0]['custo'];
    
    //VERIFICANDO SE A QUANTIDADE A VENDA É MAIOR QUE O PRODUTO EM ESTOQUE 
	if($quantidadeEstoque < $quantidade){
		echo 'Quantidade em estoque insuficiente!&-/z por enquanto temos '.$quantidadeEstoque .' produtos em estoque';
		exit();
	}

	$valor_total = $valor * $quantidade;
	$valor_totalF =  number_format($valor_total, 2, ',', '.');
    
    $valor_total_custo = $valor_custo * $quantidade;


	//INSERIR NA TABELA CARRINHO
	$res = $pdo->prepare("INSERT INTO carrinho SET id_produto = :produto, valor_unitario = :valor, id_usuario = :usuario, id_venda = '0', quantidade = :quantidade, valor_total = :valor_total, custo = :custo, id_estoque = :id_estoque, data = curDate()");
	$res->bindValue(":produto", $id_produto);
	$res->bindValue(":valor", $valor);
	$res->bindValue(":usuario", $id_usuario);
	$res->bindValue(":quantidade", $quantidade);
	$res->bindValue(":valor_total", $valor_total);
    $res->bindValue(":custo", $valor_total_custo);
    $res->bindValue(":id_estoque", $codigo);
	
	$res->execute();

 
	//ABATER OS PRODUTOS NO ESTOQUE
	$novo_estoque = $quantidadeEstoque - $quantidade;
    $vendas = $vendas + $quantidade;
	$res = $pdo->prepare("UPDATE estoque SET quantidade = :quantidade, vendas = :vendas  WHERE id = '$id_estoque'");
	$res->bindValue(":quantidade", $novo_estoque);
	$res->bindValue(":vendas", $vendas);
	$res->execute();
    
    $tipo = "Saída";
    $antes = $quantidadeEstoque;
    $depois = $novo_estoque;
    $movimento = "Venda PDV - ".$_SESSION['nome_usuario']; 
    
    //REGISTRAR NO HISTORICO 
    AddEstoqueHistorico($quantidade, $tipo, $antes, $depois, $movimento, $id_estoque, $pdo);



}




//TOTALIZAR A VENDA

$total_venda = 0;
$query_con = $pdo->query("SELECT * FROM carrinho WHERE id_usuario = '$id_usuario' and id_venda = 0 order by id desc");
$res = $query_con->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){ 
	for($i=0; $i < $total_reg; $i++){
	foreach ($res[$i] as $key => $value){	}

		
		$valor_total_item = $res[$i]['valor_total'];
		$total_venda += $valor_total_item;
        
        $valor_total_item_custo = $res[$i]['custo'];
        $valor_total_custo += $valor_total_item_custo;
		
				
	}

	if($desconto_porcentagem == 'Sim'){
		$desconto = str_replace('%', '', $desconto);
		if($desconto < 10){
			$desconto = '0.0'.$desconto;
		}else{
			$desconto = '0.'.$desconto;
		}
		
		$total_venda = $total_venda -  ($total_venda * $desconto);
	}else{
		$total_venda = $total_venda - $desconto;
	}
	
	$total_vendaF =  number_format($total_venda, 2, ',', '.');

	if($valor_recebido == ""){
		$valor_recebido = 0;
	}else{
		$troco = $valor_recebido - $total_venda;
		$trocoF =  number_format($troco, 2, ',', '.');
	}	

	
		
}


$dados = $novo_estoque .'&-/z'. $nome .'&-/z'. $descricao .'&-/z'. $imagem .'&-/z'. $valor .'&-/z'. $valor_total .'&-/z'. $valor_totalF .'&-/z'. $total_venda .'&-/z'. $total_vendaF .'&-/z'. $troco .'&-/z'. $trocoF.'&-/z'. $valor_total_custo;
	echo $dados;




 ?>
