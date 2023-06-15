const ventana = document.querySelector(".ventana");

const opcion = document.querySelector("#seleccion");
const btn_consultar = document.querySelector(".consulta");
const btn_reservar = document.querySelector(".reservacion");

const div_consulta = document.querySelector("#consulta");
const btn_volver = document.querySelector(".volver_c");

const div_reservacion = document.querySelector("#reservacion");
const div_datosCliente = document.querySelector(".datosDelCliente");
const div_estilistas = document.querySelector(".SeleccionEstilista");
const div_servicios = document.querySelector(".SeleccionServicio");
const div_horario = document.querySelector(".SeleccionHorario");
const btn_volver2 = document.querySelector(".volver_r");
const btn_siguiente = document.querySelector(".siguiente");

btn_consultar.addEventListener("click", function() {
    div_consulta.style.display = "block";
    opcion.style.display = "none";
});

btn_reservar.addEventListener("click", function() {
    div_reservacion.style.display = "block";
    opcion.style.display = "none";
});

btn_volver.addEventListener("click", function() {
    div_consulta.style.display = "none";
    opcion.style.display = "block";
});

btn_volver2.addEventListener("click", function() {
    if(div_datosCliente.style.display === "block"){
        div_consulta.style.display = "none";
        opcion.style.display = "block";
    }else if(div_estilistas.style.display === "block"){
        div_datosCliente.style.display = "block";
        div_estilistas.style.display = "none";
    }else if(div_servicios.style.display === "block"){
        div_estilistas.style.display = "block";
        div_servicios.style.display = "none";
    }else if(div_horario.style.display === "block"){
        div_servicios.style.display = "block";
        div_horario.style.display = "none";
    }   
});

btn_siguiente.addEventListener("click", function() {
    if(div_datosCliente.style.display === "block"){
        div_datosCliente.style.display = "none";
        div_estilistas.style.display = "block";
    }else if(div_estilistas.style.display === "block"){
        div_estilistas.style.display = "none";
        div_servicios.style.display = "block";
    }else if(div_servicios.style.display === "block"){
        div_servicios.style.display = "none";
        div_horario.style.display = "block";
    }else if(div_horario.style.display === "block"){
        div_horario.style.display = "none";
        div_datosCliente.style.display = "block";
    }   
});