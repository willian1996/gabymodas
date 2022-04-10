<?php
session_start();

require_once("../../../conexao.php"); 

$id_historico = $_POST['idHistorico'];

//BUSCANDO A QUANTIDADE DO HISTORICO
$res2 = $pdo->query("SELECT * FROM estoque_item_historico where id = $id_historico");
$dados2 = $res2->fetchAll(PDO::FETCH_ASSOC);
$quantHistorico = $dados2[0]['quantidade'];
$id_estoque = $dados2[0]['id_estoque'];

//BUSCANDO A QUANTIDADE DO ESTOQUE
$res3 = $pdo->query("SELECT * FROM estoque where id = $id_estoque");
$dados3 = $res3->fetchAll(PDO::FETCH_ASSOC);
$quantEstoque = $dados3[0]['quantidade'];

$total_estoque = ($quantEstoque - $quantHistorico);



try{
    $pdo->query("UPDATE estoque SET quantidade = '$total_estoque' where id = '$id_estoque'");
}catch(PDOException $e){
    echo "Erro ao inserir ".$e;
} 


echo "Foi tirado $quantHistorico itens do estoque";


$movimento = "AJUSTE - " . $_SESSION['nome_usuario'];
$tipo = "Saída";
//ADICIONANDO AO HISTORICO
AddEstoqueHistorico($quantHistorico, $tipo, $quantEstoque, $total_estoque, $movimento, $id_estoque, $pdo);



?>