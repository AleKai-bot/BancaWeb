<%-- 
    Document   : header
    Created on : 04/03/2020, 10:54:08 PM
    Author     : Alejandro-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logic.Usuarios"%>
<!DOCTYPE html>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="assets/css/dh-navbar-inverse.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<nav class="navbar navbar-light navbar-expand-md navigation-clean navbar-inverse navbar-fixed-top" color="BLACK">
    <div class="container">

        <a class="navbar-brand" href="#" style="padding:0px;margin-left:0px;height:78px;">
            <img class="img-fluid" src="assets/img/flor.png" />
        </a>
        <div
            class="collapse navbar-collapse" >
            <ul class="nav navbar-nav ml-auto" style="margin-top:13px;">

               <% Usuarios u = (Usuarios)request.getSession().getAttribute("usuario"); %>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="homeUser.jsp" uk-scroll="offset:50">Bienvenid@ <%=u.getNombre()%></a>
                </li>

                <li class="nav-item" role="presentation">
                    <a class="nav-link"  href="iniTransfe" uk-scroll="offset:50">Transferencias</a>
                </li>
                
                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="CuentasU" uk-scroll="offset:50">Cuentas</a>
                </li>
        </div>

        <a href="Logout" class="btn btn-danger btn-lg">
            <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>

    </div>
</nav>

