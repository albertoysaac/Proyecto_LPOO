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
    <script src="java.js"></script>
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
            <div id="SeleccionEstilista" >
                <h2>Selecciona un estilista</h2>
                <ul class="tarjetasE">
                    <% 
                        ArrayList<Estilista> estilistas = operacion.consultarEstilistas();
                        request.setAttribute("estilistas", estilistas);
                        for (Estilista estilista : estilistas) {
                            out.print("<li class='estilista'>"
                                + "<h2 class='nombre'>" + estilista.getNombre() + "</h2>"
                                + "<p class='horario'>" + estilista.getHorario() + "</p>"
                                + "<a href='reservaciones.jsp?emailEstilista=" + estilista.getEmail() + "&horarioEstilista=" + estilista.getHorario() + "'>Seleccionar</a>"
                                + "</li>");
                        }
                    %>
                </ul>
                <button class="continuar" type="submit" class="volver_c">Continuar</button>
            </div>
            <div id="SeleccionServicio" class="SeleccionEstilista" class="div-oculto">
                <h2>Selecciona un servicio</h2>
                <ul class="tarjetasS">
                    <%  
                        String q = "SELECT * FROM productos;";
                        ArrayList<Producto> productos = operacion.consultarProductos(q);
                        for (Producto producto : productos) {
                            out.print("<li class='producto'>"
                                + "<h2 class='nombre'>" + producto.getDescripcion() + "</h2>"
                                + "<p class='precio'>" + producto.getPrecio() + "</p>"
                                + "<a href='reservaciones.jsp?productoSeleccionado=" + producto.getId() + "'>Seleccionar</a>"
                                + "</li>");
                        }
                    %>
                </ul>
                <button class="continuar" type="submit" class="volver_c">Continuar</button>
            </div>
                
            <div id="SeleccionHorario">
                <h2>Selecciona un horario</h2>    
                <form class="horarios" action="reservaciones.jsp" method="post">
                    <label for="hora">Hora: </label>
                    <input type="text" id="hora" name="hora" pattern="(0[8-9]|1[0-7]):[0-5][0-9]" placeholder="HH:MM" required min="08:00" max="18:00">
                    <button class="btn_horario" type="submit">Continuar</button>
                </form>
            </div>
            
            <%
                String estilista = request.getParameter("emailEstilista");
                int servicio = Integer.parseInt(request.getParameter("productoSeleccionado"));
                String horario = request.getParameter("hora");
                int idReservacion = operacion.obtenerUltimaReservacionId();
                if (estilista != null && !estilista.isEmpty() && servicio != null && !servicio.isEmpty() && horario != null && !horario.isEmpty()) {
                    operacion.reservacionp1(email, estilista, horario);
                    
                    operacion.reservacionp2(idReservacion, servicio);
                    out.print("Email del estilista seleccionado: " + estilista);
                } else {
                    out.print("No se ha seleccionado ningún estilista.");
                }
            %>
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


