<%-- 
    Document   : agregarVinculo
    Created on : 27/03/2020, 12:23:36 PM
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
        <%@ include file="header.jsp" %> 

        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">

            <div >

                <div align="center" >
                    <h2>
                        Agregar Cuenta a Vinculadas
                    </h2>
                    <br>
                    <hr>     
                </div>
                <div  style="color:#FFFFFF;background-color:#000000;">
                    <br>
                    
                    <form action="veriVincu" method="post" aling="center">

                        <div>
                            <h3>Número de Cuenta del Beneficiario</h3>
                            <input required type="number" class="form-control" name="accBen" id="accBen" placeholder="Cuenta">
                            <br>
                            <br>
                        </div> 

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Verificar Vinculo</button>
                        </div>

                    </form>
                </div>

                <hr> 
                <br>

            </div>

        </div>

    </body>
</html>
