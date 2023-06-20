<%-- 
    Document   : c_Empleados
    Created on : 19/06/2023, 12:43:16 PM
    Author     : alber
--%>

<%@page import="modelos.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estilista"%>
<%@page import="datos.OperacionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%    
    OperacionBD operacion = new OperacionBD();
    operacion.conectar();
    
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión o Registrarse</title>
    <link rel="stylesheet" href="estilos.css">
    <script src="formulario.js"></script>
</head>
<body>
    <div id="formulario">        
            
        <script>mostrarFormulario('login');</script>
        
        <%
           
            if(request.getMethod().equalsIgnoreCase("post")){
                        String email = request.getParameter("email");
                        String contraseña = request.getParameter("contrasena");
                        if(email != null && !email.isEmpty() && contraseña != null && !contraseña.isEmpty()){
                            
                            if(email.contains("@barberia.com")&& operacion.validarCredencialesEstilista(email, contraseña)){
                              response.sendRedirect("control.jsp");
                            }else if(operacion.validarCredencialesCliente(email, contraseña)){
                                response.sendRedirect("index.jsp");
                            }else {
                                out.print("mamaste: correo o contraseña invalidos");
                            }
                        }
                        
            }
            


            if(request.getMethod().equalsIgnoreCase("post")){
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String email = request.getParameter("email_registro");
                String contraseña = request.getParameter("contrasena_registro");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
                String sexo = request.getParameter("sexo");
                        
                        if(nombre !=null && !nombre.isEmpty() 
                        && apellido !=null && !apellido.isEmpty()
                        && email != null && !email.isEmpty()
                        && contraseña != null && !contraseña.isEmpty()
                        && direccion != null && !direccion.isEmpty()
                        && telefono != null && !telefono.isEmpty()
                        && sexo != null && !sexo.isEmpty()){
                            
                            Cliente cliente = new Cliente();
                            cliente.setEmail(email);
                            cliente.setNombre(nombre);
                            cliente.setApellido(apellido);
                            cliente.setContraseña(contraseña);
                            cliente.setDireccion(direccion);
                            cliente.setTelefono(telefono);
                            cliente.setSexo(sexo);
                            
                            operacion.agregarCliente(cliente);
                            
                        }
                        
            }
        %>
        
        
        
        
    </div>
</body>
</html>

