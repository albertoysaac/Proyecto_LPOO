<%@page import="modelos.Producto"%>
<%@page import="modelos.Reservacion"%>
<%@page import="modelos.Estilista"%>
<%@page import="modelos.Cliente"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
    OperacionBD operacion = new OperacionBD();
    operacion.conectar();
    
    HttpSession sesion = request.getSession();
    String email =(String) sesion.getAttribute("email");
    %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>reservaciones</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header id="banner">
        <img src="images/logo.png" class="logo">
        <div id="sideNav">
            <nav>
                <ul>
                    <li><a href="#banner">RESERVAR</a></li>    
                    <li><a href="#feature">CONSULTAR RESERVACION</a></li>        
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div class="ventana_r">
            <div class="SeleccionEstilista">
                <h2>Selecciona un estilista</h2>
                <ul class="tarjetasE">
                    <% 
                        ArrayList<Estilista> estilistas = operacion.consultarEstilistas();
                        request.setAttribute("estilistas", estilistas);
                        for (Estilista estilista : estilistas) {
                            out.print("<li class='estilista'>"
                                + "<h2 class='nombre'>" + estilista.getNombre() + "</h2>"
                                + "<p class='horario'>" + estilista.getHorario() + "</p>"
                                + "<a href='control.jsp?emailEstilistaSeleccionado=" + estilista.getEmail() + "'>Seleccionar</a>"
                                + "</li>");
                    }
                    %>
                    </ul>
                <button type="submit" class="volver_c">Continuar</button>
            </div>
            <div class="SeleccionServicio">
                <h2>Selecciona un servicio</h2>
                <ul class="tarjetasS">
                    <% 
                        ArrayList<Producto> productos = operacion.consultarProductos();
                        for (Producto producto : productos) {
                            out.print("<li class='producto'>"
                                + "<h2 class='nombre'>" + producto.getDescripcion() + "</h2>"
                                + "<p class='precio'>" + producto.getPrecio() + "</p>"
                                + "<a href='control.jsp?productoSeleccionado=" + producto.getId() + "'>Seleccionar</a>"
                                + "</li>");
                    }
                    %>
                </ul>
                <button type="submit" class="volver_c">Continuar</button>
            </div>
            <div class="SeleccionHorario">
                <h2>Selecciona un horario</h2>
                <ul class="tarjetasH">
                    <% 
                        ArrayList<Reservacion> reservaciones = operacion.consultarReservaciones();
                        for (Reservacion reservacion : reservaciones) {
                            out.print("<li class='reservacion'>"
                                + "<h2 class='nombre'>" + reservacion.getHorario() + "</h2>"
                                + "<p class='precio'>" + reservacion.getNomCliente() + "</p>"
                                + "<a href='control.jsp?horarioSeleccionado=" + reservacion.getHorario() + "'>Seleccionar</a>"
                                + "</li>");
                    }
                    %>
                </ul>
                <button type="submit" class="volver_c">Continuar</button>
            </div>

        
        </div>
        </main>

        <section id="footer">
            <img src="images/footer-img.png" class="footer-img">
            <div class="title-text">
                <p>CONTACTO</p>    
                <h1>Visítanos Hoy</h1>
            </div>
            <div class="footer-row">
                <div class="footer-left">
                    <h1>Horario</h1>
                    <p><i class="fa fa-clock-o"></i>Lunes a Viernes - 9am a 9pm</p>
                    <p><i class="fa fa-clock-o"></i>Sábados y Domingos - 8am a 11pm</p>
                </div>    
                <div class="footer-right">
                    <h1>Ubicación</h1>
                    <p>Av Sor Juana Inés de La Cruz 22-interior 4a, Tlalnepantla Centro, 54000 Tlalnepantla de Baz, Méx.<i class="fa fa-map-marker"></i></p>
                    <p>barbershop@website.com<i class="fa fa-paper-plane"></i></p>
                    <p>+525575925995<i class="fa fa-phone"></i></p>
                </div>    
            </div>    
            <div class="social-links">
                <i class="fa fa-facebook"></i>
                <i class="fa fa-instagram"></i>
                <i class="fa fa-twitter"></i>
                <i class="fa fa-youtube-play"></i>
                <p>© 2023 Barber Shop. Todos los derechos reservados.</p>
            </div>
            
        </section>

    <script src="java.js"></script>
</body>

</html>
<%
    operacion.desconectar();
%>
