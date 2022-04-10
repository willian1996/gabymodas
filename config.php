<?php
define("ENVIRONMENT", "development"); //versão para maquina local
#define("ENVIRONMENT", "production"); //versão para hospedar
date_default_timezone_set('America/Sao_Paulo');

  
if(ENVIRONMENT == 'development'){
    $url_loja = "http://localhost/gabymodas/";
    $banco = 'gabymodas';
    $servidor = 'localhost';
    $usuario = 'root';
    $senha = '';
}else{
    $url_loja = "https://gabymodas.com";
    $banco = 'u349811508_ljgab';
    $servidor = 'localhost'; 
    $usuario = 'u349811508_root';
    $senha = 'yi`4sy]4UKCQwzX]VJ';
}

//VARIAVEIS DO BANCO DE DADOS
//$servidor = 'localhost';
//$usuario = 'root';
//$senha = '';
//$banco = 'loja';

//VARIÁVEIS GLOBAIS
$email = 'loja@gabymodas.com.br';
$telefone = '(12) 98181-9956';
$whatsapp = '(12) 98181-9956';
$whatsapp_link = '5512981819956';
$nome_loja = 'Gaby Modas';
$texto_destaque = 'Entrega a domicilio no Litoral Norte SP!';
$endereco_loja = 'Rua dos Cravos, Topolandia';
$cidade_loja = "São Sebastião";
$estado_loja = "SP";
$rodape_relatorios = "Desenvolvido por Willian Sales";
$cnpj_sistema = "42865151840";


//VARIAVEIS DO SITE
$itens_por_pagina = 20;



//CONFIGURAÇÕES DO FRETE DOS CORREIOS
$cep_origem = '11669-309';

//INFORMAÇÕES EM CM (EMBALAGEM DE ENVIO)
$comprimento_caixa = '30';
$largura_caixa = '20';
$altura_caixa = '20';
$diametro_caixa = '25';

//Indica  se  a  encomenda  será  entregue  com  o  serviço adicional mão própria.Valores possíveis: S ou N   (S –Sim, N –Não)
$mao_propria = 'N';

//Valor declarado, 1 para sim e 0 para não
$valor_declarado = 0;

//Aviso de recebimento  S ou N
$aviso_recebimento = 'N';

//1 Para caixa/Pacote  -   2 para rolo/prisma  -   3 para envelope
$formato_frete = 1;



//VARIAVEIS PARA O CUPOM
//total de cartões para o cliente trocar pelo cumpom de desconto
$total_cartoes_troca = 10;
//valor do desconto para quando o cliente completar x cupons (colocar o valor aqui inteiro)
$valor_cupom_cartao = 20;
$dias_uso_cupom = 7;


//NIVEL MINIMO PARA ALERTA NO ESTOQUE
$nivel_estoque = 5;


//VARIAVEL QUE DEFINE A LIMPEZA DO CARRINHO APÓS 10 DIAS SEM O USUÁRIO FECHAR A COMPRA (NO CASO ABAIXO EU OPTEI POR DOIS DIAS)
$dias_limpar_carrinho = 100;


//definir se vai ser possível retirar o produto no local sim ou não!
$retirada_local = 'não';

//nota minima para mostrar a avaliação do produto na página do produto
//no exemplo abaixo com valor 3, ele só mostra produto avaliado de 3 a 5
$nota_minima = 3;


//DISPAROS AUTOMATIZADOS DE EMAIL MARKETING
//total de emails que o seu servidor suporta enviar por hora (no meu hostgator são 500)
$enviar_total_emails = 480;
$intervalo_envio_email = 70;  //tempo em minutos (enviar de 70 em 70 minutos 480 emails por vez, essa é a configuração que fiz)

/*
* MÉTODO PARA PROTEJER O BANCO DE DADOS DE SQL INJECTION   
* @param DADO A FILTRAR  
* @return DADO FILTRADO 
* @author WILLIAN <williansalesgabriel@hotmail.com>
*/
function filtraEntrada($campo){
    // remove espaços no início e no final
    $campo = trim($campo); 
    // remove tags html
    $campo = strip_tags($campo); 
    // adiciona caractere de escape nas aspas e apostófros
    $campo = addslashes($campo); 
    return $campo;
}

/*
* MÉTODO PARA PEGAR A DATA E HORA ATUAL
* @return DATA E HORA ATUAL EM FORMATO PARA BANCO DE DADOS
* @author WILLIAN <williansalesgabriel@hotmail.com>
*/
function dataAtual(){
    date_default_timezone_set('America/Sao_Paulo');
    return date("Y-m-d H:i:s");
}


//Validar CPF
function validaCPF($cpf) {
 
    // Extrai somente os números
    $cpf = preg_replace( '/[^0-9]/is', '', $cpf );
     
    // Verifica se foi informado todos os digitos corretamente
    if (strlen($cpf) != 11) {
        return false;
    }

    // Verifica se foi informada uma sequência de digitos repetidos. Ex: 111.111.111-11
    if (preg_match('/(\d)\1{10}/', $cpf)) {
        return false;
    }

    // Faz o calculo para validar o CPF
    for ($t = 9; $t < 11; $t++) {
        for ($d = 0, $c = 0; $c < $t; $c++) {
            $d += $cpf[$c] * (($t + 1) - $c);
        }
        $d = ((10 * $d) % 11) % 10;
        if ($cpf[$c] != $d) {
            return false;
        }
    }
    return true;

}
function celular($telefone){
    $telefone= trim(str_replace('/', '', str_replace(' ', '', str_replace('-', '', str_replace(')', '', str_replace('(', '', $telefone))))));

    $regexTelefone = "^[0-9]{11}$";

    $regexCel = '/[0-9]{2}[6789][0-9]{3,4}[0-9]{4}/'; // Regex para validar somente celular
    if (preg_match($regexCel, $telefone)) {
        return true;
    }else{
        return false;
    }
}

function validarCep($cep) {
    // retira espacos em branco
    $cep = trim($cep);
    // expressao regular para avaliar o cep
    $avaliaCep = ereg("^[0-9]{5}-[0-9]{3}$", $cep);
    
    // verifica o resultado
    if(!$avaliaCep) {            
        return false;
    }
    else
    {
        return true;
    }
}

//removendo a mascara do telefone
function removeMascTel($telefone){
    $telefone = str_replace("(", "", $telefone);
    $telefone = str_replace(")", "", $telefone);
    $telefone = str_replace(" ", "", $telefone);
    $telefone = str_replace("-", "", $telefone);
    return $telefone;
}



//removendo a mascara do CPF
function removeMascCPF($cpf){
    $cpf = str_replace(".", "", $cpf);
    $cpf = str_replace("-", "", $cpf);
    $cpf = str_replace(" ", "", $cpf);
    return $cpf;
}

//mascara php para pagseguro aceitar
function Mask($mask,$str){

    $str = str_replace(" ","",$str);

    for($i=0;$i<strlen($str);$i++){
        $mask[strpos($mask,"#")] = $str[$i];
    }

    return $mask;

}

function AddEstoqueHistorico($quantidade, $tipo, $antes, $depois, $movimento, $id_estoque, $pdo){
    
    $res = $pdo->prepare("INSERT INTO estoque_item_historico (data, quantidade, tipo, antes, depois, movimento, id_estoque) VALUES (:data, :quantidade, :tipo, :antes, :depois, :movimento, :id_estoque)");
    $res->bindValue(":data", dataAtual());
    $res->bindValue(":quantidade", $quantidade);
    $res->bindValue(":tipo", $tipo);
    $res->bindValue(":antes", $antes);
    $res->bindValue(":depois", $depois);
    $res->bindValue(":movimento", $movimento);
    $res->bindValue(":id_estoque", $id_estoque);
    $res->execute();
    
}

//VARIAVEIS DE CONFIGURAÇÕES DO SISTEMA

$nivel_estoque_minimo = 10; //A PARTIR DE 10 PRODUTOS ELE COMEÇA A APONTAR COMO ESTOQUE BAIXO NO ALERTA.

$relatorio_pdf = 'Sim'; //Se você utilizar sim ele vai gerar os relatórios utilizando a biblioteca do dompdf configurada para o PHP 8.0, se você utilizar outra versão do PHP ou do DOMPDF pode ser que ele não gere o relatório da forma correta, caso você utilize não ele vai gerar o relatório html.

$cabecalho_img_rel = 'Não'; // Se você optar por sim, os relatórios serão exibidos com uma imagem de cabeçalho, você precisará editar o arquivo PSD para poder alterar as informações referentes a sua empresa, caso não queira basta deixar como não e ele vai pegar os valores das variaveis globais declaradas acima.


$desconto_porcentagem = 'Não'; //Se essa variavel receber sim o desconto aplicado na tela de pdv será em %, caso contrário ele será em R$.

$cupom_fiscal = 'Não'; //Se você utilizar sim, ele irá apontar para a api que vai gerar o cupom fiscal(Não configurado nesse curso, você vai precisar utilizar uma api externa para isso um dos modelos pode ser encontrado em https://plugnotas.com.br), caso contrário ele gera o cupom não fiscal já configurado no curso.

$largura_cod_barras = 3; //Usar 2 ou 3, 2 ficará com uma lagura um pouco menor o codigo de barras (só se for um produto muito pequeno);

$altura_cod_barras = 50; //Tamanho padrão de 50, podendo diminuir caso tenha necessidade (Não colocar um tamanho menor que 20)


$etiquetas_por_linha = 5; //5 etiquetas de código de barras por cada linha na pagina

$linhas_etiquetas_pag = 14; // total de linhas por pagina, neste exemplo sendo 5 etiquetas por linha e 14 paginas seriam um total de 70 etiquetas de código impresso

$mes_extenso = array(
    'Jan' => 'Janeiro',
    'Feb' => 'Fevereiro',
    'Mar' => 'Marco',
    'Apr' => 'Abril',
    'May' => 'Maio',
    'Jun' => 'Junho',
    'Jul' => 'Julho',
    'Aug' => 'Agosto',
    'Nov' => 'Novembro',
    'Sep' => 'Setembro',
    'Oct' => 'Outubro',
    'Dec' => 'Dezembro'
);
?>