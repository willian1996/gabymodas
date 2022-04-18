<?php  
  
require_once("conexao.php");
@session_start();
$id_usuario = @$_SESSION['id_usuario'];
 
//PEGANDO DADOS DA VENDA
$total = isset($_POST['total_compra'])?$_POST['total_compra']:"";
$total = str_replace(',', '.', $total);
$total_custo = isset($_POST['total_custo'])?$_POST['total_custo']:"";
$total_custo = str_replace(',', '.', $total_custo);
$valor_frete = isset($_POST['vlr_frete'])?$_POST['vlr_frete']:"";

$tem_frete = isset($_POST['existe_frete'])?$_POST['existe_frete']:"";
$antigo = isset($_POST['antigo'])?$_POST['antigo']:"";
@$sub_total = @$total - @$valor_frete;

//PEGANDO DADOS DO USUARIO
$nome = isset($_POST['nome'])?$_POST['nome']:"";
$cpf = isset($_POST['cpf'])?$_POST['cpf']:"";
$cpf = removeMascCPF($cpf);
$email = isset($_POST['email'])?$_POST['email']:"";
$telefone = isset($_POST['telefone'])?$_POST['telefone']:"";
$telefone = removeMascTel($telefone);
$rua = isset($_POST['rua'])?$_POST['rua']:"";
$numero = isset($_POST['numero'])?$_POST['numero']:"";
$bairro = isset($_POST['bairro'])?$_POST['bairro']:"";
$complemento = isset($_POST['complemento'])?$_POST['complemento']:""; 
$cep = isset($_POST['cep'])?$_POST['cep']:"";
$cidade = isset($_POST['cidade'])?$_POST['cidade']:"";
$estado = isset($_POST['estado'])?$_POST['estado']:"";
$local = isset($_POST['local'])?$_POST['local']:"";
$comentario = "";


//VERIFICANDO QUAL FOI A FORMA DE PAGAMENTO

if($cobrarTaxaPagamentoOnline == "Sim"){
    $TipoTaxaCartao = isset($_POST['tipotaxacartao'])?$_POST['tipotaxacartao']:"";
    if(!is_numeric($TipoTaxaCartao)){
        echo 'Escolha a forma de pagamento!';
        exit();
    }elseif($TipoTaxaCartao == 0){
        $taxaCartao = 0;
        $meioPagamento = "Dinheiro/ PIX";

    }elseif($TipoTaxaCartao == 4){
        $taxaCartao = $total * 4 / 100;
        $total += $taxaCartao;
        $meioPagamento = "Débito";

    }elseif($TipoTaxaCartao == 5){
        $taxaCartao = $total * 5 / 100;
        $total += $taxaCartao;
        $meioPagamento = "Crédito 1x";

    }elseif($TipoTaxaCartao == 6){
        $taxaCartao = $total * 6 / 100;
        $total += $taxaCartao;
        $meioPagamento = "Crédito 2x";

    }elseif($TipoTaxaCartao == 7){
        $taxaCartao = $total * 7 /100;
        $total += $taxaCartao;
        $meioPagamento = "Crédito 3x";
    }else{
        echo "Erro ao calcular a taxa de cartão!";
        exit();
    }    
    
}else{
    $meioPagamento = "";
    $taxaCartao = "";
} 




if($local != ""){
	$status_venda = 'Retirada';
}else{
	$status_venda = 'Comprado';
}


//if($tem_frete == 'Sim' && $local == ""){
//	if($valor_frete == '0' || $valor_frete == ""){
//		echo ' Selecione um CEP válido para o Frete!';
//		exit();
//	}
//}

//VERIFICANDO O NOME
if($nome == ""){
	echo 'Preencha o campo nome!';
	exit();
}

if(str_Word_count($nome) <= 1){
    echo "Preencha o nome completo!";
    exit();
}

//VERIFICANDO O CPF
if($cpf == ""){
	echo 'Preencha o campo CPF!';
	exit();
}

if(!validaCPF($cpf)){
    echo "Preencha o CPF correto";
    exit();
}

//VERIFICANDO O WHATSAPP
if($telefone == ""){
	echo 'Preencha o whatsapp!';
	exit();
}

if(!celular($telefone)){
	echo 'WhatsApp esta faltando números! preencha com o DDD exemplo 12981819956';
	exit();
}

//VERIFICANDO O CEP
if($cep == ""){
    echo 'Preencha o cep!';
	exit();
}
//if(!validarCep($cep)){
//    echo "Preencha o cep correto!";
//}

//VERIFICANDO A RUA 
if($rua == ""){
	echo 'Preencha a rua ou avênida!';
	exit();
}

//VERIFICANDO O NÚMERO
if($numero == ""){
	echo 'Preencha o número da casa!';
	exit();
}

//VERIFICANDO O BAIRRO
if($bairro == ""){
	echo 'Preencha o bairro!';
	exit();
}

//VERIFICANDO A CIDADE
if($cidade == ""){
    echo 'Preencha a cidade!';
	exit();
}

//VERIFICANDO O COMPLEMENTE
if($complemento == ""){
    echo 'Preencha o ponto de referencia!';
	exit();
}



//ATUALIZANDO OS DADOS DO USUARIO NO BANCO DE DADOS 
try{
    $res = $pdo->prepare("UPDATE usuarios SET nome = :nome, cpf = :cpf, email = :email where id = '$id_usuario'");
    $res->bindValue(":nome", $nome);
    $res->bindValue(":email", $email);
    $res->bindValue(":cpf", $cpf);
    $res->execute();    
}catch(PDOException $e){
    echo "Erro ao atualizar usuário no banco de dados";
}



//ATUALIZANDO OS DADOS DO CLIENTE NO BANCO DE DADOS 
try{
    $res = $pdo->prepare("UPDATE clientes SET nome = :nome, cpf = :cpf, email = :email, telefone = :telefone, rua = :rua, numero = :numero, complemento = :complemento, bairro = :bairro, cidade = :cidade, estado = :estado, cep = :cep where cpf = '$antigo'");
    $res->bindValue(":nome", $nome);
    $res->bindValue(":email", $email);
    $res->bindValue(":cpf", $cpf);
    $res->bindValue(":telefone", $telefone);
    $res->bindValue(":rua", $rua);
    $res->bindValue(":numero", $numero);
    $res->bindValue(":complemento", $complemento);
    $res->bindValue(":bairro", $bairro);
    $res->bindValue(":cidade", $cidade);
    $res->bindValue(":estado", $estado);
    $res->bindValue(":cep", $cep);

    $res->execute();
}catch(PDOException $e){
    echo "Erro ao atualizar cliente no banco de dados";
}


//INSERINDO A VENDA NO BANCO DE DADOS 
try{
    $res = $pdo->prepare("INSERT vendas SET total = :total, total_custo = :total_custo, frete = :frete, sub_total = :sub_total, id_usuario = :id_usuario, pago = :pago, data = curDate(), status = :status, taxas = :taxas, meio_pagamento = :meio_pagamento, tipo = 'pedido_online'");
    $res->bindValue(":total", ($total));
    $res->bindValue(":total_custo", $total_custo);
    $res->bindValue(":frete", $valor_frete);
    $res->bindValue(":sub_total", $sub_total);
    $res->bindValue(":id_usuario", $id_usuario);
    $res->bindValue(":pago", 'Não');
    $res->bindValue(":status", $status_venda);
    $res->bindValue(":taxas", $taxaCartao);
    $res->bindValue(":meio_pagamento", $meioPagamento);

    $res->execute();    
    $id_venda = $pdo->lastInsertId();

}catch(PDOException $e){
    echo "Erro ao inserir a venda no banco de dados";
}


//ATUALIZANDO A COLUNA ID_VENDA DO CARRINHO
try{
//MUDAR ID DA VENDA NOS ITENS DO CARRINHO
	$pdo->query("UPDATE carrinho SET id_venda = '$id_venda' where id_usuario = '$id_usuario' and id_venda = 0");
    
}catch(PDOException $e){
    echo "Erro ao inserir o carrinho no banco de dados";
} 

//INSERINDO MENSAGEM AO CLIENTE

$pdo->query("INSERT mensagem SET id_venda = '$id_venda', texto = '$textoAoFinalizarCompra', usuario = 'Admin', data = curDate(), hora = curTime()");

if($comentario != ""){
    $res = $pdo->prepare("INSERT mensagem SET id_venda = :id_venda, texto = :texto, usuario = :usuario, data = curDate(), hora = curTime()");
    $res->bindValue(":id_venda", $id_venda);
    $res->bindValue(":texto", $comentario);
    $res->bindValue(":usuario", 'Cliente');
    $res->execute();
}

echo $id_venda;

?>