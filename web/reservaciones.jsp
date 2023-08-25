
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
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
    Cliente usuario = (Cliente) sesion.getAttribute("usuario");
    usuario = operacion.consultarCliente(usuario.getEmail());
    ArrayList<Producto> productos = new ArrayList();
    Reservacion reservacion = new Reservacion();   
    Estilista estilista = new Estilista();
%>
<!DOCTYPE html>
<html lang="en">


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>reservaciones</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="reservaciones.css">
    <link src="java.js">


<body>
    <header id="banner">
        <img src="images/logo.png" class="logo">
    </header>

    <main>
        <div class="ventana_r">
            
            <div id="SeleccionEstilista" >
                <h2>Selecciona un estilista</h2>
                <div class = "cardContent">
                    <ul class="tarjetasE">
                        <% 
                            ArrayList<Estilista> estilistas = operacion.consultarEstilistas();
                            request.setAttribute("estilistas", estilistas);
                            Reservacion r = new Reservacion();
                            for (Estilista e : estilistas) {
                            LocalTime horaEntrada = LocalTime.parse(e.getHorarioEntrada());
                            LocalTime horaSalida = horaEntrada.plusHours(8);
                        %>
                            <li class='estilista-card'>
                                <img class='estilista-img' src='estilistas/<%= e.getNombre() %>.png' alt='<%= e.getNombre() %>'>
                                <div class='estilista-info'>
                                    <h2 class='nombre'><%= e.getNombre() %></h2>
                                    <p class='horario'><%= e.getHorarioEntrada()   %> - <%= horaSalida %></p>
                                    <a href='reservaciones.jsp?emailEstilista=<%= e.getEmail() %>&horarioEstilistaE=<%= e.getHorarioEntrada() %>&horarioEstilistaS=<%= horaSalida %>'>Seleccionar</a>
                                </div>
                            </li>
                        <% 
                            }
                        %>
                    </ul>
                </div>
            </div>
                
            <div id="SeleccionServicio" class="div-oculto">
                <h2>Selecciona los servicios</h2>
                <form id="formularioServicios" method="post">
                    <ul class="tarjetasS">
                        <%
                            
                            estilista = operacion.consultarEstilista(request.getParameter("emailEstilista"));
                               
                           
                            
                            productos = operacion.consultarProductos();
                            for (Producto producto : productos) {
                        %>
                            <li class='producto-card'>
                                <div class='producto-info'>
                                    <h2 class='nombre'><%= producto.getDescripcion() %></h2>
                                    <p class='precio'><%= producto.getPrecio() %></p>
                                    <label>
                                        <input type="checkbox" name="serviciosSeleccionados" value="<%= producto.getId() %>">
                                    </label>
                                </div>
                            </li>
                        <%
                            }
                        %>
                    </ul>
                    <button id="btn_Siguiente">Siguiente</button>
                </form>
            </div>

                
            <div id="SeleccionHorario" class="div-oculto">
                <h2>Selecciona un horario</h2>
                <div class="horarios">
                    <%
                            ArrayList<Reservacion> reservaciones = operacion.consultarReservacionPorEmpleado(estilista.getEmail());
                            HashMap<String, ArrayList<String>> horariosOcupados = new HashMap<>();
                        
                        for (Reservacion re : reservaciones) {
                            String tiempoEstimado = re.tiempoEstimado();
                            String fecha [] = re.getHorario().split(" ");
                            String day = fecha[0]; // Obtener el día de la fecha
                            String hour = fecha[1]; // Obtener la hora de la fecha
                            if (!horariosOcupados.containsKey(day)) {
                                ArrayList<String> horasOcupadas = new ArrayList<>();
                                horasOcupadas.add(hour);
                                horariosOcupados.put(day, horasOcupadas);
                            } else {
                                horariosOcupados.get(day).add(hour);
                            }
                        }
                        
                        // Obtener la hora de entrada y hora de salida del estilista
                        if(request.getMethod().equalsIgnoreCase("post")){
                            String horaDeEntrada = estilista.getHorarioEntrada();
                            String horaDeSalida = estilista.getHorarioSalida();
                            // Obtener la lista de días que se mostrarán
                            List<String> diasAMostrar = Arrays.asList("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");// Esto lo debes llenar con los días que quieras mostrar
                        
                        // Iterar sobre los días y mostrar los horarios
                        for (String day : diasAMostrar) {
                    %>
                            <div class="dia-horarios">
                                <label><%= day %></label>
                                <div class="horas-disponibles">
                                    <%
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                        Date horaInicio = sdf.parse(day + " " + horaDeEntrada);
                                        Date horaFin = sdf.parse(day + " " + horaDeSalida);
            
                                        while (horaInicio.before(horaFin)) {
                                            String hora = sdf.format(horaInicio);
                                            
                                            if (horariosOcupados.containsKey(day) && horariosOcupados.get(day).contains(hora)) {
                                                // Horario ocupado
                                    %>
                                                <button class="horario-ocupado"><%= hora %></button>
                                    <%
                                            } else {
                                                // Horario disponible
                                    %>
                                                <button class="horario-disponible"><%= hora %></button>
                                    <%
                                            }
                                            
                                            Calendar calendar = Calendar.getInstance();
                                            calendar.setTime(horaInicio);
                                            calendar.add(Calendar.HOUR, 1);
                                            horaInicio = calendar.getTime();
                                        }
                                    %>
                                </div>
                            </div>
                    <%
                        }
                    }
                    
                    %>
                </div>
            </div>
            <%
                if(request.getMethod().equalsIgnoreCase("post")){
                   
                    String horarioEstilista = request.getParameter("horarioEstilista");
                    String horario = request.getParameter("horario");
                    String[] serviciosSeleccionados = request.getParameterValues("serviciosSeleccionados");
                    
                    if (estilista.getEmail() != null && !estilista.getEmail().isEmpty()) {
                        if (serviciosSeleccionados != null && serviciosSeleccionados.length > 0) {
                            if (horario != null && !horario.isEmpty()) {
                                                    
                                for (String idProductoStr : serviciosSeleccionados) {
                                    int idProducto = Integer.parseInt(idProductoStr);
                                    Producto producto = operacion.consultarProducto(idProducto);
                                    productos.add(producto);
                                }
                                
                                operacion.reservacion(usuario.getEmail(), estilista.getEmail(), horario, productos);
            %>
                                <script>
                                    alert("Reservación realizada con éxito");
                                    window.location.href = "homeCliente.jsp";
                                </script>
            <%
                            } else {
                                // Realiza operaciones relacionadas con el horario
                            }
                        } else {
                            // Realiza operaciones relacionadas con la selección de servicios
                        }
                    } else {
                        // Realiza operaciones relacionadas con el estilista
                    }
                }
            %>
            <button id="btn_Siguiente">Siguiente</button>
            <button id="btn_Atras" class="div-oculto">Atras</button>
        </div>
    </main>
    <footer id="footer">
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
    </footer>
    <script src="java.js"></script>
</body>

</html>
<%
    operacion.desconectar();
%>


