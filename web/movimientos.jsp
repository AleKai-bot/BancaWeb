<%-- 
    Document   : movimientos
    Created on : 20/03/2020, 12:03:15 PM
    Author     : Alejandro-PC
--%>
<%@page import="Logic.Cuentas"%>
<%@page import="Logic.Movimientos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="assets/css/dh-navbar-inverse.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body style="background-image:url(&quot;assets/img/EIU.jpg&quot;);background-size:cover;padding:142px;">

        <%ArrayList<Movimientos> listMove = (ArrayList<Movimientos>) request.getSession().getAttribute("listMove");%>

        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">



            <table id="myTable" class="table table-light">

                <thead  bgcolor="#000000" style="color:#FFFFFF" >

                    <tr>
                        <th></th>   
                        <th></th>    
                        <th>     
                            <h1>
                                Tabla de Movimientos
                            </h1>
                        </th>  
                        <th>  
                            <div class="input-group">
                                <span id="basic-addon1" class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input onkeyup="myFunction()" class="form-control" type="text" placeholder="Filtrar por Fecha" id="BuscarCliente" aria-describedby="basic-addon1" style="font-size:15px;">
                            </div>
                        </th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>ID</th>    
                        <th>Fecha</th>  
                        <th>Accion</th>
                        <th>Cuenta</th>
                        <th>Dueño</th>
                    </tr>
                </thead>

                <tbody>   

                    <% for (Movimientos de : listMove) {%>
                    <tr>
                        <td data-toggle="modal" data-target="#exampleModalCenter" name="num">
                            <%=de.getId()%>
                        </td>
                        <td> <%=de.getFecha()%></td>
                        <td> <%=de.getAccion()%></td>
                        <td> <%=de.getCuenta()%></td>
                        <td> <%=de.getUser()%></td>
                    </tr>
                    <% }%> 
                </tbody>
            </table>
        </div>
    </body>
</html>


<script>
    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("BuscarCliente");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>