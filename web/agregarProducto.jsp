<%@page import="modelos.Producto"%>
<%@page import="datos.OperacionBD"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            OperacionBD op= new OperacionBD();
            op.conectar();
            int idp=Integer.parseInt(request.getParameter("idP"));
            String des=request.getParameter("desc");
            double precio=Integer.parseInt(request.getParameter("precio"));
            Producto unAlumno=new Producto(idp,des,precio);
            op.agregarProducto(unAlumno);
            response.sendRedirect("control.jsp");
            op.desconectar();
            %>
    </body>
</html>

<select name="horario" id="horario">
    <option value=""></option>
</select>