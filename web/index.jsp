<%-- 
    Document   : index
    Created on : 20/06/2023, 03:50:23 AM
    Author     : Equipo 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700;900&display=swap" rel="stylesheet"> 
</head>

<body>
    <section id="banner">
        <%-- Mostrar el banner y nombre de la barberia --%>
        <img src="images/logo.png" class="logo">
        <div class="banner-text">
            <h1>Gornik & Drucker Barbery</h1>
            <p>Los mejores productos</p>
            <div class="banner-btn">
                <a href="login.jsp"><span></span>Login</a>
            </div>
        </div>
    </section>
    
    <section id="feature">
        <%-- bloque "nuestras caracterizticas" --%>
        <div class="title-text">
            <p>CONOCENOS</p>    
            <h1>Que es lo que nos caracteriza</h1>
        </div> 
        <div class="feature-box">
            <div class="features">

                <h1>Personal Experimentado</h1>
                <div class="features-desc">
                    <div class="feature-icon">
                        <i class="fa fa-shield"></i>
                    </div>

                    <div class="feature-text">
                        <p>Nuestra barberia cuenta con el mejor personal, cada uno con años.</p>
                    </div>
                </div>

                <h1>Reservar en Linea</h1>
                <div class="features-desc">
                    <div class="feature-icon">
                        <i class="fa fa-check-square-o"></i>
                    </div>

                    <div class="feature-text">
                        <p>Haz tu reservacion a traves de nuestra pagina.</p>
                    </div>
                </div>

                <h1>Los Mejores Productos</h1>
                <div class="features-desc">
                    <div class="feature-icon">
                        <i class="fa fa-inr"></i>
                    </div>

                    <div class="feature-text">
                        <p>Nuestros productos son desarrollados con el cliente siempre en el centro y están formulados utilizando solo las mejores mezclas de esencias naturales.
                        Nuestra línea de productos para el afeitado y el cabello, brindan lo mejor de lo mejor..</p>
                    </div>
                </div>

            <div>

            <div class="features-img">
                <div align="center">
                    <iframe width="640" height="260" src="https://www.youtube.com/embed/8pWtdanVz3I" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
        </div> 
        
    </section>
    <%-- bloque "servicio que ofrecemos" --%>   
    <section id="service">
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
                <img src="images/masm.jpg">
                <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Mascarilla</h3>
                        <hr>
                        <p>Nos enorgullece ofrecer una experiencia única y especializada en el cuidado y embellecimiento de tu rostro a través de una amplia gama de mascarillas. Nuestro objetivo es proporcionarte un momento de relajación y bienestar, 
                        mientras te brindamos los beneficios para tu piel que solo las mascarillas pueden ofrecer. </p>
                    </div>
                </div>
            

            <div class="single-service">
                <img src="images/asa.jpg">
                <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Tinte de Cabello</h3>
                        <hr>
                        <p>Te invitamos a explorar una amplia gama de tintes para el cabello que te permitirán expresar tu estilo personal y transformar tu apariencia de manera emocionante. 
                        Estamos comprometidos en ofrecerte productos de calidad y resultados excepcionales, para que puedas lograr el look que siempre has deseado.</p>
                    </div>
                </div>
            

            <div class="single-service">
                <img src="images/des.png">
                <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Permanente</h3>
                        <hr>
                        <p>Ya sea que estés buscando un peinado elegante para una ocasión especial, un corte moderno y a la moda, o simplemente desees un cambio de imagen completo, estamos listos para ayudarte a lograr tus objetivos. 
                            Nuestros estilistas son expertos en técnicas de peinado vanguardistas y están al tanto de las últimas tendencias y estilos de la industria.</p>
                    </div>
                </div>
            

            <div class="single-service">
                <img src="images/pro.jpg">
                <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Peinado Profesional</h3>
                        <hr>
                        <p> Nuestro equipo de expertos en cuidado de la barba te brinda una guía completa sobre los cortes más populares y las tendencias más recientes en el mundo del cuidado facial masculino.</p>
                    </div>
                </div>
            

            <div class="single-service">
                <img src="images/man.png">
                <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Manicura</h3>
                        <hr>
                        <p>Ofrecemos una amplia gama de servicios de manicura, desde manicura clásica hasta técnicas avanzadas de diseño de uñas. 
                            Ya sea que desees un aspecto elegante y sofisticado, o algo más atrevido y creativo, nuestro equipo de manicuristas expertos está capacitado en una variedad de estilos y tendencias actuales.</p>
                    </div>
                </div>
            

            <div class="single-service">
                <img src="images/pe.png">
                <div class="overlay"></div>
                    <div class="service-desc">
                        <h3>Pedicura</h3>
                        <hr>
                        <p>Ofrecemos una amplia gama de servicios de pedicura, diseñados para atender las necesidades específicas de tus pies. Desde pedicuras clásicas hasta tratamientos especializados, 
                        nuestro equipo de pedicuristas expertos se asegurará de que tus pies se sientan renovados y hermosos.</p>
                    </div>
                </div>
            

        </div>
    </section>   
        
    <%-- Mostrar el footer de la pagina --%>   
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
