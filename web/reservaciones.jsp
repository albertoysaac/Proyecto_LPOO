<%-- 
    Document   : reservaciones
    Created on : 12/06/2023, 10:20:12 PM
    Author     : alber
--%>

<%@page import="datos.Cliente"%>
<%@page import="datos.Estilista"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="Ventana">
                <div class="seleccion">
                    <h2>Reservaciones</h2>
                    <input type="button" value="Constultar reservacion">
                    <input type="button" value="Hacer una reservacion">
                </div>
                <div class="consulta">
                    <h2>Consulta de reservaciones</h2>
                    <form action="datos_cliente">
                        <label id="descripcion" for="idReserva">ID de la reservacion</label>
                        <input type="text" id="idReserva" required>
                        <input class="enviar" type="submit" value="Consultar">
                    </form>
                </div>
                <div class="reservacion">
                    <div class="datos del cliente">
                        <h2>Datos del cliente</h2>
                        <form action="datos_cliente">
                            <label id="descripcion" for="nombreyapellido">Nombre y Apelldo</label>
                            <input type="text" id="nombreyapellido" required>
                            <label id="descripcion" for="telefono">Telefono</label>
                            <input type="tel" id="telefono" required>
                        </form>
                    </div>
                    <div class="SeleccionEstilista">
                        <ul>
                        <%
                            OperacionBD operacion = new OperacionBD();
                            ArrayList<Estilista> estilistas = operacion.consultarEstilistas();
                            for (Estilista estilista : estilistas) {
                                String nombre = estilista.getNombre();
                                Time horario = estilista.getHorario();
                                out.println("<li><div class="tarjeta">
                                    <img src='imagenes/' alt=''>
                                    <h2>" + nombre + "</h2>
                                    <p>Horario: " + horario + "</p>
                                    <input type='button' value='Seleccionar'>
                                </div></li>");
                            }
                        %>
                        </ul>
                    </div>

                    <div class="SeleccionServicio">
                    </div>

                    <div class="SeleccionHorario">
                    </div>


                </div>

            </div>


            
        </main>


    <footer>
        <img src="imagenes/logo-blanco.png" alt="Logo de la barber">
        <p>© 2023 Barber Shop. Todos los derechos reservados.</p>
    </footer>
    </body>

</html>
