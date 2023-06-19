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
                    
                    <div class="datosDelCliente">
                        <h2>Datos del cliente</h2>
                        <form action="" method="post" >
                            <label for="nombreyapellido">Nombre y Apellido</label>
                            <input type="text" name="nombreyapellido" required>
                            <label for="telefono">Teléfono</label>
                            <input type="tel" name="telefono" required>
                            <button class="siguiente" type="submit" value="SIGUIENTE"></button>
                        </form>
                        <%
                            
                            if(request.getMethod().equalsIgnoreCase("post")){
                                String nya = request.getParameter("nombreyapellido");
                                String telefono = request.getParameter("telefono");

                                if(nya != null && !nya.isEmpty() && telefono != null && !telefono.isEmpty() ){
                                    Cliente cliente = new Cliente();
                                    cliente.setNombre(nya);
                                    cliente.setTelefono(telefono);
                                    operacion.agregarCliente(cliente);
                                }
                            }
                            
                        %>
                    </div>
                    
                    
                    
                    
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