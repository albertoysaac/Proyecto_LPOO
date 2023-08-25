<%-- 
    Document   : homeCliente
    Created on : 19/06/2023, 09:31:34 PM
    Author     : alber
--%>

<%@page import="datos.OperacionBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Reservacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    OperacionBD operacion = new OperacionBD();
    operacion.conectar();
    
    HttpSession sesion = request.getSession();
    String email =(String) sesion.getAttribute("email");
%>
<html>
    
    <head>
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
        <section id="consultarReservaciones">
            <div class="seccionConsulta">
                <%
                    ArrayList<Reservacion> lista = new ArrayList<>();
                    lista = operacion.consultarReservacionesPorEmailCliente(email);
                    for(Reservacion reservacion : lista){
                        out.print("<div class='reservacion'>"
                                + "<h2 class='id'>ID de reservacion: " + reservacion.getId() + "</h2>"
                                + "<p class='nombre'> Estilista: " + reservacion.getEstilista().getNombre() +" "+ reservacion.getEstilista().getApellido()+ "</p>"
                                + "<p class='horario'>Horario: " + reservacion.getHorario() + "</p>"
                                + "<p class='productos'>Productos: " + reservacion.getServicios() + "</p>"
                                + "</div>");
                    }
                %>
            </div>
        </section>

        <section id="service">
            <div class="title-text">
            <%-- Mostrar los servicios que ofrecemos --%>
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

   
        <section id="footer">
            <%-- Mostrar el footer --%>
            <img src="images/footer-img.png" class="footer-img">
            <div class="title-text">
            <p>CONTACTO</p>    
            <h1>Visítanos Hoy</h1>
            </div>
        <div class="footer-row">
        <div class="footer-left">
            <h1>Horario</h1>
            <p><i class="fa fa-clock-o"></i>Lunes a Viernes - 9am to 9pm</p>
            <p><i class="fa fa-clock-o"></i>Sábados y Domingos - 8am to 11pm</p>
        </div>    
        <div class="footer-right">
            <h1>Ubicación</h1>
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
