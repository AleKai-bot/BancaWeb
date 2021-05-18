<%-- 
    Document   : cuentasClient
    Created on : 04/03/2020, 06:59:00 PM
    Author     : Alejandro-PC
--%>

<%@page import="Logic.Movimientos"%>
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

        <%
            ArrayList<Cuentas> listAccount = (ArrayList<Cuentas>) request.getSession().getAttribute("listAccount");
        %>

        <%@ include file="/header.jsp" %> 

        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">

            <table id="myTable" class="table table-light">

                <thead  bgcolor="#000000" style="color:#FFFFFF" >

                    <tr>
                        <th></th>    
                        <th>     
                            <h1>
                                Cuentas y Movimientos
                            </h1>
                        </th>  
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>
                            <div class="input-group">
                                <span id="basic-addon1" class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input  onkeyup="myFunction()" class="form-control" type="text" placeholder="Busqueda de Clientes por Filtro" id="BuscarCliente" aria-describedby="basic-addon1" style="font-size:15px;">
                            </div>
                        </th>
                        <th></th>
                        <th></th>
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
                        <td data-toggle="modal" data-target="#exampleModalCenter"  name="numAccount" > 

                            
                            
                            <a  class="btn btn-dark" target="_blank"  href="listaMoves?id=<%=de.getNumero()%>">
                                <%=de.getNumero()%>   
                            </a>

                        </td>
                        <td> <%=de.getDueño()%></td>
                        <td> <%=de.getSaldo()%></td>
                        <td> <%=de.getMoneda().getNom()%></td>
                    </tr>
                    <% }%>

                </tbody>
            </table>

        </div>




    </body>
</html>



<script>
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