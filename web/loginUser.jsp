<%-- 
    Document   : loginUser
    Created on : 09/03/2020, 11:45:46 PM
    Author     : Alejandro-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/Google-Style-Login.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="assets/css/dh-navbar-inverse.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>

    <body style="background-image:url(&quot;assets/img/EIU.jpg&quot;);background-size:cover;padding:142px;">


        <nav class="navbar navbar-light navbar-expand-md navigation-clean navbar-inverse navbar-fixed-top" color="BLACK">
            <div class="container">

                <a class="navbar-brand" href="#" style="padding:0px;margin-left:0px;height:78px;">
                    <img class="img-fluid" src="assets/img/flor.png" />
                </a>
                <div
                    class="collapse navbar-collapse" >
                    <ul class="nav navbar-nav ml-auto" style="margin-top:13px;">
                        <li class="nav-item" role="presentation">
                            <h2>Inicio de Sesion del Cliente...</h2>
                        </li>
                </div>
            </div>
        </nav>

        <div class="login-card" style="background-position:center;padding:27px;background-color:rgb(0,0,0);">
            <img src="assets/img/ava.png" class="profile-img-card" />
            <p class="profile-name-card"> </p>


            <form  action="Login" method="post" class="form-signin">
                
                <input class="form-control" type="text" required="" placeholder="USER" autofocus="" id="inputEmail" name="username">
                <input class="form-control" type="password" required="" placeholder="PASS" name= "pass" id="inputPassword">
                <button type="submit" class="btn btn-primary btn-block btn-lg btn-signin"
                        
                        style="color:rgb(0,0,0);background-color:rgb(255,255,255);background-image:url(&quot;assets/img/fondo verd.png&quot;);"
                       
                        >Iniciar Sesión</button>
            </form>

            <br>
            <a  class="forgot-password" style="color:rgb(255,255,255);">Olvidó su contraseña?</a>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
