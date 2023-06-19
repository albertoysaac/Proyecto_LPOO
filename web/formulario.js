function mostrarFormulario(formulario) {
    if (formulario === 'login') {
        document.getElementById('formulario').innerHTML = `
            <h2>Iniciar sesión</h2>
            <form action="" method="post">
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
        `;
    } else if (formulario === 'registro') {
        document.getElementById('formulario').innerHTML = `
            <h2>Registrarse</h2>
            <form action="" method="post">
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
            </form>
        `;
    }
}
