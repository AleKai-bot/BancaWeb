<%-- 
    Document   : users
    Created on : 08/04/2020, 12:22:03 PM
    Author     : Alejandro-PC
--%>

<%@page import="Logic.Usuarios"%>
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

        <%ArrayList<Usuarios> listMove = (ArrayList<Usuarios>) request.getSession().getAttribute("listUsers");%>

        <div class="container" style="color:#000000;background-image:url(&quot;assets/img/fondo verd.png&quot;);">

            <table class="table table-light">


                <thead  bgcolor="#000000" style="color:#FFFFFF" >

                    <tr>
                        <th></th>   
                        <th></th>    
                        <th>     
                            <h1>
                                Tabla de Usuarios
                            </h1>
                        </th>  
                        <th></th>
          
                    </tr>
                    <tr>
                        <th>Cedula</th>    
                        <th>Nombre</th>  
                        <th>Contraseña</th>
                        <th>Telefono</th>
                
                    </tr>
                </thead>

                <tbody>   

                    <% for (Usuarios de : listMove) {%>
                    <tr>
                        <td data-toggle="modal" data-target="#exampleModalCenter" name="num">
                            <%=de.getId()%>
                        </td>
                        <td> <%=de.getNombre()%></td>
                        <td> <%=de.getClave()%></td>
                        <td> <%=de.getTel()%></td>
                       
                    </tr>
                    <% }%> 

                </tbody>

        </div>
    </body>
</html>
