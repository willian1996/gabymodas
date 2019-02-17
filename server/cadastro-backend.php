<?php

$nome_completo = isset($_POST['nome_completo'])?$_POST['nome_completo']:'';
$whatsapp = isset($_POST['whatsapp'])?$_POST['whatsapp']:'';
$rua = isset($_POST['rua'])?$_POST['rua']:'';
$numeroCasa = isset($_POST['numeroCasa'])?$_POST['numeroCasa']:'';
$bairro = isset($_POST['bairro'])?$_POST['bairro']:'';
$cidade = isset($_POST['cidade'])?$_POST['cidade']:'';
$cep = isset($_POST['cep'])?$_POST['cep']:'';
$telefone1 = isset($_POST['telefone1'])?$_POST['telefone1']:'';
$telefone2 = isset($_POST['telefone2'])?$_POST['telefone2']:'';
$observacao = isset($_POST['observacao'])?$_POST['observacao']:'';

echo "<hr>";
echo "<br>";
echo $nome_completo;
echo "<br>";
echo $whatsapp;
echo "<br>";
echo $rua;
echo "<br>";
echo $numeroCasa;
echo "<br>";
echo $bairro;
echo "<br>";
echo $cidade;
echo "<br>";
echo $cep;
echo "<br>";
echo $telefone1;
echo "<br>";
echo $telefone2;
echo "<br>";
echo $observacao;