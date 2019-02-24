//index private url
let linkUrl = "http://localhost/gabymodas";

//jquery
$(document).ready(function(){
    $(".telefone").mask("(00) 00000-0000");
    $(".cep").mask("00000-000");
    $('#urlColado').html(document.URL);
    $('.modal').modal();
    $('#modal1').modal('open');
    $('#modal1').modal('close');
    $('.modal').modal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .5, // Opacity of modal background
      inDuration: 300, // Transition in duration
      outDuration: 200, // Transition out duration
      startingTop: '4%', // Starting top style attribute
      endingTop: '10%', // Ending top style attribute
      ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
        console.log(modal, trigger);
      },
      complete: function(){ 
          
      } // Callback for Modal close
    }
  );
    
    
});

//login do administrador por ajax
function login(){
    var email = $('#login_email').val();
    var senha = $('#login_senha').val();
    console.log("Email: "+email+" senha: "+senha);
    $.ajax({
        url: "server/login.php",
        method: "POST",
        dataType: "json",
        data: {'email': email, 'senha': senha},
        success: function(retorno){
            if(retorno.deucerto){
                window.location.assign(linkUrl);
            }else{
                alert(retorno.mensagem);
            }
        }
    });
}

//excluir cliente por ajax 
function excluirCliente(id){
    $.ajax({
          url: "server/excluir-cliente.php",
          method: "POST",
          dataType: "json", //tipo de retorno.
          data: {"id":id},
          success: function(retorno){
              if(retorno.deucerto){
                alert(retorno.mensagem);
                  window.location.reload();
              }else{
                alert(retorno.mensagem); 
              }
          }
      });
}

//script imprimir em pdf
function printData(){
   var divToPrint=document.getElementById("infoCliente");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}
$('#imprimir').on('click',function(){
printData();
})















        

        


        






        



