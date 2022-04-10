<?php 
$pag = "clientes";
require_once("../../conexao.php"); 
@session_start();
    //verificar se o usuário está autenticado
if(@$_SESSION['id_usuario'] == null || @$_SESSION['nivel_usuario'] != 'Admin'){
    echo "<script language='javascript'> window.location='../index.php' </script>";
    
}


?>





<!-- DataTales Example -->
<center><h4>Clientes Cadastrados</h4></center><br>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>WhatsApp</th>
                        <th>Localidade</th>
                        <th>Cadastro</th>
                    </tr>
                </thead>

                <tbody>

                 <?php 

                 $query = $pdo->query("SELECT * FROM clientes order by id desc ");
                 $res = $query->fetchAll(PDO::FETCH_ASSOC);

                 for ($i=0; $i < count($res); $i++) { 
                  foreach ($res[$i] as $key => $value) {
                  }

                  $nome = $res[$i]['nome'];
                  $cpf = $res[$i]['cpf'];
                  $telefone = "+55".$res[$i]['telefone'];
                  $email = $res[$i]['email'];
                  $data_cadastro = date('d-m-Y', strtotime($res[$i]['data_cadastro']));
                  $id = $res[$i]['id'];
                  if($res[$i]['rua'] != ""){
                      $localidade = $res[$i]['rua']. ', '.$res[$i]['numero']. ', '.$res[$i]['bairro']. ', '. $res[$i]['cidade']. ' - '. $res[$i]['estado'];
                  }else{
                      $localidade = "";
                  }
                  



                  ?>


                  <tr>
                    <td><?php echo $nome ?></td>
                    <td><?php echo $cpf ?></td>
                    <td><a href="https://api.whatsapp.com/send?phone=<?php echo $telefone."&text=Oi%20$nome%20" ?>" target="_blank"><?php echo $telefone ?></a></td>
                    <td><?php echo $localidade ?></td>
                    <td><?php echo $data_cadastro ?></td>



                </tr>
            <?php } ?>





        </tbody>
    </table>
</div>
</div>
</div>

 <!-- Area Chart Example-->
<?php
require_once 'server/Relatorios.php';
$relatorio = new Relatorios();
                          
                            
?>
<div class="card mb-3">
  <div class="card-header">

    Relatório de cadastros neste mês</div>
  <div class="card-body">
    <canvas id="grafico" width="100%" height="15px"></canvas>
  </div>
</div>









<script type="text/javascript">
    $(document).ready(function () {
        $('#dataTable').dataTable({
            "ordering": false
        })

    });
</script>

<script type="text/javascript">
let json = <?php echo $relatorio->cadastros_mensal();?>;

    
let chaves = [];
let valores = [];
    
for(let i in json){
 // adiciona na array nomes a key do campo do json
 chaves.push(i);
 // adiciona na array de valore o value do campo do json
 valores.push(json[i]);
}
    
var limiteMaximo = Math.max.apply(null, valores ); 
    
window.onload = function(){
    var contexto = document.getElementById("grafico").getContext("2d");
    var grafico = new Chart(contexto, {
        type:'bar',
        data: {
            labels: chaves,
            datasets: [{
              label: "clientes",
              lineTension: 0.3,
              backgroundColor: "#00BCD4",
              borderColor: "rgba(2,117,216,1)",
              pointRadius: 1,
              pointBackgroundColor: "rgba(2,117,216,1)",
              pointBorderColor: "rgba(255,255,255,0.8)",
              pointHoverRadius: 1,
              pointHoverBackgroundColor: "rgba(2,117,216,1)",
              pointHitRadius: 50,
              pointBorderWidth: 2,
              data: valores,
            }]
        },
              options: {
        scales: {
          xAxes: [{
            time: {
              unit: 'date'
            },
            gridLines: {
              display: false
            },
            ticks: {
              maxTicksLimit: 7
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: limiteMaximo,
              maxTicksLimit: 5
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            }
          }],
        },
        legend: {
          display: false
        }
      }
        
        
    });
}	



</script>

