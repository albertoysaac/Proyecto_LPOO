<%-- 
    Document   : index
    Created on : 8/06/2023, 01:50:23 AM
    Author     : alber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    
    <head>

        <meta charset="UTF-8"> 
        <meta name="viewport" content="width=device-width">
        <title>Barbería Alura</title>
        <link rel="stylesheet" href="reset.css">
        <link rel="stylesheet" href="style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Noto+Serif:ital,wght@1,400;1,700&display=swap" rel="stylesheet">
    
    </head>

    <body>

        <header>
            <div class="encabezado">

                <div class="contenedor_img">
                    <img src="imagenes/logo.png" alt="Logo de la barber">
                </div>

                <nav class="menu">
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="productos.html">Productos</a></li>
                        <li><a href="reservaciones.html">Reservaciones</a></li>
                    </ul>
                </nav> 
        
            </div> 
        </header>
        <main>
            <img id="banner" src="banner/banner.jpg">
            <div class="gradiente">
                <section class="principal">

                    <h2 class="titulo-centralizado">Sobre la Barbería Alura</h2>

                    <img class="utensilios" src="imagenes/utensilios.jpg" alt="utensilios de barberia">

                    <p>Ubicada en el corazón de la ciudad, la <strong>Barbería Alura</strong> trae para el mercado lo que hay de mejor para su cabello y barba. Fundada en 2020, la Barbería Alura ya es destaque en la ciudad y conquista nuevos clientes diariamente.</p>

                    <p id="mision"><em>Nuestra misión es: <strong>"Proporcionar autoestima y calidad de vida a nuestros clientes"</strong>.</em></p>

                    <p>Ofrecemos profesionales experimentados que están constantemente observando los cambios y movimiento en el mundo de la moda, para así ofrecer a nuestros clientes las últimas tendencias. El atendimiento posee un padrón de excelencia y agilidad, garantizando calidad y satisfacción de nuestros clientes.</p> 

                </section>

                <section class="mapa">
                    <h2 class="titulo-principal">Nuestra Ubicacion</h2>
                    <p>Nos encontramos ubicados en el corazon de la ciudad</p>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7524.993431953112!2d-99.13539240621205!3d19.43413965383354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2smx!4v1685392457853!5m2!1ses-419!2smx" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>


                </section>

                <section class="diferenciales">

                    <h3 class="titulo-centralizado">Diferenciales</h3>
                    <div class="contenido">
                        <ul class="lista-diferenciales">
                            <li class="items">Atención personalizada a los clientes</li>
                            <li class="items">Profesesionales calificados</li>
                            <li class="items">Espacio diferenciado</li>
                            <li class="items">Localización</li>
                            <li class="items">Puntualidad</li>
                            <li class="items">Tecnologia</li>
                            <li class="items">Limpieza</li>
                        </ul>
                        
                        <img src="diferenciales/diferenciales.jpg" class="imagenDiferenciales">
                    </div>
                </section>

                <section>
                    <div class="video">
                        <iframe width="auto" height="315" src="https://www.youtube.com/embed/8pWtdanVz3I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>
                </section>
            </div>
        </main>
        <footer>
            <img src="imagenes/logo-blanco.png" alt="Logo de la barber">
            <p>© 2023 Barber Shop. Todos los derechos reservados.</p>
        </footer>
        
    </body>

</html>
