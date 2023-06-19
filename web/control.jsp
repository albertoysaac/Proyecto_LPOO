<%-- 
    Document   : login
    Created on : 19/06/2023, 04:19:39 PM
    Author     : alber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión o Registrarse</title>
    <link rel="stylesheet" href="estilos.css">
    <script>
        function mostrarFormulario(formulario) {
            if (formulario === 'login') {
                document.getElementById('registro').style.display = 'none';
                document.getElementById('login').style.display = 'block';
            } else if (formulario === 'registro') {
                document.getElementById('login').style.display = 'none';
                document.getElementById('registro').style.display = 'block';
            }
        }
    </script>
</head>
<body>
    <h2>Iniciar sesión</h2>
    <div id="login">
        <form action="login.jsp" method="post">
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" required>
            </div>
            <div>
                <input type="submit" value="Iniciar sesión">
            </div>
            <div>
                <p>¿No tienes una cuenta? <a href="javascript:void(0);" onclick="mostrarFormulario('registro')">Regístrate aquí</a></p>
            </div>
        </form>
    </div>

    <h2>Registrarse</h2>
    <div id="registro" style="display: none;">
        <form action="registro.jsp" method="post">
            <div>
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>
            <div>
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>
            </div>
            <div>
                <label for="email_registro">Email:</label>
                <input type="email" id="email_registro" name="email_registro" required>
            </div>
            <div>
                <label for="contrasena_registro">Contraseña:</label>
                <input type="password" id="contrasena_registro" name="contrasena_registro" required>
            </div>
            <div>
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required>
            </div>
            <div>
                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" required>
            </div>
            <div>
                <input type="submit" value="Registrarse">
            </div>
            <div>
                <p>¿Ya tienes una cuenta? <a href="javascript:void(0);" onclick="mostrarFormulario('login')">Inicia sesión aquí</a></p>
            </div>
        </

