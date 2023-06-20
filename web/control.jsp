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
                <div>

                <%
                    out.print("<h2>"+operacion.contarSexoClientes(email)+"</h2>");
                    %>



            </div>

                    <div>

                <%
                    out.print("<h2>"+operacion.selecProductoPop(email)+"</h2>");
                    %>



            </div>
                <div>
                <h2>Agregar Servicio</h2>
               <form action="agregarProducto.jsp" method ="post">
                    ID producto <input type="text" name="idP" size="15"></br></br>
                   Descripcion : <input type="text" name="desc" size="15"></br></br>
                  Precio: <input type="text" name="precio" size="15"></br></br>

                   <input type="submit" value="Agregar">
               </form>

           </div>

                    <div>
                        <table border width="800">
               <tr>
               <th>ID del Servicio</th><th>Descripcion</th><th>Precio</th>
               </tr>
         <%

            ArrayList<Producto> listap = new ArrayList<>();
            listap= operacion.consultarProductos("Select * from productos;");
            for(Producto producto : listap){
            out.print("<tr><td>"+producto.getId()+"</td>");
            out.print("<td>"+producto.getDescripcion()+"</td>");
            out.print("<td>"+producto.getPrecio()+"</td></tr>");
        }

           %>
                        </table>
                    </div>
                        
                     <div>
                    <%
                    out.print("<h2>"+operacion.calcularDineroCliente(email)+"</h2>");
                    %>

            </div>
                    
                        
        </body>
    </html> 
        

