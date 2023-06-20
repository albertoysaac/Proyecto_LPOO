<%-- 
    Document   : login
    Created on : 19/06/2023, 04:19:39 PM
    Author     : alber
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estilista"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    OperacionBD operacion = new OperacionBD();
    operacion.conectar();
    
    String correoUsuario = (String) request.getAttribute("email");
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión o Registrarse</title>
    <link rel="stylesheet" href="estilos.css">
   
</head>
<body>
    
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
    
</body>
</html>
        

