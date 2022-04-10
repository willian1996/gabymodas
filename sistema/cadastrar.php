<?php 
require_once("../conexao.php");
@session_start();
  
$nome = filtraEntrada($_POST['nome_cadastro']);
$cpf = filtraEntrada($_POST['cpf_cadastro']);
$cpf = removeMascCPF($cpf);
$telefone = filtraEntrada($_POST['telefone_cadastro']);
$email = "$cpf@gabymodas.com";
$rua = filtraEntrada($_POST['rua_cadastro']);
$numero = filtraEntrada($_POST['numero_cadastro']);
$bairro = filtraEntrada($_POST['bairro_cadastro']);
$cidade = filtraEntrada($_POST['cidade_cadastro']);
$estado = filtraEntrada($_POST['estado_cadastro']);
$cep = filtraEntrada($_POST['cep_cadastro']);
$complemento = filtraEntrada($_POST['complemento_cadastro']);
$data_cadastro = dataAtual();
  

if($nome == ""){
	echo 'Preencha o campo nome!';
	exit();
}

if(str_Word_count($nome) <= 1){
    echo "Digite o nome completo";
    exit();
}


if($cpf == ""){
	echo 'Preencha o campo CPF!';
	exit();
}

if(!validaCPF($cpf)){
    echo "Preencha o CPF correto";
    exit();
}


$res = $pdo->query("SELECT * FROM usuarios where cpf = '$cpf'"); 
$dados = $res->fetchAll(PDO::FETCH_ASSOC);
if(@count($dados) != 0){
    echo 'CPF já cadastrado!';
    exit();
}

if($telefone == ""){
	echo 'Preencha o campo whatsapp!';
	exit();
}
//REMOVENDO MASCARA DO TELEFONE E VERIFICANDO A VALIDADE
$telefone = removeMascTel($telefone);
if(!celular($telefone)){
	echo 'Preencha o WhatsApp com o DDD exemplo (12)98181-9956';
	exit();
}



// VERIFCIANDO SE ESTA CADASTRADO
$res = $pdo->query("SELECT * FROM usuarios where email = '$email'"); 
$dados = $res->fetchAll(PDO::FETCH_ASSOC);
if(@count($dados) != 0){
    echo 'E-mail já cadastrado!';
    exit();
}
if($email == ""){
	echo 'Preencha o campo email!';
	exit();
}

if($rua == ""){
    echo "Preencha o campo rua";
    exit;
}

if($numero == ""){
    echo "Preencha o campo número";
    exit;
}

if($bairro == ""){
    echo "Preencha o campo bairro";
    exit;
}

if($cidade == ""){
    echo "Preencha o campo cidade";
    exit;
}

if($estado == ""){
    echo "Preencha o campo estado";
    exit;
}

if($complemento == ""){
    echo "Preencha o campo ponto de referência";
    exit;
}








$res = $pdo->query("SELECT * FROM clientes where cpf = '$cpf' or email = '$email'"); 
$dados = $res->fetchAll(PDO::FETCH_ASSOC);
if(@count($dados) == 0){

	$res = $pdo->prepare("INSERT into usuarios (nome, cpf, email, senha, senha_crip, nivel) values (:nome, :cpf, :email, :senha, :senha_crip, :nivel)");
	$res->bindValue(":nome", $nome);
	$res->bindValue(":email", $email);
	$res->bindValue(":cpf", $cpf);
	$res->bindValue(":senha", "-");
	$res->bindValue(":senha_crip", "-");
	$res->bindValue(":nivel", 'Cliente');

	$res->execute();


	$res = $pdo->prepare("INSERT into clientes (nome, cpf, telefone, email, rua, numero, bairro, cidade, estado, complemento, cep,  data_cadastro) values (:nome, :cpf, :telefone, :email, :rua, :numero, :bairro, :cidade, :estado, :complemento, :cep, :data_cadastro)");
	$res->bindValue(":nome", $nome);
	$res->bindValue(":email", $email);
    $res->bindValue(":data_cadastro", $data_cadastro);
    $res->bindValue(":telefone", $telefone);
	$res->bindValue(":cpf", $cpf);
    $res->bindValue(":rua", $rua);
    $res->bindValue(":numero", $numero);
    $res->bindValue(":bairro", $bairro);
    $res->bindValue(":cidade", $cidade);
    $res->bindValue(":estado", $estado);
    $res->bindValue(":complemento", $complemento);
    $res->bindValue(":cep", $cep);
                    
	$res->execute();


	$res = $pdo->query("SELECT * FROM emails where email = '$email'"); 
	$dados = $res->fetchAll(PDO::FETCH_ASSOC);
	if(@count($dados) == 0){
        $res = $pdo->prepare("INSERT into emails (nome, email, ativo) values (:nome, :email, :ativo)");
        $res->bindValue(":nome", $nome);
        $res->bindValue(":email", $email);
        $res->bindValue(":ativo", "Sim");
        $res->execute();
    }
    
    //FAZENDO LOGIN
    $res = $pdo->query("SELECT * FROM usuarios where cpf = '$cpf'"); 
    $dados = $res->fetchAll(PDO::FETCH_ASSOC);

    if(@count($dados) > 0){
        $_SESSION['id_usuario'] = $dados[0]['id'];
        $_SESSION['nome_usuario'] = $dados[0]['nome'];
        $_SESSION['email_usuario'] = $dados[0]['email'];
        $_SESSION['cpf_usuario'] = $dados[0]['cpf'];
        $_SESSION['nivel_usuario'] = $dados[0]['nivel'];


        if($_SESSION['nivel_usuario'] == 'Cliente'){
            echo "Cadastrado com Sucesso!";
        }



    }

    

	
}else{
	echo 'CPF ou E-mail já cadastrado!';
}


?>