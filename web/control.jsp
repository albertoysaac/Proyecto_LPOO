<%@page import="modelos.Reservacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estilista"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    OperacionBD operacion = new OperacionBD();
    operacion.conectar();
    HttpSession sesion = request.getSession();
    String email =(String) sesion.getAttribute("email");
    ArrayList<Reservacion> lista = new ArrayList<>();
    %>

    <html>
        <body>
            <div class="tablaR">
                <table border width="800">
                <tr>
                <th>ID de reservacion</th><th>Nombre del cliente</th><th>Telefono</th><th>Horario</th><th>Productos</th>
                </tr>

                <%
                    lista= operacion.consultarReservacionPorEmpleado(email);

                    for(Reservacion reservacion : lista){
                    out.print("<tr><td>"+reservacion.getId()+"</td>");
                    out.print("<td>"+reservacion.getNomCliente()+"</td>");
                    out.print("<td>"+reservacion.getTelefono()+"</td>");
                    out.print("<td>"+reservacion.getHorario()+"</td>");
                    out.print("<td>"+reservacion.getProductos()+"</td></tr>");
                }  
                %>
                </table>
            </div>
                <div 
                    
                        
        </body>
    </html> 
        

