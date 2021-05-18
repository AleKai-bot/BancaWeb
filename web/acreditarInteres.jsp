<%-- 
    Document   : acreditarInteres
    Created on : 04/03/2020, 06:58:40 PM
    Author     : Alejandro-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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

        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">

            <div  style="color:#FFFFFF;background-color:#000000;">
                <br>
                <div align="center" >
                    <h2>
                        Acreditar intereses
                    </h2>
                    <br>
                    <hr>     
                </div>
                <div >
                    <br>
                    <form action="interes" method="post" aling="center">

                        <div>
                            <h2><u>Porcentaje de Acreditacion</u></h2>

                         
                            <h3>
                                En este sistema bancario la acreditación de 
                                los intereses funciona de la sieguiente manera:
                                   <br>
                                <br>
                                Colones: cobra un 8% de interes
                                <br>
                                Dolares: cobra un 15% de interes
                                <br>
                                Euros: cobra un 25% de interes
                            </h3>

                            <br>
                            <br>
                        </div> 

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Acreditar</button>
                        </div>
                    </form>
                </div>
            </div>

            <div>
                <br>
            </div>

        </div>

    </body>
</html>

