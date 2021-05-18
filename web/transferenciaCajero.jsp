<%-- 
    Document   : transferenciaCajero
    Created on : 04/03/2020, 11:09:47 PM
    Author     : Alejandro-PC
--%>


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

    <body  onload="clean()"  style="background-image:url(&quot;assets/img/EIU.jpg&quot;);background-size:cover;padding:142px;">


        <%
            ArrayList<Cuentas> listAccount = (ArrayList<Cuentas>) request.getSession().getAttribute("listarCuentasT");
        %>
        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">
            <%@ include file="headerCajero.jsp" %> 
            <table class="table table-light" id="myTable">
                <thead  bgcolor="#000000" style="color:#FFFFFF" >
                    <tr>
                        <th></th> 
                        <th align="center">

                            <div  align="center">
                                <h3>
                                    Transferencias  
                                </h3>
                            </div>
                        </th>
                        <th></th> 
                    </tr>

                    <tr>
                        <th>
                            <div align="center">
                                Cuentas

                            </div>
                        </th>
                        <th>
                            <script>
                                for (var space = 0; space < 15; space++) {
                                    document.write('&nbsp;');
                                }
                            </script>

                        </th>
                        <th >
                            <div align="center">
                                Tramite

                            </div>
                        </th>

                    </tr>
                </thead>

                <form action="Mtransferencia"  method="post">
                    <tbody>
                        <tr>
                            <td>
                                <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                    <table class="table table-light table-striped mb-0" >
                                        <thead  bgcolor="#000000" style="color:#FFFFFF" >

                                            <tr>
                                                <th>  
                                                    <div class="input-group">
                                                        <span id="basic-addon1" class="input-group-addon"><i class="fa fa-search"></i></span>
                                                        <input onkeyup="myFunction()" class="form-control" type="text" placeholder="Buscar" id="BuscarCliente" aria-describedby="basic-addon1" style="font-size:15px;">
                                                    </div>
                                                </th>    
                                                <th></th>  
                                                <th></th>  
                                                <th></th>  
                                            </tr>

                                            <tr>
                                                <th></th>    
                                                <th></th>  
                                                <th></th>  
                                                <th></th>  

                                            </tr>
                                        </thead>

                                        <tbody>  

                                            <tr>
                                                <th>Cuenta</th>    
                                                <th>Dueño</th>  
                                                <th>Saldo</th>
                                                <th>Moneda</th>
                                            </tr>

                                            <% for (Cuentas de : listAccount) {%>
                                            <tr>
                                                <td data-toggle="modal" data-target="#exampleModalCenter" name="numAccount">

                                                    <button class="btn btn-dark" onclick="mod('<%=de.getNumero()%>', '<%=de.getDueño()%>', '<%=de.getSaldo()%>', '<%=de.getMoneda().getNom()%>')" 
                                                            >
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
                                </div>

                            </td>
                            <td bgcolor="#000000"></td>

                            <td>
                                <table class="table table-light">

                                    <thead  bgcolor="#000000" style="color:#FFFFFF" >
                                        <tr>
                                            <th>Origen</th>       
                                            <th>Destino</th>  
                                        </tr>
                                    </thead>

                                    <tbody>

                                    <td>
                                        <table class="table table-light">

                                            <thead  bgcolor="#000000" style="color:#FFFFFF" >


                                                <tr>
                                                    <th></th>
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
                                                <tr>
                                                    <td  value="" name="a" id="a">
                                                        <input  size="4" id="ORI" name="ORI" type="text" value="">
                                                    </td>
                                                    <td value="" id="b"></td>
                                                    <td value="" id="c"></td>
                                                    <td value="" id="d"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>  

                                    <td>
                                        <table class="table table-light">
                                            <thead  bgcolor="#000000" style="color:#FFFFFF" >
                                                <tr>
                                                    <th></th>
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
                                                <tr>
                                                    <td  value="" name="e" id="e">
                                                        <input  size="4" id="DES" name="DES" type="text" value="">
                                                    </td>
                                                    <td value="" id="f"></td>
                                                    <td value="" id="g"></td>
                                                    <td value="" id="h"></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </td>
                                    <div align="center" class="form-group">
                                        <label for="exampleInputPassword1"> Motivo de Transferencia</label>
                                    </div>
                                    <div align="center" class="form-group">
                                        <textarea required placeholder="Motivo" name="Motivo" id="Motivo" rows="3" cols="50"></textarea>
                                    </div>
                                    <div align="center" class="form-group">
                                        <label for="exampleInputPassword1">Monto a Transferir</label>
                                        <input required type="number" class="form-control"  name="montoT" id="montoT" placeholder="Cantidad">
                                    </div>

                    </tbody>

            </table>
        </td>
        <tr bgcolor="#000000">
            <td >

            </td>
            <td> </td>
            <td> 
                <div align="center">
                    <button onclick="clean()" type="button" class="btn btn-lg btn-danger">Limpiar</button>
                    <button type="submit" id="realiza" class="btn btn-primary btn-lg">
                        Realizar Transferencia 
                    </button>
                </div>
            </td>
        </tr>
    </tbody>
</form>




</table>



</div
</body>
</html>


<script>

    var i = 1;

    function mod(a, b, c, d) {
        if (i === 1) {
            origen(a, b, c, d);
            i = 2;
        } else if (i === 2) {
            destino(a, b, c, d);
            i = 3;
        }
    }

    function origen(a, b, c, d) {
        document.getElementById("ORI").value = a;
        document.getElementById('b').innerHTML = b;
        document.getElementById('c').innerHTML = c;
        document.getElementById('d').innerHTML = d;
    }

    function destino(e, f, g, h) {
        document.getElementById("DES").value = e;
        document.getElementById('f').innerHTML = f;
        document.getElementById('g').innerHTML = g;
        document.getElementById('h').innerHTML = h;
        document.getElementById("realiza").disabled = false;
    }


    function clean() {

        document.getElementById("ORI").value = "";
        document.getElementById("DES").value = "";

        document.getElementById("montoT").value = "";
        document.getElementById("Motivo").value = "";

        document.getElementById('b').innerHTML = "";
        document.getElementById('c').innerHTML = "";
        document.getElementById('d').innerHTML = "";

        document.getElementById('f').innerHTML = "";
        document.getElementById('g').innerHTML = "";
        document.getElementById('h').innerHTML = "";

        i = 1;
        document.getElementById("realiza").disabled = true;
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