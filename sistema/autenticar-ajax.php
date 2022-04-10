<?php
require_once("../conexao.php");
@session_start();

$cpf = filtraEntrada($_POST['cpf_login']);
//REMOVENDO MASCARA DO CPF
$cpf = removeMascCPF($cpf);

if(!validaCPF($cpf)){
echo "CPF inválido!";
exit();
} 

$res = $pdo->query("SELECT * FROM usuarios where cpf = '$cpf'"); 
$dados = $res->fetchAll(PDO::FETCH_ASSOC);

if(@count($dados) > 0){
    $_SESSION['id_usuario'] = $dados[0]['id'];
    $_SESSION['nome_usuario'] = $dados[0]['nome'];
    $_SESSION['email_usuario'] = $dados[0]['email'];
    $_SESSION['cpf_usuario'] = $dados[0]['cpf'];
    $_SESSION['nivel_usuario'] = $dados[0]['nivel'];

    if($_SESSION['nivel_usuario'] == 'Cliente'){
        echo "Logado com sucesso!";
    }

}else{
    echo "CPF não cadastrado!";

}





?>