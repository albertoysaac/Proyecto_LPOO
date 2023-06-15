<%-- 
    Document   : reservaciones
    Created on : 12/06/2023, 10:20:12 PM
    Author     : alber
--%>

<%@page import="modelos.Estilista"%>
<%@page import="modelos.Cliente"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    OperacionBD operacion = new OperacionBD();
     operacion.conectar();
    %>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <title>reservaciones</title>
        <link rel="stylesheet" href="reset.css">
        <link rel="stylesheet" href="reservaciones.css">
    </head>

    <body> 

        <header>
            <div class="header-box">
                
                <h1><img src="imagenes/logo.png" alt="Logo de la barber"></h1>
                
                <nav class="menu">
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="productos.html">Productos</a></li>
                        <li><a href="reservaciones.html">Reservaciones</a></li>
                    </ul>
                </nav> 
                
            </div>                       
        </header>

        <main>
            <div class="ventana">
                
                <div id="seleccion">
                    <h2>Bienvenido</h2>
                    <button class="consulta">Consultar</button>
                    <button class="reservacion">Reservar</button>
                </div>
                
                
                
                
                
                
                <div id="consulta" class="div-oculto">
                    
                    <h2>Consulta de reservaciones</h2>
                    <form action="datos_cliente">
                        <label for="idReserva">ID de la reservación</label>
                        <input type="text" id="idReserva" required>
                        <input class="enviar" type="submit" value="Consultar">
                        
                    </form>
                    <%
                        
                        %>
                    
                    <button class="volver_c">VOLVER</button>
                </div>
                
                        
                        
                        
                        
                        
                <div id="reservacion" class="div-oculto">
                    
                    <div class="datosDelCliente">
                        <h2>Datos del cliente</h2>
                        <form action="datos_cliente">
                            <label for="nombreyapellido">Nombre y Apellido</label>
                            <input type="text" id="nombreyapellido" required>
                            <label for="telefono">Teléfono</label>
                            <input type="tel" id="telefono" required>
                        </form>
                    </div>
                    
                    <div class="SeleccionEstilista" class="div-oculto">
                        <ul>
                            <%
                                
                                
                                ArrayList<Estilista> estilistas = operacion.consultarEstilistas();
                                
                                for(Estilista estilista: estilistas){
                                    out.print("<li><img src='imagenes/"+estilista.getId()+".jpg'><h2>"+estilista.getNombre()+"</h2><h2>"+estilista.getHorario()+"</h2><li>");
                                }
                        
                             %>
                        </ul>
                    </div>
                    
                    <div class="SeleccionServicio" class="div-oculto">
                        <!-- Aquí va el código para mostrar los servicios -->
                    </div>
                    
                    <div class="SeleccionHorario" class="div-oculto">
                        <!-- Aquí va el código para mostrar los horarios -->
                    </div>
                    <button class="volver_r">VOLVER</button>
                    <button class="siguiente">SIGUIENTE</button>
                </div>
                        
                        
                        
        </main>

        <footer>
            <img src="imagenes/logo-blanco.png" alt="Logo de la barber">
            <p>© 2023 Barber Shop. Todos los derechos reservados.</p>
        </footer>
        <script src="java.js"></script>
    </body>

</html>
<%
     operacion.desconectar();
    %>
