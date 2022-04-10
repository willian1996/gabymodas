<?php
require_once("config.php");


try {
	$pdo = new PDO("mysql:dbname=$banco;host=$servidor;charset=utf8", "$usuario", "$senha");

	//CONEXAO MYSQLI PARA O BACKUP
	$conn = mysqli_connect($servidor, $usuario, $senha, $banco);

} catch (Exception $e) {
	echo "Erro ao conectar com o banco de dados! " . $e;
}

?>