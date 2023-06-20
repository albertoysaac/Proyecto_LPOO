const ventana = document.querySelector(".ventana_r");

const div_estilistas = document.querySelector(".SeleccionEstilista");
const div_servicios = document.querySelector(".SeleccionServicio");
const div_horarios = document.querySelector(".SeleccionHorario");

const btn_continuar = document.querySelector(".continuar");
const btn_siguiente = document.querySelector(".siguiente");

btn_continuar.addEventListener("click", function() {
    
    if (getComputedStyle(div_estilistas).display !== "none") {
        div_servicios.style.display = "block";
        div_estilistas.style.display = "none";
    } else if (getComputedStyle(div_servicios).display === "block") {
        div_horarios.style.display = "block";
        div_estilistas.style.display = "none";
    } else if (getComputedStyle(div_horarios).display === "block") {
        div_estilistas.style.display = "block";
        div_servicios.style.display = "none";
    }
});

btn_volver_r.addEventListener("click", function() {
    
    if (getComputedStyle(div_datosCliente).display === "block") {
        opcion.style.display = "block";
        div_datosCliente.style.display = "none";
    } else if (getComputedStyle(div_estilistas).display === "block") {
        div_datosCliente.style.display = "block";
        div_estilistas.style.display = "none";
    } else if (getComputedStyle(div_servicios).display === "block") {
        div_estilistas.style.display = "block";
        div_servicios.style.display = "none";
    } else if (getComputedStyle(div_horario).display === "block") {
        div_servicios.style.display = "block";
        div_horario.style.display = "none";
    }
});

btn_siguiente.addEventListener("click", function() {
    if (getComputedStyle(div_datosCliente).display === "block") {
        div_datosCliente.style.display = "none";
        div_estilistas.style.display = "block";
    } else if (getComputedStyle(div_estilistas).display === "block") {
        div_estilistas.style.display = "none";
        div_servicios.style.display = "block";
    } else if (getComputedStyle(div_servicios).display === "block") {
        div_servicios.style.display = "none";
        div_horario.style.display = "block";
    } else if (getComputedStyle(div_horario).display === "block") {
        div_horario.style.display = "none";
        div_datosCliente.style.display = "block";
    }
});