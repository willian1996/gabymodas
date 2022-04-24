<?php
require_once("../conexao.php");



?> 
 
<!DOCTYPE html>
<html>
<head>
   <title>Login - <?php echo $nome_loja ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
      <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

      <link href="../css/login.css" rel="stylesheet">
      <script src="../js/login.js"></script>

      <link rel="shortcut icon" href="../img/logoicone1.ico" type="image/x-icon">
    <link rel="icon" href="../img/logoicone2.ico" type="image/x-icon">


</head>



<body>
    <div class="container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1 style="color:#F60C89">Identifique-se</h1>
						 </div>
		 			</div>
                   <form action="autenticar.php" method="post" name="login" autocomplete="off">
                           <div class="form-group">
                              <label for="exampleInputEmail1"></label>
                              <input type="text" value="<?php echo @$_GET['cpf'] ?>" name="cpf_login"  class="form-control" id="cpf_login" aria-describedby="emailHelp" placeholder="CPF">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1"></label>
                              <input type="password" name="senha_login" id="senha_login"  class="form-control" aria-describedby="emailHelp" placeholder="Senha">
                           </div>
                           <div class="col-md-12 text-center mt-4">
                              <button style="background-color:#F60C89" type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Entrar</button>
                           </div>
                          

                           

                           <div class="form-group mt-4">
                              <small>
                              <p class="text-center">Não possui cadastro? <a href="#" data-toggle="modal" data-target="#modalCadastro">Cadastre-se</a></p>
                              <p class="text-center"><a class="text-danger" href="#" data-toggle="modal" data-target="#modalRecuperar">Recuperar Senha?</a></p>
                              
                                  
                                  
                           </small>
                           </div>
                        </form>
                 
				</div>
			</div>
			  
			</div>
		</div>
      </div>   
         
</body>


</html>




<!-- Modal -->
<div class="modal fade" id="modalCadastro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog" role="document">
  <div class="modal-content">
   <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">Cadastre-se</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
     <span aria-hidden="true">&times;</span>
  </button>
</div>
<div class="modal-body">
   <form method="post" autocomplete="off">
       
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="exampleInputEmail1">Nome completo</label>
            <input type="text" class="form-control" id="nome" name="nome_cadastro">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="exampleInputEmail1">CPF</label>
            <input type="text" value="<?php echo @$_GET['cpf'] ?>" class="form-control" id="cpf" name="cpf_cadastro">
        </div>
    </div>
</div>
        
 <div class="form-group">
     <label for="exampleInputEmail1">WhatsApp + DDD</label>
     <input type="text" class="form-control" id="telefone" name="telefone_cadastro">
    
  </div>

    <div class="form-group">
     <label for="exampleInputEmail1">E-mail</label>
     <input value="<?php echo @$_GET['email_rodape'] ?>" type="email" class="form-control" id="email" name="email" placeholder="">
    
  </div>
  <div class="form-group">
     <label for="exampleInputEmail1">CEP</label>
     <input type="text" class="form-control" id="cep" name="cep_cadastro" placeholder="digite o cep para pesquisar o endereço" >
    
  </div>
  <div class="form-group">
     <label for="exampleInputEmail1">Endereço</label>
     <input type="text" class="form-control" id="logradouro" name="rua_cadastro">
    
  </div>
 <div class="form-group">
     <label for="exampleInputEmail1">Número</label>
     <input type="text" class="form-control" id="numero" name="numero_cadastro" >
     
  </div>
 <div class="form-group">
     <label for="exampleInputEmail1">Bairro</label>
     <input type="text" class="form-control" id="bairro" name="bairro_cadastro">
    
  </div>
   <div class="form-group">
     <label for="exampleInputEmail1">Cidade</label>
     <input type="text" class="form-control" id="localidade" name="cidade_cadastro">
    
  </div>
  <div class="form-group">
     <label for="exampleInputEmail1">Estado</label>
     <input type="text" class="form-control" id="uf" name="estado_cadastro">
    
  </div>
  <div class="form-group">
     <label for="exampleInputEmail1">Ponto de referência</label>
     <input type="text" class="form-control" id="complemento" name="complemento_cadastro">
    
  </div>

 



  <div class="row">

   <div class="col-md-6">
      <div class="form-group">
       <label for="exampleInputEmail1">Senha</label>
       <input type="password" class="form-control" id="senha" name="senha" placeholder="Inserir Senha">

    </div>
 </div>

 <div class="col-md-6">
   <div class="form-group">
    <label for="exampleInputEmail1">Confirmar Senha</label>
    <input type="password" class="form-control" id="confirmar-senha" name="confirmar-senha" placeholder="Confirmar Senha">
    
 </div>
</div>

</div>


  

 <small><div id="div-mensagem"></div></small>
</div>
<div class="modal-footer">

 <button type="button" id="btn-fechar-cadastrar" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
   
  <button type="button" id="btn-cadastrar" class="btn btn-info">Cadastrar</button>

  </form>

</div>
</div>
</div>
</div>





<!-- Modal Recuperar -->
<div class="modal fade" id="modalRecuperar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog" role="document">
  <div class="modal-content">
   <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">Recuperar Senha</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
     <span aria-hidden="true">&times;</span>
  </button>
</div>
<div class="modal-body">
   <form method="post">

 

    <div class="form-group">
     <label for="exampleInputEmail1">Email</label>
     <input type="email" class="form-control" id="email-recuperar" name="email-recuperar" placeholder="Seu Email">
    
  </div>

  
<small><div id="div-mensagem-rec"></div></small>

</div>
<div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
   
  <button type="button" id="btn-recuperar" class="btn btn-info">Recuperar</button>

  </form>

</div>
</div>
</div>
</div>



<?php 

if (@$_GET["email_rodape"] != null) {
    echo "<script>$('#modalCadastro').modal('show');</script>";
}
       
if (@$_GET["cadastro"] == 'novo') {
    echo "<script>$('#modalCadastro').modal('show');</script>";
}

?>

<!--BUSCANDO ENDEREÇO POR CEP-->
<script type="text/javascript">
const cep = document.querySelector("#cep");
    
const showData = (result)=>{
    for(const campo in result){
        if(document.querySelector("#"+campo)){
            document.querySelector("#"+campo).value = result[campo];
            
        }
    }
}

cep.addEventListener("blur",(e)=>{
    let search = cep.value.replace("-", "");
    const options = {
        method: 'GET',
        mode: 'cors',
        cache: 'default'
    }
    fetch(`https://viacep.com.br/ws/${search}/json/`, options)
    .then(response=>{ response.json()
        .then( data => showData(data))
    })
    .catch(e => console.log('Deu erro: '+ e, message))

    
    
        
    })
</script>
 
<script type="text/javascript">
    $('#btn-cadastrar').click(function(event){
        event.preventDefault();
        
        $.ajax({
            url:"cadastrar.php",
            method:"post",
            data: $('form').serialize(),
            dataType: "text",
            success: function(msg){
                if(msg.trim() === 'Cadastrado com Sucesso!'){
                    
                    $('#div-mensagem').addClass('text-success')
                    $('#div-mensagem').text(msg);
                    alert(msg);
                    window.location='../index.php';
                    }
                 else{
                    $('#div-mensagem').addClass('text-danger')
                    $('#div-mensagem').text(msg);
                   

                 }
            }
        })
    })
</script>





<script type="text/javascript">
    $('#btn-recuperar').click(function(event){
        event.preventDefault();
        
        $.ajax({
            url:"recuperar.php",
            method:"post",
            data: $('form').serialize(),
            dataType: "text",
            success: function(msg){
                if(msg.trim() === 'Senha Enviada para o Email!'){
                    
                    $('#div-mensagem-rec').addClass('text-success')
                    $('#div-mensagem-rec').text(msg);
                                        
                    }else if(msg.trim() === 'Preencha o Campo Email!'){
                      $('#div-mensagem-rec').addClass('text-success')
                      $('#div-mensagem-rec').text(msg);

                    }else if(msg.trim() === 'Este email não está cadastrado!'){
                      $('#div-mensagem-rec').addClass('text-success')
                      $('#div-mensagem-rec').text(msg);
                    }



                 else{
                    $('#div-mensagem-rec').addClass('text-danger');
                    $('#div-mensagem-rec').text('Deu erro ao Enviar o Formulário! Provavelmente seu servidor de hospedagem não está com permissão de envio habilitada ou você está em um servidor local');
                   

                 }
            }
        })
    })
</script>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>

  <script src="../js/mascara.js"></script>
