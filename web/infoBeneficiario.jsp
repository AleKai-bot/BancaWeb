<%-- 
    Document   : infoBeneficiario
    Created on : 27/03/2020, 12:43:04 PM
    Author     : Alejandro-PC
--%>

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

    <body onload="mod()" style="background-image:url(&quot;assets/img/EIU.jpg&quot;);background-size:cover;padding:142px;">
        <%@ include file="header.jsp" %> 

        <%
            Cuentas acc = (Cuentas) request.getSession().getAttribute("acco");
            Usuarios user = (Usuarios) request.getSession().getAttribute("user");
        %>

        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">



            <div align="center" >
                <h2>
                    Informacion de Cliente Benefiario
                </h2>
                <br>
                <hr>     
            </div>
            <div   style="color:#FFFFFF;background-color:#000000;" >

                <form action="creaVincu" aling="center">
                    <br>
                    <div>
                        <h3>Número de Cedula del Beneficiario</h3>
                        <input type="text" class="form-control"  value="<%=user.getId()%>" name="cedB" id="cedB" placeholder="Cedula">
                        <br>
                        <br>
                    </div> 

                    <div>
                        <h3>Nombre del Beneficiario</h3>
                        <input type="text" class="form-control" value="<%=user.getNombre()%>" name="nomB" id="nomB" placeholder="Nombre">
                        <br>
                        <br>
                    </div> 

                    <div>
                        <h3>Número de Cuenta del Beneficiario</h3>
                        <input type="text" class="form-control" value="<%=acc.getNumero()%>" name="cuenB" id="cuenB" placeholder="Cuenta">
                        <br>
                        <br>    
                    </div> 


                    <div class="modal-footer">

                        <a href="iniTransfe" class="btn btn-danger" role="button"> Cancelar Vinculo</a>

                        <button type="submit" class="btn btn-primary"> Agregar Vinculo </button>

                    </div>
                </form>
                <br>


            </div>

            <br>
            <br>    

            </body>
            </html>

            <script>

                function mod() {
                    document.getElementById("cedB").readOnly = true;
                    document.getElementById("nomB").readOnly = true;
                    document.getElementById("cuenB").readOnly = true;
                }


            </script>

