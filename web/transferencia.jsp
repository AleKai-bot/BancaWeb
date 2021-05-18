<%-- 
    Document   : transferencia
    Created on : 04/03/2020, 07:01:15 PM
    Author     : Alejandro-PC
--%>

<%@page import="Model.ModelCuenta"%>
<%@page import="Logic.Vinculos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logic.Cuentas"%>
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


    <%
        ArrayList<Vinculos> listAccount = (ArrayList<Vinculos>) request.getSession().getAttribute("listaVinculos");

    %>


    <body style="background-image:url(&quot;assets/img/EIU.jpg&quot;);background-size:cover;padding:142px;">

        <%@ include file="header.jsp" %> 


        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">



            <div>
                <table id="myTable" class="table table-light">
                    <thead  bgcolor="#000000" style="color:#FFFFFF" >
                        <tr>
                            <th></th>    
                            <th>     
                                <h1>
                                    Transferencias de Usuario

                                </h1>
                            </th>  

                            <th>


                            </th>
                        </tr>


                     
                        <tr>
                            <th>
                                <h3>
                                    Tabla de Vinculos 
                                </h3>

                            </th>

                            <th>
                                <div class="input-group">
                                    <span id="basic-addon1" class="input-group-addon"><i class="fa fa-search"></i></span>
                                    <input  onkeyup="myFunction()" class="form-control" type="text" placeholder="Busqueda de Clientes por Filtro" id="BuscarCliente" aria-describedby="basic-addon1" style="font-size:15px;">
                                </div>

                            </th>

                            <th>
                                <div>
                                    <a href="agregarVinculo.jsp" class="btn btn-success" role="button">Agregar Cuenta a Favoritas</a>
                                </div>
                                
                            </th>
                   
                        </tr>

                        <tr>
                          
                            <th>Cuenta</th>    
                            <th>Dueño</th>  
                            <th>Moneda</th>
                        </tr>

                    </thead>

                    <tbody>   

                        <% for (Vinculos de : listAccount) {%>
                        <tr>
                            <td  onclick="pop('<%=ModelCuenta.buscarCuenta(de.getBeneficiario()).getNumero()%>')" data-toggle="modal" data-target="#exampleModalCenter"> 

                                <a class="btn btn-info" >

                                    <%=ModelCuenta.buscarCuenta(de.getBeneficiario()).getNumero()%>  
                                </a>

                            </td>
                            <td>  
                                <%=ModelCuenta.buscarCuenta(de.getBeneficiario()).getDueño()%>   
                            </td>

                            <td>
                                <%=ModelCuenta.buscarCuenta(de.getBeneficiario()).getMoneda().getNom()%>   
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

            </div>

        </div>

        <!-- Modal de Deposito -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div  class="modal-dialog modal-dialog-centered" role="document">
                <div action="" class="modal-content">
                    <div class="modal-header">

                        <h3>Detalle de Tranferencia</h3>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>

                    <form action="Utransferencia"  method="post">

                        <div class="modal-body">

                            <div class="form-group">
                                <label for="depositante">Cuenta Origen</label>
                                <input  type="text" class="form-control"  name="ORI" id="ORI" placeholder="Nombre">
                            </div> 

                            <div>
                                <label for="depositante">Detalle</label>
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Motivo" name="Motivo" id="Motivo" rows="3" cols="50"></textarea>
                            </div> 


                            <div class="form-group">
                                <label for="depositante">Numero de Cuenta a Beneficio</label>
                                <input  type="text" class="form-control"  name="DES" id="DES" placeholder="">
                            </div> 


                            <div class="form-group">
                                <label for="exampleInputPassword1">Monto a Depositar</label>
                                <input type="text" class="form-control"  name="montoT" id="montoT" placeholder="Cantidad">
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary btn-block btn-lg btn-signin"
                                    style="color:rgb(0,0,0);background-color:rgb(255,255,255);background-image:url(&quot;assets/img/fondo verd.png&quot;);"
                                    >Transferir</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>

<script>

    function pop(a) {
        document.getElementById("DES").value = a;
        document.getElementById("DES").readOnly = true;
    }

    function myFunction() {
        var input, filter, table, tr, td, i, txtValue, txtAux, tdAux;
        input = document.getElementById("BuscarCliente");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            tdAux = tr[i].getElementsByTagName("td")[1];
            if (td || tdAux) {
                txtValue = td.textContent || td.innerText;
                txtAux = tdAux.textContent || tdAux.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1 || txtAux.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }



</script>