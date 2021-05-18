<%-- 
    Document   : deposito
    Created on : 04/03/2020, 06:59:13 PM
    Author     : Alejandro-PC
--%>

<%@page import="Model.ModelUsuario"%>
<%@page import="Logic.Usuarios"%>
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

    <body style="background-image:url(&quot;assets/img/EIU.jpg&quot;);background-size:cover;padding:142px;">

        <%@ include file="headerCajero.jsp" %> 

        <%
            ArrayList<Cuentas> listAccount = (ArrayList<Cuentas>) request.getSession().getAttribute("listarCuentas");

        %>

        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">

            <table id="myTable" class="table table-light">

                <thead  bgcolor="#000000" style="color:#FFFFFF" >
                    <tr>
                        <th></th>    
                        <th>     
                            <h1>
                                Deposito
                            </h1>
                        </th>  
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>
                            <div class="input-group">
                                <span id="basic-addon1" class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input onkeyup="myFunction()" class="form-control" type="text" placeholder="Busqueda de Clientes por Filtro" id="BuscarCliente" aria-describedby="basic-addon1" style="font-size:15px;">
                            </div>
                        </th>
                        <th></th>
                        <th>

                        </th>
                        <th></th>
                    </tr>

                    <tr>
                        <th>Cuenta</th>    
                        <th>Dueño</th>  
                        <th>Saldo</th>
                        <th>Moneda</th>
                    </tr>

                </thead>

                <tbody>   

                    <% for (Cuentas de : listAccount) {%>
                    <tr>
                        <td >
                            <button data-toggle="modal" data-target="#exampleModalCenter" name="numAccount" class="btn btn-dark"  onclick="mod('<%=de.getNumero()%>', '<%=  ModelUsuario.buscarUsuario(de.getDueño()).getNombre()%>')" >
                                <%=de.getNumero()%> 
                            </button>

                        </td>
                        <td> <%=de.getDueño()%></td>
                        <td> <%=de.getSaldo()%></td>
                        <td> <%=de.getMoneda().getNom()%></td>

                    </tr>
                    <% }%>

                </tbody>
            </table>

            <!-- Modal de Deposito -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div  class="modal-dialog modal-dialog-centered" role="document">
                    <div action="" class="modal-content">
                        <div class="modal-header">

                            <h3>Detalle de Deposito</h3>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>

                        </div>

                        <form action="depositoSaldo"  method="post">
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="depositante">Nombre del Dueño</label>
                                    <input type="text" class="form-control"  name="nom" id="nom" placeholder="Nombre">
                                </div>  

                                <div class="form-group">
                                    <label for="depositante">Numero de Cuenta</label>
                                    <input  type="text" class="form-control"  name="num" id="num" placeholder="Numero">
                                </div>   

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Monto a Depositar</label>
                                    <input required type="number" class="form-control"  name="monto" id="monto" placeholder="Cantidad">
                                </div>

                                <div>
                                    <label for="depositante">Detalle</label>
                                </div>
                                <div class="form-group">
                                    <textarea required placeholder="Motivo" name="Motivo" id="Motivo" rows="3" cols="50"></textarea>
                                </div> 


                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                <button type="submit" class="btn btn-primary btn-block btn-lg btn-signin"
                                        style="color:rgb(0,0,0);background-color:rgb(255,255,255);background-image:url(&quot;assets/img/fondo verd.png&quot;);"
                                        >Depositar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>



        </div>
    </body>
</html>


<script>

    function mod(a, b) {
        document.getElementById("nom").value = "";
        document.getElementById("nom").readOnly = true;
        document.getElementById("nom").value = b;
        document.getElementById("num").value = "";
        document.getElementById("num").readOnly = true;
        document.getElementById("num").value = a;
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