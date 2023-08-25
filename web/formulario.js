function mostrarFormulario(formulario) {
    if (formulario === 'login') {
        document.getElementById('formulario').innerHTML = `
            <h2 class='titulo'>Iniciar sesión</h2>
            <form class='formulario' action="" method="post">
                <div class='div'>
                    <label class='label' for="email">Email:</label>
                    <input class='input' type="email" id="email" name="email" required>
                </div>

                <div class='div'>
                    <label class='label' for="contrasena">Contraseña:</label>
                    <input class='input' type="password" id="contrasena" name="contrasena" required>
                </div>

                <div class='div'>
                    <button class='buton_iniciar_sesion' type="submit" value="Iniciar sesión">Iniciar sesión</button>
                    <p>¿No tienes una cuenta? <a href="javascript:void(0);" onclick="mostrarFormulario('registro')">Regístrate aquí</a></p>
                </div>
            
            </form>
        `;
        return false;
    } else if (formulario === 'registro') {
        document.getElementById('formulario').innerHTML = `
            <h2>Registrarse</h2>
            <form class = 'formulario2' action="" method="post">

                <div class='div'>
                    <label class='label' for="nombre">Nombre:</label>
                    <input class='input' type="text" id="nombre" name="nombre" required>
                </div>

                <div class='div'>
                    <label class='label' for="apellido">Apellido:</label>
                    <input class='input' type="text" id="apellido" name="apellido" required>
                </div>

                <div class='div'>
                    <label class='label' for="email_registro">Email:</label>
                    <input class='input' type="email" id="email_registro" name="email_registro" required>
                </div>

                <div class='div'>
                    <label class='label' for="contrasena_registro">Contraseña:</label>
                    <input class='input' type="password" id="contrasena_registro" name="contrasena_registro" required>
                </div>

                <div class='div'>
                    <label class='label' for="direccion">Dirección:</label>
                    <input class='input' type="text" id="direccion" name="direccion" required>
                </div>

                <div class='div'>
                    <label class='label' for="telefono">Teléfono:</label>
                    <input class='input' type="tel" id="telefono" name="telefono" required>
                </div>

                <div class='div'>
                    <label class='label' for="telefono">Teléfono:</label>
                    <select name="sexo" id="sexo">
                        <option value="Hombre">Hombre</option>
                        <option value="Mujer">Mujer</option>
                        <option value="otro">otro</option>
                    </select>
                </div>
                <button class='buton_registro' type="submit" value="Iniciar sesión">Registrarse</button>
                
                <p>¿Ya tienes una cuenta? <a href="javascript:void(0);" onclick="mostrarFormulario('login')">Inicia sesión aquí</a></p>
                
            </form>
        `;
    }
}

function alerta(){
    alert("Correo o contraseña invalidos");
}
