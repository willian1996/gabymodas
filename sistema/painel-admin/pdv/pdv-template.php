<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- substitua pelo seu CSS do Bootstrap -->
    <link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"crossorigin="anonymous">
    <title>PDV</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <a class="navbar-brand"href="#">Meu PDV</a>
        <button class="navbar-toggler"type="button"data-toggle="collapse"data-target="#navbarText"aria-controls="navbarText"aria-expanded="false"aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse"id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"></li>
            </ul>
<!--
            <span class="navbar-text">
                <a class="nav-link btn btn-primary"href="#">X Log out</a>
            </span>
-->
        </div>
    </nav>

    <section class="bg-light">
        <div class="ml-3 mr-3">
            <div class="row mt-2">
                <div class="col">
                <form>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label text-muted"for="inlineCheckbox">Código de Barras</label>
                    </div>
                    <div class="form-check form-check-inline"style="float:right; margin:0;">
                        <input class="form-check-input"type="checkbox"id="inlineCheckbox"value="option">
                        <label class="form-check-label text-muted"for="inlineCheckbox">Leitor de código de barras (F2)</label>
                    </div>
                    <input class="form-control form-control"type="text">
                    <div class="form-row mt-5">
                        <div class="form-group col">
                            <label for="input1">Produto</label>
                            <input type="text"class="form-control"id="input1"placeholder="Coca-cola" disabled>
                        </div>
                        <div class="form-group col">
                            <label for="input2">Descrição</label>
                            <input type="text"class="form-control"id="input2"placeholder="Refrigerante lt" disabled>
                        </div>
                        <div class="form-group col">
                            <label for="input3">Estoque</label>
                            <input type="text"class="form-control"id="input3"placeholder="110" disabled>
                        </div>
                    </div>
                    <div class="form-row mt-1">
                         <div class="form-group col">
                            <label for="input1">Quantidade</label>
                            <input type="text"class="form-control"id="input1"placeholder="2">
                        </div>
                        <div class="form-group col">
                            <label for="input2">Valor Unit.</label>
                            <input type="text"class="form-control"id="input2"placeholder="5,00" disabled>
                        </div>
                       
                        
                        <div class="form-group col">
                            <label for="input3">Subtotal</label>
                            <input type="text"class="form-control"id="input3"placeholder="10,00" disabled>
                        </div>
                    </div>
                    <a onclick="include()"class="btn btn-lg btn-block btn-success">INCLUIR (ENTER)</a>
<!--
                    <div class="form-group">
                        <label for="Textarea1">Observações (CTRL + O)</label>
                        <textarea class="form-control"id="Textarea1"rows="3"></textarea>
                    </div>
-->
                </div>
                <div class="col">
<!--
                    <label class="form-check-label text-muted"for="inlineCheckbox">Lista de produtos</label>
                    <input class="form-control form-control"type="text"placeholder="Aguardando abertura de pedido.Selecione um produto ou um pedido em aberto."disabled>
-->
                    <div class="border mt-3 text-center bg-white"style="height: 400px; display: flex; justify-content: center; align-items: center;">
                        <p id="x1"style="margin-left: 25%">SEU CAIXA ESTÁ <span class="text-primary">LIVRE</span> NO MOMENTO.</p>
                        <table style="display:none;"id="x2">
                            <tr style="border-bottom: 1px dashed black;">
                                <th>Qtd.</th>
                                <th>Cód.</th>
                                <th>Produto</th>
                                <th>Valor Unit.</th>
                                <th>Valor Total</th>
                                <th></th>
                            </tr>
                            <hr>
                            <tr>
                                <td>1</td>
                                <td>SSD0001</td>
                                <td>SSD 128</td>
                                <td>R$ 50,00</td>
                                <td>R$ 50,00</td>
                                <td>
                                    <button onclick="cancel()"class="btn btn-danger btn-sm">X</button>
                                </td>
                            </tr>
                            <hr>
                            <tr>
                                <td>1</td>
                                <td>SSD0001</td>
                                <td>SSD 128</td>
                                <td>R$ 50,00</td>
                                <td>R$ 50,00</td>
                                <td>
                                    <button onclick="cancel()"class="btn btn-danger btn-sm">X</button>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>SSD0001</td>
                                <td>SSD 128</td>
                                <td>R$ 50,00</td>
                                <td>R$ 50,00</td>
                                <td>
                                    <button onclick="cancel()"class="btn btn-danger btn-sm">X</button>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>SSD0001</td>
                                <td>SSD 128</td>
                                <td>R$ 50,00</td>
                                <td>R$ 50,00</td>
                                <td>
                                    <button onclick="cancel()"class="btn btn-danger btn-sm">X</button>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>SSD0001</td>
                                <td>SSD 128</td>
                                <td>R$ 50,00</td>
                                <td>R$ 50,00</td>
                                <td>
                                    <button onclick="cancel()"class="btn btn-danger btn-sm">X</button>
                                </td>
                            </tr>
                            
                        </table>
                    </div>
                    <div class="d-flex justify-content-between bg-primary rounded-right rounded-left">
                        <div class="text-white m-2"><h4>TOTAL COMPRA - R$ 50,00</h4></div>
                            <div class="text-white m-2"><h4></h4></div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="card-footer fixed-bottom text-muted text-right mb-4">
                <button type="button"class="btn btn-danger"> Cancelar (F9) </button>
                <button type="button"class="btn btn-success"onclick="pg()"> Pagamento (F8) </button>
            </div>

    </section>

    <!-- MODAL  -->
    <div class="modal fade"id="Modal"tabindex="-1"role="dialog"aria-labelledby="exampleModalLabel"aria-hidden="true">
        <div class="modal-dialog modal-lg"role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary"id="exampleModalLabel">Confirmação de pagamento</h5>
                </div>
                <div class="modal-body bg-light">
<!--
                    <div class="card">
                        <div class="form-row ml-3 mr-3 mt-2">
                            <div class="form-group col">
                                <label for="input01">Quantidade</label>
                                <input type="text"class="form-control"id="input01"placeholder="1">
                            </div>
                            <div class="form-group col">
                                <label for="input02">Valor Unit.</label>
                                <input type="text"class="form-control"id="input02"placeholder="00,00">
                            </div>
                            <div class="form-group col">
                                <label for="input03">Valor Total</label>
                                <input type="text"class="form-control"id="input03"placeholder="00,00">
                            </div>
                        </div>
                        <div class="form-row m-3">
                            <div class="form-group col">
                                <p class="text-primary ml-3">a pagar RS <span id="value">0,00</span></p>
                            </div>
                            <div class="form-group col">
                            </div>
                            <div class="form-group col">
                                <button type="button"class="btn btn-success">Adicionar (ENTER)</button>
                            </div>
                        </div>
                    </div>
-->
                    <div class="card mt-2 border border-success">
                        <div class="form-row ml-3 mr-3 mt-2">
                            <div class="col">
                                <div class="form-group">
                                    <label>Data</label>
                                    <input type="text"class="form-control"placeholder="20/01/2021">
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Forma de pagamento</label>
                                    <input type="text"class="form-control"placeholder="Dinheiro"disabled>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Valor</label>
                                    <input type="text"class="form-control"placeholder="R$ 117,00"disabled>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">Ação<button type="button"class="btn btn-sm btn-success text-danger form-control">X</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-3 bg-white">Caso o valor recebido seja a maior, no final do PDV, terá o campo informando sobre o troco. </div>
                    <div class="card bg-info mt-3"style="border-radius: 0% 50px 50px 0%;">
                        <div class="row">
                            <div class="col text-center">
                                <p class="mt-2">Operador (F3)</p>
                                <p class="text-white">Vhsys</p>
                            </div>
                            <div class="bg-white mt-3"style="width:1px;height:50px;"></div>
                                <div class="col">
                                    <p class="mt-2">Pagamento</p>
                                    <p class="text-white">RS 120,00</p>
                                </div>
                                <div class="bg-white mt-3"style="width:1px;height:50px;"></div>
                                    <div class="col">
                                    <p class="mt-2">Troco</p>
                                    <p class="text-white">RS 3,00</p>
                                </div>
                                <div class="bg-white mt-3"style="width:1px;height:50px;"></div>
                                    <div class="col">
                                        <p class="mt-2">Total</p>
                                        <p class="text-white">RS 117,00</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    <!--  SUBSTITUA PELO SEU JQUERY  -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"crossorigin="anonymous"></script>
    <script> 

        //função que pega a tecla F8 
        $(document).ready(function(){ 
            $("body").keydown(function(key) { 
                if (key.which == 119) { // tecla F8
                    $('#Modal').modal('show'); 
                }
            });
        });
        // mesma função da tecla F8 sendo que apertando pelo botao
        function pg() {
            $('#Modal').modal('show');
        };
        // função do botao enviar, para gerar a tabela na área da direita
        function include() { 
            if( $('#x1').attr('style', '') ) { 
                $('#x1').attr('style', 'display:none'); 
            } 
            $('#x2').attr('style', 'width: 100%;');
        };
        // função do botao de excluir item que retira a tabela da area de visualização e retorna para o texto.
        function cancel() { 
            if( $('#x1').attr('style', 'display:none') ) { 
                $('#x1').attr('style', '');
            }
            $('#x2').attr('style', 'display:none');
        }; 

    </script>
</body>
</html>