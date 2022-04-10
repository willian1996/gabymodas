<?php
require_once("../conexao.php");
@session_start();

$cpf = filtraEntrada($_POST['cpf_login']);
//REMOVENDO MASCARA DO CPF
$cpf = removeMascCPF($cpf);

if(validaCPF($cpf)){
    $res = $pdo->query("SELECT * FROM usuarios where cpf = '$cpf'"); 
    $dados = $res->fetchAll(PDO::FETCH_ASSOC);

    if(@count($dados) > 0){
        $_SESSION['id_usuario'] = $dados[0]['id'];
        $_SESSION['nome_usuario'] = $dados[0]['nome'];
        $_SESSION['email_usuario'] = $dados[0]['email'];
        $_SESSION['cpf_usuario'] = $dados[0]['cpf'];
        $_SESSION['nivel_usuario'] = $dados[0]['nivel'];

        if($_SESSION['nivel_usuario'] == 'Admin'){
            echo "<script language='javascript'> window.location='painel-admin' </script>";
        }

        if($_SESSION['nivel_usuario'] == 'Cliente'){
            echo "<script language='javascript'> window.location='painel-cliente' </script>";
        }
        
        if($_SESSION['nivel_usuario'] == 'Operador'){
            echo "<script language='javascript'> window.location='painel-operador' </script>";
        }



        }else{
            echo "<script language='javascript'> window.location='index.php?cadastro=novo&cpf=$cpf' </script>";

        }
}else{
    echo "<script language='javascript'> window.alert('CPF inválido!') </script>";
    echo "<script language='javascript'> window.location='index.php' </script>";
}




?>