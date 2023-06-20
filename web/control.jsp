<%@page import="modelos.Reservacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estilista"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    OperacionBD operacion = new OperacionBD();
    operacion.conectar();
    String correoUsuario = (String) request.getAttribute("email");
    ArrayList<Reservacion> lista = new ArrayList<>(operacion.consultarReservacionPorEmpleado(correoUsuario));
    
    %>

    <html>
        <body>
            table border width="800">
               <tr>
               <th>ID de reservacion</th><th>Nombre del cliente</th><th>Telefono</th><th>Horario</th><th>Productos</th>
               </tr>
            
            <%
            for(Reservacion reservacion : lista){
            out.print("<tr><td>"+reservacion.getId()+"</td>");
            out.print("<td>"+reservacion.getNomCliente()+"</td>");
            out.print("<td>"+reservacion.getTelefono()+"</td>");
            out.print("<td>"+reservacion.getHorario()+"</td>");
            out.print("<td>"+reservacion.getProductos()+"</td></tr>");
                }  
          %>
            </table>
          
        </body>
    </html> 
        

