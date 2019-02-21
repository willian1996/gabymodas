//index private url
let linkUrl = "http://localhost/gabymodas";
$(document).ready(function(){
    $(".telefone").mask("(00) 00000-0000");
    $(".cep").mask("00000-000");
    $('#urlColado').html(document.URL);
    
    
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














        

        


        






        



