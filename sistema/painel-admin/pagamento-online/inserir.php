<?php
require_once("../../../conexao.php"); 

$nome = $_POST['nome-cat'];
$email = $_POST['email'];
$token_sandbox = $_POST['token_sandbox'];
$token_oficial = $_POST['token_oficial'];

$antigo = $_POST['antigo'];
$id = $_POST['txtid2'];

if($nome == ""){
	echo 'Preencha o Campo Nome!';
	exit();
}
if($nome != $antigo){
	$res = $pdo->query("SELECT * FROM pagamento_online where nome = '$nome'"); 
	$dados = $res->fetchAll(PDO::FETCH_ASSOC);
	if(@count($dados) > 0){
			echo 'Tipo já Cadastrado no Banco!';
			exit();
		}
}

if($id == ""){
	$res = $pdo->prepare("INSERT INTO pagamento_online (nome, ativo, email, token_sandbox, token_oficial) VALUES (:nome, 'Não', :email, :token_sandbox, :token_oficial)");
	
}else{

	$res = $pdo->prepare("UPDATE pagamento_online SET nome = :nome, email = :email, token_sandbox = :token_sandbox, token_oficial = :token_oficial WHERE id = :id");
	

	$res->bindValue(":id", $id);
}

$res->bindValue(":nome", $nome);
$res->bindValue(":email", $email);
$res->bindValue(":token_sandbox", $token_sandbox);
$res->bindValue(":token_oficial", $token_oficial);


$res->execute();


echo 'Salvo com Sucesso!!';

?>