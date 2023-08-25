document.addEventListener("DOMContentLoaded", iniciar);
const ventana = document.querySelector(".ventana_r");
const div_estilistas = document.querySelector("#SeleccionEstilista");
const div_servicios = document.querySelector("#SeleccionServicio");
const div_horarios = document.querySelector("#SeleccionHorario");
const btn_Continuar = document.querySelectorAll("#btn_Siguiente");
const btn_Atras = document.querySelectorAll(".btn_Atras");


function iniciar() {
    if(div_estilistas != null && div_servicios != null && div_horarios != null){

            btn_Continuar.forEach(btn_Continuar => {
            btn_Continuar.addEventListener("click", function() {
            if(!div_estilistas.classList.contains("div-oculto")){
                div_estilistas.classList.add("div-oculto");
                div_servicios.classList.remove("div-oculto");
                btn_Continuar.classList.remove("div-oculto");
            }
            else if(!div_servicios.classList.contains("div-oculto")){
                div_servicios.classList.add("div-oculto");
                div_horarios.classList.remove("div-oculto");
            }

            });
        });
    }
}

