<?php

require_once("../../../conexao.php"); 

$nome = isset($_POST['nome-cat'])?$_POST['nome-cat']:'';
$id_cat = isset($_POST['categoria'])?$_POST['categoria']:'';
$id_sub_cat = isset($_POST['sub-categoria'])?$_POST['sub-categoria']:'';
$descricao = isset($_POST['descricao'])?$_POST['descricao']:'-';
$descricao_longa = isset($_POST['descricao_longa'])?$_POST['descricao_longa']:'-';
$valor = isset($_POST['valor'])?$_POST['valor']:'';
$custo = isset($_POST['custo'])?$_POST['custo']:'';
$estoque = isset($_POST['estoque'])?$_POST['estoque']:'';
$tipo_envio = isset($_POST['tipo_envio'])?$_POST['tipo_envio']:'';
$ativo = isset($_POST['ativo'])?$_POST['ativo']:'';
$fornecedor = isset($_POST['fornecedor'])?$_POST['fornecedor']:'';
$palavras = isset($_POST['palavras'])?$_POST['palavras']:'';
$peso = isset($_POST['peso'])?$_POST['peso']:'';
$largura = isset($_POST['largura'])?$_POST['largura']:'';
$altura = isset($_POST['altura'])?$_POST['altura']:'';
$comprimento = isset($_POST['comprimento'])?$_POST['comprimento']:'';
$modelo = isset($_POST['modelo'])?$_POST['modelo']:null;
$valor_frete = isset($_POST['valor-frete'])?$_POST['valor-frete']:"0";
$link = isset($_POST['link'])?$_POST['link']:null;
 
//TROCANDO VIRTUGLA POR PONTO 
$valor = str_replace(',', '.', $valor);
$custo = str_replace(',', '.', $custo);
$valor_frete = str_replace(',', '.', $valor_frete);
$peso = str_replace(',', '.', $peso);
$largura = str_replace(',', '.', $largura);
$altura = str_replace(',', '.', $altura);
$comprimento = str_replace(',', '.', $comprimento);

$nome_novo = strtolower( preg_replace("[^a-zA-Z0-9-]", "-", 
        strtr(utf8_decode(trim($nome)), utf8_decode("áàãâéêíóôõúüñçÁÀÃÂÉÊÍÓÔÕÚÜÑÇ"),
        "aaaaeeiooouuncAAAAEEIOOOUUNC-")) );
$nome_url = preg_replace('/[ -]+/' , '-' , $nome_novo);

$antigo = $_POST['antigo'];
$id = $_POST['txtid2'];


//VERIFICA SE AS STRINGS ESTÃO VAZIAS 
if($nome == ""){
	echo 'Preencha o campo Nome!';
	exit();
}
if($valor == ""){
	echo 'Preencha o campo Valor!';
	exit();
}
if($custo == ""){
	echo 'Preencha o campo custo!';
	exit();
}
if($descricao == ""){
	echo 'Preencha o campo descrição!';
	exit();
}
if($descricao_longa == ""){
	echo 'Preencha o campo refêrencia!';
	exit();
}
if($estoque == ""){
	echo 'Preencha o campo estoque!';
	exit();
}
if($tipo_envio == ""){
	echo 'Preencha o campo tipo envio!';
	exit();
}
if($fornecedor == ""){
	echo 'Preencha o campo fornecedor!';
	exit();
}
if($palavras == ""){
	echo 'Preencha o campo palavras chave!';
	exit();
}
if($peso == ""){
	echo 'Preencha o campo peso!';
	exit();
}
if($largura == ""){
	echo 'Preencha o campo largura!';
	exit();
}
if($altura == ""){
	echo 'Preencha o campo altura!';
	exit();
}
if($comprimento == ""){
	echo 'Preencha o campo comprimento!';
	exit();
}




if($nome != $antigo){
	$res = $pdo->query("SELECT * FROM produtos where nome = '$nome'"); 
	$dados = $res->fetchAll(PDO::FETCH_ASSOC);
	if(@count($dados) > 0){
			echo 'Produto já Cadastrado no Banco!';
			exit();
		}
}



//SCRIPT PARA SUBIR FOTO NO BANCO
$nome_img = preg_replace('/[ -]+/' , '-' , @$_FILES['imagem']['name']);
$caminho = '../../../img/produtos/' .$nome_img;
if (@$_FILES['imagem']['name'] == ""){
  $imagem = "sem-foto.jpg";
}else{
  
  $imagem = $nome_img;

  
}

$imagem_temp = @$_FILES['imagem']['tmp_name']; 

$ext = pathinfo($imagem, PATHINFO_EXTENSION);   
if($ext == 'png' or $ext == 'jpg' or $ext == 'jpeg' or $ext == 'gif'){ 
move_uploaded_file($imagem_temp, $caminho);
}else{
	echo 'Extensão de Imagem não permitida!';
	exit();
}


try{
    if($id == ""){
        $res = $pdo->prepare("INSERT INTO produtos (categoria, sub_categoria, nome, nome_url, descricao, descricao_longa, valor, custo, imagem, estoque, tipo_envio, palavras, ativo, peso, largura, altura, comprimento, modelo, valor_frete, link, id_fornecedor) VALUES (:categoria, :sub_categoria, :nome, :nome_url, :descricao, :descricao_longa, :valor, :custo, :imagem, :estoque, :tipo_envio, :palavras, :ativo, :peso, :largura, :altura, :comprimento, :modelo, :valor_frete, :link, :id_fornecedor)");
        $res->bindValue(":imagem", $imagem);
    }else{
        if($imagem == "sem-foto.jpg"){
            $res = $pdo->prepare("UPDATE produtos SET categoria = :categoria, sub_categoria = :sub_categoria, nome = :nome, nome_url = :nome_url, descricao = :descricao, descricao_longa = :descricao_longa, valor = :valor, custo = :custo, estoque = :estoque, tipo_envio = :tipo_envio, palavras = :palavras, ativo = :ativo, peso = :peso, largura = :largura, altura = :altura, comprimento = :comprimento, modelo = :modelo, valor_frete = :valor_frete, link = :link, id_fornecedor = :id_fornecedor WHERE id = :id");
        }else{
            $res = $pdo->prepare("UPDATE produtos SET categoria = :categoria, sub_categoria = :sub_categoria, nome = :nome, nome_url = :nome_url,descricao = :descricao,descricao_longa = :descricao_longa,valor = :valor, custo = :custo, estoque = :estoque,tipo_envio = :tipo_envio,palavras = :palavras,ativo = :ativo,peso = :peso, largura = :largura, altura = :altura, comprimento = :comprimento, modelo = :modelo, valor_frete = :valor_frete, imagem = :imagem, link = :link, id_fornecedor = :id_fornecedor WHERE id = :id");
            $res->bindValue(":imagem", $imagem);
        }
        $res->bindValue(":id", $id);
    }
    $res->bindValue(":nome", $nome);
    $res->bindValue(":nome_url", $nome_url);
    $res->bindValue(":categoria", $id_cat);
    $res->bindValue(":id_fornecedor", $fornecedor);
    $res->bindValue(":sub_categoria", $id_sub_cat);
    $res->bindValue(":descricao", $descricao);
    $res->bindValue(":descricao_longa", $descricao_longa);
    $res->bindValue(":valor", $valor);
    $res->bindValue(":custo", $custo);
    $res->bindValue(":estoque", $estoque);
    $res->bindValue(":tipo_envio", $tipo_envio);
    $res->bindValue(":palavras", $palavras);
    $res->bindValue(":ativo", $ativo);
    $res->bindValue(":peso", $peso);
    $res->bindValue(":largura", $largura);
    $res->bindValue(":altura", $altura);
    $res->bindValue(":comprimento", $comprimento);
    $res->bindValue(":modelo", $modelo);
    $res->bindValue(":valor_frete", $valor_frete);
    $res->bindValue(":link", $link);
    $res->execute();
    
    if($res->rowCount() > 0){
        echo 'Salvo com Sucesso!!';
    }else{
        echo 'Erro ao inserir produto';
    }
        
        
        
    
}catch(PDOException $e){
    echo $e->getMessage();
    
}




?>