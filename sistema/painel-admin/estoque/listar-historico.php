<?php
require_once("../../../conexao.php"); 
$id_estoque = $_POST['idEstoque'];



echo "<table id='dataTable' class='table' width='100%'  cellspacing='0' cellpadding='3'>
    <tr bgcolor='#f8f8ff'>
        <td>&nbsp;</td>
        <td>Data</td>
        <td>Quantidade</td>
        <td>Tipo</td>
        <td>Anterior</td>
        <td>Atual</td>
        <td>Movimento</td>
    </tr>";

$query_hist = $pdo->query("SELECT * FROM estoque_item_historico where id_estoque = $id_estoque order by data desc");
$res_hist = $query_hist->fetchAll(PDO::FETCH_ASSOC);
for ($h=0; $h < count($res_hist); $h++) { 
    foreach ($res_hist[$h] as $key => $value) {
    }
    $id_historico = $res_hist[$h]['id'];
    $data = $res_hist[$h]['data'];
    $data = date('d/m/y - H:m', strtotime($data));
    $quantidade = $res_hist[$h]['quantidade'];
    $tipo = $res_hist[$h]['tipo'];
    $antes = $res_hist[$h]['antes'];
    $depois = $res_hist[$h]['depois'];
    $movimento = $res_hist[$h]['movimento'];
    $id_estoque = $res_hist[$h]['id_estoque'];

    if($tipo == "Entrada"){
        echo "<tr>";
    }else{
        echo "<tr class='text-danger'>";
    }
    echo "<td>&nbsp;</td>";
    echo "<td> $data </td>";
    
    if($tipo == "Entrada"){
        echo "<td><a onclick='saidaEstoque( $id_historico )'> $quantidade &nbsp;<i class='fas fa-times text-danger'></i></td>";
    }else{
        echo "<td> $quantidade </td>";
    }
    echo "<td> $tipo </td>";
    echo "<td> $antes </td>";
    echo "<td> $depois </td>";
    echo "<td> $movimento </td>";
    echo "</tr>";
}

echo "</table>";