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
    <div id="menuBtn">
    <img src="images/menu.png" id="menu">
  </div>
  <section id="banner">
    <img src="images/logo.png" class="logo">
    <nav>
      <a href="index.jsp" class="logo-link"><img src="images/logo.png" class="logo"></a>
    </nav>
    <div id="sideNav">
      <nav>
        <ul>
          <li><a href="#banner">RESERVAR</a></li>    
          <li><a href="#feature">CONSULTAR RESERVACION</a></li>        
        </ul>
      </nav>
    </div>
    <main>
      <div class="centered-section">
        <div class="ventana">
            <div id="seleccion">
                <h2>Bienvenido</h2>
                <button class="consulta">Consultar</button>
                <button class="reservacion">Reservar</button>
            </div>
            <div id="consulta" class="div-oculto">
                <h2>Consulta de reservaciones</h2>
                <form action="" method="post">
                    <label for="idReserva">ID de la reservación</label>
                    <input type="text" id="idReserva" name="idR" required>
                    <button type="submit" value="Consultar" >Consultar</button>
                </form>
                <%  
                    if(request.getMethod().equalsIgnoreCase("post")){
                        String idReservacion = request.getParameter("idR");
                        if(idReservacion != null && !idReservacion.isEmpty()){
                            Reservacion r = operacion.consultarReservacion(idReservacion);
                            operacion.consultarReservacion(idReservacion); 
                            
                            out.print("<div class='informacionConsulta'>");
                            out.print("<h2>"+r.getId()+"</h2>");
                            out.print("<h2>"+r.getNomCliente()+"</h2>");
                            out.print("<h2>"+r.getNomestilista()+"</h2>");
                            out.print("<h2>"+r.getProductos()+"</h2>");
                            out.print("</div>");
                        }
                        else{
                            out.print("No existe");
                        }
                    }
                %>                   
                <button class="volver_c">VOLVER</button>
            </div>
            <h2></h2>
            <div id="reservacion" class="div-oculto">
<div class="SeleccionEstilista" class="div-oculto">
    <h2>Selecciona un estilista</h2>
    <form action="" method="post">
        <ul>
            <% 
                ArrayList<Estilista> estilistas = operacion.consultarEstilistas();
                request.setAttribute("estilistas", estilistas);
                for (Estilista estilista : estilistas) {
            %>
            <li class='estilista' name='<%= estilista.getEmail() %>'>
                <input type="radio" id="estilista_<%= estilista.getEmail() %>" name="estilista" value="<%= estilista.getEmail() %>" required>
                <label for="estilista_<%= estilista.getEmail() %>">
                    <h3><%= estilista.getNombre() %></h3>
                    <p><%= estilista.getHorario() %></p>
                </label>
            </li>
            <% } %>
        </ul>
        <button type="submit" class="volver_c">Continuar</button>
    </form>
</div>

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
