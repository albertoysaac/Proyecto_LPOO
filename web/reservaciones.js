function hacerReservacion (seccion){
    if (seccion == "estilista"){
        document.getElementById('ventana_r').innerHTML = `
        <div id="SeleccionEstilista" >
            <h2>Selecciona un estilista</h2>
            <ul class="tarjetasE">
                
            </ul>
            <button id="btncontinuar" type="submit" class="volver_c">Continuar</button>
        </div>`;
        let btncontinuar = document.getElementById('btncontinuar');
        btncontinuar.addEventListener('click', function(){
            hacerReservacion('servicio');
        });
    }
    else if (seccion == "servicio"){
        document.getElementById('ventana_r').innerHTML = `
        <div id="SeleccionServicio" class="div-oculto">
                <h2>Selecciona un servicio</h2>
                <ul class="tarjetasS">
                    <%  
                        String q = "SELECT * FROM productos;";
                        ArrayList<Producto> productos = operacion.consultarProductos(q);
                        for (Producto producto : productos) {
                            out.print("<li class='producto'>"
                                + "<h2 class='nombre'>" + producto.getDescripcion() + "</h2>"
                                + "<p class='precio'>" + producto.getPrecio() + "</p>"
                                + "<a href='reservaciones.jsp?productoSeleccionado=" + producto.getId() + "'>Seleccionar</a>"
                                + "</li>");
                        }
                    %>
                </ul>
                <button id="btncontinuar" type="submit" class="volver_c">Continuar</button>
            </div>`;
    }
}