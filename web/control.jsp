<%@page import="modelos.Producto"%>
<%@page import="modelos.Reservacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estilista"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    OperacionBD operacion = new OperacionBD();
    operacion.conectar();
    HttpSession sesion = request.getSession();
    String email = (String) sesion.getAttribute("email");
    ArrayList<Reservacion> lista = new ArrayList<>();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>Consultas</title>
    <link rel="stylesheet" href="style.css">
</head>

<html>
<body>
    <section id="banner4">
        <div class="container">
            <div class="tablaR">            
                <div class="title2-text">    
                    <h1>RESERVACIONES</h1>
                </div>
                <table border width="800">
                    <tr>
                        <th>ID de reservacion</th><th>Nombre del cliente</th><th>Telefono</th><th>Horario</th><th>Productos</th>
                    </tr>

                    <%-- Iterar sobre la lista de reservaciones y mostrar los datos --%>
                    <% lista = operacion.consultarReservacionPorEmpleado(email);
                    for (Reservacion reservacion : lista) {
                        out.print("<tr><td>" + reservacion.getId() + "</td>");
                        out.print("<td>" + reservacion.getNomCliente() + "</td>");
                        out.print("<td>" + reservacion.getTelefono() + "</td>");
                        out.print("<td>" + reservacion.getHorario() + "</td>");
                        out.print("<td>" + reservacion.getProductos() + "</td></tr>");
                    } %>
                </table>
            </div>
            <br>
            <div class="title2-text">    
                <h1>CLIENTES POR GÉNERO</h1>
            </div>
            <div>
                <%-- Mostrar la cantidad de clientes por género --%>
                <% out.print("<h2>" + operacion.contarSexoClientes(email) + "</h2>"); %>
            </div>
            <br>
            <div class="title2-text">    
                <h1>SERVICIO MÁS SOLICITADO</h1>
            </div>
            <div>
                <%-- Mostrar el servicio más solicitado --%>
                <% out.print("<h2>" + operacion.selecProductoPop(email) + "</h2>"); %>
            </div>
            <br>
            <div class="title2-text">    
                <h1>AGREGAR SERVICIO</h1>
            </div>
            <%-- Agregar un servicio --%>
            <div style="text-align: center;">
                <form action="agregarProducto.jsp" method="post">
                    ID producto <input type="text" name="idP" size="15"><br><br>
                    Descripcion: <input type="text" name="desc" size="15"><br><br>
                    Precio: <input type="text" name="precio" size="15"><br><br>
                    <input type="submit" value="Agregar">
                </form>
            </div>

            <br>
            <div class="title2-text">  
            <%-- Visualizar la tabla de Servicios --%>
                <h1>TABLA DE SERVICIOS</h1>
            </div>
            <div>
                <table border width="800">
                    <tr>
                        <th>ID del Servicio</th><th>Descripcion</th><th>Precio</th>
                    </tr>

                    <%-- Consultar la lista de productos y mostrarlos en la tabla --%>
                    <% ArrayList<Producto> listap = new ArrayList<>();
                    listap = operacion.consultarProductos("Select * from productos;");
                    for (Producto producto : listap) {
                        out.print("<tr><td>" + producto.getId() + "</td>");
                        out.print("<td>" + producto.getDescripcion() + "</td>");
                        out.print("<td>" + producto.getPrecio() + "</td></tr>");
                    } %>
                </table>
            </div>
            <br>
            <div class="title2-text">    
                <h1>CLIENTE MÁS FIEL</h1>
            </div>
            <div>
                <%-- Calcular el dinero del cliente más fiel y mostrarlo --%>
                <% out.print("<h2>" + operacion.calcularDineroCliente(email) + "</h2>"); %>
            </div>
        </div>  
    </section>
</body>
</html>
        

