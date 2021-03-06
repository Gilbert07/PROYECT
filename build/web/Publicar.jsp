<%-- 
    Document   : Publicar
    Created on : 14/07/2017, 05:52:47 PM
    Author     : Leonardo
--%>

<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Proyecto.Bean.*"%>
<%@page import="Utils.Conexion"%>
<!DOCTYPE html>
<html lang="en">
<%
    HttpSession misesion = request.getSession();
    if (misesion.getAttribute("User") == null) {%>
<script>location.replace("index.jsp");</script>
<% } else { %>
<%!
    BeanCliente BE = new BeanCliente();

%>
    <%
        BE = (BeanCliente) misesion.getAttribute("User");
        
        Conexion Cnx = new Conexion();
        Connection Conn = null;
        Statement Puente = null;
        ResultSet Rs = null;
        Conn = Cnx.ObtenerConexion();
        Puente = Conn.createStatement();
    %>
    
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Machine Space</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/shop-homepage.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Catalogo.jsp">Catalogo</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="Publicar.jsp">Publica Un Anuncio</a>
                        </li>
                        <li>
                            <a href="#">Mis Favoritos</a>
                        </li>
                        <li>
                            <a href="#">Mis Anuncios</a>
                        </li>
                        <li>
                            <a href="#">Mis Mensajes</a>
                        </li>
                        <li>
                            <a href="Editar_Datos_Cliente.jsp">Mi Perfil</a>
                        </li>
                        <li>
                            <a></a>
                        </li>
                        <li>
                            <a></a>
                        </li>
                        <li>
                            <a></a>
                        </li>
                        <li>
                            <a></a>
                        </li>
                        <li>
                            <a></a>
                        </li>
                        <li>
                            <a></a>
                        </li>
                        
                         <li>
                            <label  style="color:white" aligh="center">Bienvenido :<br> <%=BE.getNombre() + " "%><%=BE.getApellido() + " "%><%=BE.getRol()%></label>
                        </li>
                        <li>
                            <a></a>
                        </li>
                        <li>
                            <button name="btnCerrarSesion" id="btnCerrarSesion" class="btn btn-danger" onclick="Cerrar()">Cerrar Sesion</button>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

    <center>
        <h2>Registrar Producto</h2><br><br> 
        <!-- Form Name -->           
        <form method="post" class="form-horizontal"  enctype="multipart/form-data" action="SubirProducto.jsp"> 


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="NombreProducto">Nombre Del Producto</label>  
                <div class="col-md-4">
                    <input id="NombreProducto" name="Nombre" type="text" placeholder="Nombre Producto" class="form-control input-md" required>    
                </div>
            </div><br>



            <div class="form-group">
                <label class="col-md-4 control-label" for="Descripcion">Descripcion</label>  
                <div class="col-md-4">
                    <textarea id="Descripcion" name="Descripcion" type="" placeholder="Descripcion" class="form-control input-md" required></textarea>    
                </div>
            </div><br>

            <div class="form-group">
                <label class="col-md-4 control-label" for="Precio">Precio</label>  
                <div class="col-md-4">
                    <input id="Precio" name="Precio" type="number" placeholder="Precio" class="form-control input-md" required>    
                </div>
            </div><br>

            <div class="form-group">
                <label class="col-md-4 control-label" for="Imagen">Imagen</label>  
                <div class="col-md-4">
                    <input id="Precio" name="Imagen" type="file" placeholder="Imagen" class="form-control input-md" required>    
                </div>
            </div><br>

            <div class="form-group">
                <label class="col-md-4 control-label" for="Marca">Marca</label> 
                <div class="col-md-4">
                    <select id="Marca" name="Marca" class="form-control"><br>
                        <%
                            try {

                                Rs = Puente.executeQuery("select * from Marca");
                                while (Rs.next()) {
                        %>

                        <option value="<%=Rs.getString("Marca")%>"><%=Rs.getString("Marca")%></option>
                        <%
                            }
                        } catch (Exception e) {
                        %>
                        <option value="">No se encontró ningun dato</option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div><br>

            <div class="form-group">
                <label class="col-md-4 control-label" for="Categoria">Categoria</label> 
                <div class="col-md-4">
                    <select id="Categoria" name="Categoria" class="form-control"><br>
                        <%
                            try {

                                Rs = Puente.executeQuery("select * from categorias");
                                while (Rs.next()) {
                        %>

                        <option value="<%=Rs.getString("Categoria")%>"><%=Rs.getString("Categoria")%></option>
                        <%
                            }
                        } catch (Exception e) {
                        %>
                        <option value="">No se encontró ningun dato</option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div><br>

            <div class="form-group">
                <label class="col-md-4 control-label" for="Deporte">Deporte</label> 
                <div class="col-md-4">
                    <select id="Deporte" name="Deporte" class="form-control"><br>
                        <%
                            try {

                                Rs = Puente.executeQuery("select * from deporte");
                                while (Rs.next()) {
                        %>

                        <option value="<%=Rs.getString("Deporte")%>"><%=Rs.getString("Deporte")%></option>
                        <%
                            }
                        } catch (Exception e) {
                        %>
                        <option value="">No se encontró ningun dato</option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div><br>

            <div class="form-group">
                <label class="col-md-3 control-label" for="Vender"></label>
                <div class="col-md-3">
                    <button id="Vender" name="Vender" class="btn btn-success">Vender
                        <input type="hidden" name="textOpcion" value="1"></button>
                </div>
            </div>
            
            
             <script>

                    function Cerrar() {
                        window.location.href = "index.jsp?cerrar=true";
                    }

                    function noRegresar() {
                        window.location.hash = "no-back-button";
                        window.location.hash = "Again-No-back-button"//chrome;
                        window.onhashchange = function () {
                            window.location.hash = "no-back-button";
                        }

                    }
                </script>

            <script type="text/javascript"></script>

        </form> 
                    
                    <%
                    }

                    %>
                    
        <% if (request.getAttribute("error") != null) { %>
        ${error}
        <% } else {%>
        ${exito}
        <% }%>
    </center>

    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>MachineSpace</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->

    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
