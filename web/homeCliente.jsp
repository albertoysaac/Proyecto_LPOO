<%-- 
    Document   : homeCliente
    Created on : 19/06/2023, 09:31:34 PM
    Author     : alber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String email =(String) sesion.getAttribute("email");
%>
<html>
    
    <head>
        <title>Barber Shop Website Design - Easy Tutorials</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700;900&display=swap" rel="stylesheet"> 
    </head>

    <body>


        <section id="banner3">
    <div class="banner3-text">
        <h1>Haz tu Reserva</h1>
        <div class="banner3-btn">
            <a href="reservaciones.jsp"><span></span>Reserva</a>
        </div>
    </div>
</section>

        <section id="service">
            <div class="title-text">
            <p>SERVICIOS</p>    
            <h1>NUESTROS SERVICIOS</h1>
            </div>
            <div class="service-box">
                <div class="single-service">
                    <img src="images/pic-1.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Cortes de Cabello</h3>
                        <hr>
                        <p>Nuestro equipo de expertos estilistas te proporcionará descripciones detalladas de cada estilo, acompañadas de imágenes inspiradoras para ayudarte a 
                        encontrar el corte de cabello perfecto para ti.</p>
                    </div>
                </div>
                <div class="single-service">
                    <img src="images/pic-2.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Corte de Barba</h3>
                        <hr>
                        <p> Nuestro equipo de expertos en cuidado de la barba te brinda una guía completa sobre los cortes más populares y las tendencias más recientes en el mundo del cuidado facial masculino.</p>
                    </div>
                </div>
                <div class="single-service">
                    <img src="images/pic-3.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>-------------------------</h3>
                        <hr>
                        <p>----------------------------</p>
                    </div>
                </div>
                <div class="single-service">
                    <img src="images/pic-4.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>-------------------------------------------</h3>
                        <hr>
                        <p>----------------------------------------------------</p>
                    </div>
                </div>
                <div class="single-service">
                    <img src="images/pic-1.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Cortes de Cabello</h3>
                        <hr>
                        <p>Nuestro equipo de expertos estilistas te proporcionará descripciones detalladas de cada estilo, acompañadas de imágenes inspiradoras para ayudarte a 
                        encontrar el corte de cabello perfecto para ti.</p>
                    </div>
                </div>
                <div class="single-service">
                    <img src="images/pic-2.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Corte de Barba</h3>
                        <hr>
                        <p> Nuestro equipo de expertos en cuidado de la barba te brinda una guía completa sobre los cortes más populares y las tendencias más recientes en el mundo del cuidado facial masculino.</p>
                    </div>
                </div>
                <div class="single-service">
                    <img src="images/pic-3.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>-------------------------</h3>
                        <hr>
                        <p>----------------------------</p>
                    </div>
                </div>
                <div class="single-service">
                    <img src="images/pic-4.jpg">
                    <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>-------------------------------------------</h3>
                        <hr>
                        <p>----------------------------------------------------</p>
                    </div>
                </div>

        </section>   

   
        <section id="footer">
            <img src="images/footer-img.png" class="footer-img">
            <div class="title-text">
            <p>CONTACTO</p>    
            <h1>Visitanos Hoy</h1>
            </div>
        <div class="footer-row">
        <div class="footer-left">
            <h1>Horario</h1>
            <p><i class="fa fa-clock-o"></i>Lunes a Viernes - 9am to 9pm</p>
            <p><i class="fa fa-clock-o"></i>Sabados y Domingos - 8am to 11pm</p>
        </div>    
        <div class="footer-right">
            <h1>Ubicacion</h1>
            <p>Av Sor Juana Inés de La Cruz 22-interior 4a, Tlalnepantla Centro, 54000 Tlalnepantla de Baz, Méx.<i class="fa fa-map-marker"></i></p>
            <p>barbershop@website.com<i class="fa fa-paper-plane"></i></p>
            <p>+525575925995<i class="fa fa-phone"></i></p>
        </div>    
        </div>    

        <div class="social-links">
            <i class="fa fa-facebook"></i>
            <i class="fa fa-instagram"></i>
            <i class="fa fa-twitter"></i>
            <i class="fa fa-youtube-play"></i>
            <p>© 2023 Barber Shop. Todos los derechos reservados.</p>
        </div>

        </section>   

    </body>
</html>
