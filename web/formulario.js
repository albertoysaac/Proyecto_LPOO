function mostrarFormulario(formulario) {
    if (formulario === 'login') {
        document.getElementById('formulario').innerHTML = `
            <h2>Iniciar sesión</h2>
            <form class='formulario' action="" method="post">
                    <label class='label' for="email">Email:</label>
                    <input class='inputemail' type="email" id="email" name="email" required>
                    <label class='label' for="contrasena">Contraseña:</label>
                    <input class='contra' type="password" id="contrasena" name="contrasena" required>
                    <button class='buton_iniciar_sesion' type="submit" value="Iniciar sesión">Iniciar sesión</button>

                    <p>¿No tienes una cuenta? <a href="javascript:void(0);" onclick="mostrarFormulario('registro')">Regístrate aquí</a></p>
                
            </form>
        `;
    } else if (formulario === 'registro') {
        document.getElementById('formulario').innerHTML = `
            <h2>Registrarse</h2>
            <form action="" method="post">
                
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required>
                    <label for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" required>
                    <label for="email_registro">Email:</label>
                    <input type="email" id="email_registro" name="email_registro" required>
                    <label for="contrasena_registro">Contraseña:</label>
                    <input type="password" id="contrasena_registro" name="contrasena_registro" required>
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" required>
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" required>
                    <label for="telefono">Teléfono:</label>
                    <select name="sexo" id="sexo">
                        <option value="Hombre">Hombre</option>
                        <option value="Mujer">Mujer</option>
                        <option value="otro">otro</option>
                    </select>
                    <button type="submit" value="Registrarse">Registrarse</button>
                    
                    <p>¿Ya tienes una cuenta? <a href="javascript:void(0);" onclick="mostrarFormulario('login')">Inicia sesión aquí</a></p>
                
            </form>
        `;
    }
}
