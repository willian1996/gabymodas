<?php
new Relatorios();
class Relatorios{
    private $pdo;
    private $data_atual;
    public function __construct(){
        $option = [PDO::MYSQL_ATTR_INIT_COMMAND => "SET LC_TIME_NAMES = pt_BR"];
        $this->pdo = new PDO("mysql:host=localhost;dbname=bd_gabymodas;charset=utf8", "root", "", $option);
        $this->data_atual = date('Y-m-d H:i:s');
        $uri = urldecode(filter_input(INPUT_SERVER, 'REQUEST_URI'));
        $request = explode('/', $uri);
        $method = isset($request[3]) ? $request[3] : null;
        $param = isset($request[4]) ? $request[4] : null;
        if(method_exists(get_class(), $method)){
            $this->$method($param);
        }else{
            return false;
        }
    }

    public function cadastros_mensal(){
        $mes = date('m');
        $ano = date('Y');
        $sql = "SELECT DAY(dataCadastro) as dia, COUNT(id) as registro "
              ."FROM clientes "
              ."WHERE MONTH(dataCadastro) = '{$mes}' "
              ."AND YEAR(dataCadastro) = '{$ano}' "
              ."GROUP BY DAY(dataCadastro) ";
        $query = $this->pdo->query($sql);
        $result = $query->fetchAll(PDO::FETCH_OBJ);
        foreach($result as $res){
            $dados[$res->dia] = $res->registro;
        }
        $dias_do_mes = $this->_dias_do_mes();
        $final = array_replace($dias_do_mes, $dados);
        echo json_encode($final);
    }
    private function _dias_do_mes(){
        $hoje = date('d');
        if($hoje <= 10){
            $esse_mes = 10;
        }else if($hoje <= 15){
            $esse_mes = 15;
        }else if($hoje <= 20){
            $esse_mes = 20;
        }else if($hoje <= 25){
            $esse_mes = 25;
        }else{
            $esse_mes = cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'));
        }
        $dias = [1 => '0'];
        for($i = 1; $i < $esse_mes; $i++){
            array_push($dias, '0');
        }
        return $dias;
    }
    
    public function cadastros_semestral(){
        $periodo = date('Y-m-d H:i:s', strtotime('-6 months'));
        
        $sql = "SELECT MONTHNAME(dataCadastro) as mes, COUNT(id) as registro "
              ."FROM clientes "
              ."WHERE dataCadastro >= '{$periodo}' "
              ."GROUP BY MONTHNAME(dataCadastro) "
              ."ORDER BY dataCadastro";
              
        $query = $this->pdo->query($sql);
        $result = $query->fetchAll(PDO::FETCH_OBJ);
        
        foreach($result as $res){
            $dados[$res->mes] = $res->registro;
        }
        
        echo json_encode($dados);
    }
    
    public function cadastros_por_cidade(){
        $sql = "SELECT cidade, COUNT(id) as registro FROM clientes GROUP BY cidade";
        $sql = $this->pdo->query($sql);
        $result = $sql->fetchAll(PDO::FETCH_OBJ);
        
        
        
        foreach($result as $res){
            $dados[$res->cidade] = $res->registro;
            
        }
        
        
        echo json_encode($dados);
    }
    
    public function totalCadastros(){
        $sql = "SELECT COUNT(id) as total FROM clientes";
        $sql = $this->pdo->query($sql);
        $total = $sql->fetch();
        
        return $total['total'];
        
    }
}