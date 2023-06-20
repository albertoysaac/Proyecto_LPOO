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
        <link rel="stylesheet" href="reset.css">
        <link rel="stylesheet" href="reservaciones.css">
    </head>

    <body> 

        <section id="banner">
    <img src="images/logo.png" class="logo">
    <div class="banner-text">
        <h1>Gornik & Drucker Barbery</h1>
        <p>Los mejores productos</p>
        <div class="banner-btn">
            <a href="reservaciones.jsp"><span></span>Reserva</a>
            <a href="login.jsp"><span></span>Login</a>
        </div>
    </div>
</section>

        
        
        
        
        
        
        <main>
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
                    <button type="submit" value="Consultar"></button>
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
                        <ul>
                            <%
                                ArrayList<Estilista> estilistas = operacion.consultarEstilistas();
                                request.setAttribute("estilistas", estilistas);
                                        
                                for (Estilista estilista : estilistas) {
                                  out.print("<li class='estilista' name='"+estilista.getEmail()+"'>");
                                  out.print("<h2>"+ estilista.getNombre() + "</h2>");
                                  out.print("<h2>" + estilista.getHorario() + "</h2>");
                                  out.print("</li>");
                                }
                            %>
                        </ul>
                    </div>
                    
                    <div class="SeleccionServicio" class="div-oculto">
                        
                        <%
                                                
                        %>
                        
                    </div>
                    
                    <div class="SeleccionHorario" class="div-oculto">
                        <!-- Aquí va el código para mostrar los horarios -->
                    </div>
                        
                    <button class="volver_r">VOLVER</button>
                    
                    
                </div>
                        
                        
                        
        </main>

        <section id="footer">
    <img src="images/footer-img.png" class="footer-img">
    <div class="title-text">
    <p>CONTACTO</p>    
    <h1>Visitanos Hoy</h1>
    </div>
<div class="footer-row">
<div class="footer-left">
    <h1>Horario</h1>
    <p><i class="fa fa-clock-o"></i>Lunes a Viernes - 9am to 9pm</p>
    <p><i class="fa fa-clock-o"></i>Sabados y Domingos - 8am to 11pm</p>
</div>    
<div class="footer-right">
    <h1>Ubicacion</h1>
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