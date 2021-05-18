<%-- 
   Document   : cuentasCaje
   Created on : 04/03/2020, 11:41:40 PM
   Author     : Alejandro-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <title>Inicio</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="assets/css/dh-navbar-inverse.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>

    <body style="background-image:url(&quot;assets/img/EIU.jpg&quot;);background-size:cover;padding:142px;">
        <%@ include file="/headerCajero.jsp" %>
        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">     

            <table class="table table-light">

                <thead  bgcolor="#000000" style="color:#FFFFFF" >
                    <tr>
                        <th></th>    
                        <th>     

                            <h1>
                                Gestión Cuentas
                                &nbsp;          &nbsp;
                                <buttom type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
                                    Si el cliente no es usuario click  AQUI!!! </buttom>
                                &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                <a  target="_blank" href="listarUser" type="button" class="btn btn-success" >
                                    Ver Usuarios </a>
                            </h1>


                        </th>  
                        <th>

                        </th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <div class="modal-header">
                                <br>  
                            </div>
                            <div>
                                <div >
                                    <h2>Agregar Cuenta</h2>
                                    <br>   
                                </div>
                                <div>

                                    <form class="" action="CuentasC" aling="center">
                                        <div>
                                            <h3>Número de Cédula del cliente:</h3>
                                            <input required type="number" class="form-control" name="cedClient" id="cedClient" placeholder="Cédula">
                                            <br>
                                            <br>
                                        </div> 

                                        <div class="selectpicker" >
                                            <h3>Moneda de la cuenta:</h3>
                                            <select class="form-control form-control-lg " name="moneda" id="moneda">
                                                <option value="1">Colones</option>
                                                <option value="2">Dolares</option>
                                                <option value="3">Euros</option>
                                            </select>
                                            <br>
                                            <br>
                                        </div>  
                                        <div class="form-group">
                                            <h3>Saldo inicial de la cuenta:</h3>
                                            <input disabled type="text" class="form-control" id="saldoIni" placeholder="0.00000">
                                            <br>
                                        </div>  
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Crear cuenta</button>
                                        </div>
                                    </form>
                                </div>
                            </div>  
                        </th>
                        <th></th>
                    </tr>
                    </tbody>
            </table>  

            <div  class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

                <div class="modal-dialog modal-dialog-centered" role="document">

                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Agregar Usuario</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <form action="CrearU"  method="post">
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="depositante">Nombre del Cliente</label>

                                    <input required type="text" class="form-control"  name="nom" id="nom" placeholder="Nombre">
                                </div>   

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Cedula del Cliente</label>
                                    <input  required type="number"  class="form-control"  name="ced" id="ced" placeholder="Cedula">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Número telefónico</label>
                                    <input type="number" class="form-control"  name="tel" id="tel" placeholder="Telefono">
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>

                                <button type="submit" class="btn btn-primary btn-block btn-lg btn-signin"
                                        style="color:rgb(0,0,0);background-color:rgb(255,255,255);background-image:url(&quot;assets/img/fondo verd.png&quot;);"
                                        >Agregar Usuario</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div
    </body>
</html>


