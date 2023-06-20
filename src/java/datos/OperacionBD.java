
package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;
import modelos.Cliente;
import modelos.Estilista;
import modelos.Producto;
import modelos.Reservacion;

/**
 *
 * @author Alumno13
 */
public class OperacionBD {
    private static final String USER="root";
    private static final String PSWD="root";
    private static final String BD="barberia";
    private static final String URL="jdbc:mysql://localhost:3306/";
    private Connection conexion;
    
    
    
    public boolean conectar(){
        boolean estado = false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(URL+BD,USER,PSWD);
            if(conexion!=null){
                estado = true;
                System.out.println("Conectado a la base de datos");
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Error al cargar el driver: " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Error al conectar a la base de datos: " + ex.getMessage());
        }
        return estado;
    }
    
    
    public boolean desconectar(){
        boolean estado = false;
            try {
                conexion.close();
                estado=true;
                System.out.println("Desconectado de la base de datos");
            } catch (SQLException ex) {
                System.out.println("Error al desconectar de la base de datos: " + ex.getMessage());
            }
        return estado;
    } 
    
    public boolean validarCredencialesCliente(String email, String contrasena) {
        boolean credencialesValidas = false;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT COUNT(*) FROM clientes WHERE email = ? AND contraseña = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                credencialesValidas = count > 0;
            }
        } catch (SQLException ex) {
            System.out.println("Error al validar las credenciales del cliente: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar el ResultSet y PreparedStatement: " + ex.getMessage());
            }
        }
        return credencialesValidas;
    }
    
    
    public boolean validarCredencialesEstilista(String email, String contrasena) {
        boolean credencialesValidas = false;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT COUNT(*) FROM estilistas WHERE email = ? AND contraseña = ?";
            ps = conexion.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                credencialesValidas = count > 0;
            }
        } catch (SQLException ex) {
            System.out.println("Error al validar las credenciales del estilista: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex){
                System.out.println("Error al cerrar el ResultSet y PreparedStatement: " + ex.getMessage());
            }
          }
          return credencialesValidas;
        }
    
    
    
/*Bloque de consultas a la tabla Cliente*/
    
    public boolean agregarCliente(Cliente cliente) {
    boolean estado = false;
    PreparedStatement ps;
    String q = "INSERT INTO clientes  VALUES (?, ?, ?, ?, ?, ?, ?)";

    try {
        ps = conexion.prepareStatement(q);
        ps.setString(1, cliente.getEmail());
        ps.setString(2, cliente.getNombre());
        ps.setString(3, cliente.getApellido());
        ps.setString(4, cliente.getContraseña());
        ps.setString(5, cliente.getDireccion());
        ps.setString(6, cliente.getTelefono());
        ps.setString(7, cliente.getSexo());
        ps.executeUpdate();
        estado = true;
    } catch (SQLException ex) {
        System.out.println("Error al agregar cliente: " + ex.getMessage());
    }
    return estado;
}
    
    public ArrayList<Cliente> consultarClientes() {
    ArrayList<Cliente> clientes = new ArrayList<>();
    Statement st;
    String q = "SELECT * FROM clientes";
    ResultSet rs;
    
    try {
        st = conexion.createStatement();
        rs = st.executeQuery(q);

        while (rs.next()) {
            Cliente cliente = new Cliente();
            cliente.setEmail(rs.getString("email"));
            cliente.setNombre(rs.getString("nombre"));
            cliente.setApellido(rs.getString("apellido"));
            cliente.setContraseña(rs.getString("contraseña"));
            cliente.setDireccion(rs.getString("direccion"));
            cliente.setTelefono(rs.getString("telefono"));
            cliente.setSexo(rs.getString("sexo"));
            clientes.add(cliente);
        }

        rs.close();
        st.close();
    } catch (SQLException ex) {
        System.out.println("Error al consultar clientes: " + ex.getMessage());
    }

    return clientes;
}
    
    
/*Bloque de consultas a la tabla Estilista*/
    
    
    
    
    public ArrayList<Estilista> consultarEstilistas() {
    ArrayList<Estilista> estilistas = new ArrayList<>();
    Statement st;
    String q = "SELECT * FROM estilistas";
    ResultSet rs;
    
    try {
        st = conexion.createStatement();
        rs = st.executeQuery(q);

        while (rs.next()) {
            Estilista estilista = new Estilista();
            estilista.setEmail(rs.getString("email"));
            estilista.setNombre(rs.getString("nombre"));
            estilista.setApellido(rs.getString("apellido"));
            estilista.setContraseña(rs.getString("contraseña"));
            estilista.setEstado(rs.getString("estado"));
            estilista.setHorario(rs.getString("horario"));
            estilistas.add(estilista);
        }

        rs.close();
        st.close();
    } catch (SQLException ex) {
        System.out.println("Error al consultar estilistas: " + ex.getMessage());
    }

    return estilistas;
}
    
    /*Bloque de consultas a la tabla Productos */
    public boolean agregarProducto(Producto producto) {
    boolean estado = false;
    PreparedStatement ps;
    String q = "INSERT INTO productos VALUES (?, ?, ?)";

    try {
        ps = conexion.prepareStatement(q);
        ps.setInt(1, producto.getId());
        ps.setString(2, producto.getDescripcion());
        ps.setDouble(3, producto.getPrecio());

        ps.executeUpdate();
        estado = true;
    } catch (SQLException ex) {
        System.out.println("Error al agregar producto: " + ex.getMessage());
    }
    return estado;
}
    
    public ArrayList<Producto> consultarProductos(String query){
        ArrayList<Producto> lista= new ArrayList<>();
        Statement st;
        ResultSet rs;
        String q=query;

        try {
            st=conexion.createStatement();
            rs  = st.executeQuery(q);
            while(rs.next()){
                Producto pr=new Producto();
                pr.setId(rs.getInt(1));
                pr.setDescripcion(rs.getString(2));
                pr.setPrecio(rs.getDouble(3));
                lista.add(pr);
            }

        } catch (SQLException ex) {
            System.out.println("Error "+ ex.getMessage());
        }


        return lista;

    }

   
    /*Bloque de consultas a la tabla Reservaciones*/
            
    public int reservacionp1(Cliente cliente, Estilista estilista, String horario) {
    PreparedStatement ps;
    String q = "INSERT INTO reservaciones (cliente, estilista, horario) VALUES (?, ?, ?)";
    int id_r = 0;
    ResultSet rs;

    try {
        ps = conexion.prepareStatement(q, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, cliente.getEmail());
        ps.setString(2, estilista.getEmail());
        ps.setString(3, horario);
        ps.executeUpdate();
        rs = ps.getGeneratedKeys();

        if (rs.next()) {
            id_r = rs.getInt(1);
        }

        rs.close();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error al agregar la reservación: " + ex.getMessage());
    }

    return id_r;
}
    
    public String calcularDineroCliente(String email){
    PreparedStatement ps;
    String q = "SELECT c.nombre AS cliente, SUM(p.precio) AS total_gastado FROM reservaciones r INNER JOIN clientes c ON r.cliente = c.email INNER JOIN reservacion_productos rp ON r.id_r = rp.id_reservacion INNER JOIN productos p ON rp.id_producto = p.id_p INNER JOIN estilistas e ON r.estilista = e.email WHERE e.email = ? GROUP BY c.nombre ORDER BY total_gastado DESC LIMIT 1;";
    ResultSet rs;
    String cliente="";
    double cant=0;

    try {
        ps = conexion.prepareStatement(q);
        ps.setString(1, email);
        rs = ps.executeQuery();

        while (rs.next()) {
               cliente=rs.getString("cliente");
               cant=Double.parseDouble(rs.getString("total_gastado"));
        }

        rs.close();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error al consultar:" + ex.getMessage());
    }


       return "El cliente que mas ha gastado es "+cliente+" con una cantidad de:$"+cant;
     }

    
    /*Bloque de consultas a la tabla Reservacion_Productos*/
    
    public int reservacionp2(int id_r, int id_p) {
    PreparedStatement ps;
    String q = "INSERT INTO reservacion_productos (id, id_reservacion, id_producto) VALUES (?, ?, ?)";
    LocalDate fechaActual = LocalDate.now();
    String fecha = fechaActual.format(DateTimeFormatter.ofPattern("ddMMyy"));
    Random random = new Random();
    int numeroAleatorio = random.nextInt(9000) + 1000;
    int id = Integer.parseInt(fecha) + numeroAleatorio;

    try {
        ps = conexion.prepareStatement(q);
        ps.setInt(1, id);
        ps.setInt(2, id_r);
        ps.setInt(3, id_p);
        ps.executeUpdate();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error al agregar la reserva de productos: " + ex.getMessage());
    }

    return id;
}
    
    
    /*Consulta general de la reservacion */
    public ArrayList<Reservacion> consultarReservacionesPorEmailCliente(String emailCliente) {
    ArrayList<Reservacion> reservaciones = new ArrayList<>();
    PreparedStatement ps;
    String query = "SELECT r.id_r AS id_reservacion, c.nombre AS nombre_cliente, c.telefono, r.horario, p.descripcion AS productos FROM reservaciones r INNER JOIN clientes c ON r.cliente = c.email INNER JOIN reservacion_productos rp ON r.id_r = rp.id_reservacion INNER JOIN productos p ON rp.id_producto = p.id_p WHERE c.email = ? ;";
    ResultSet rs;
    
    try {
        ps = conexion.prepareStatement(query);
        ps.setString(1, emailCliente);
        rs = ps.executeQuery();

        while (rs.next()) {
            Reservacion reservacion = new Reservacion();
            reservacion.setId(rs.getInt("id_reservacion"));
            reservacion.setNomCliente(rs.getString("nombre_cliente"));
            reservacion.setTelefono(rs.getString("telefono"));
            reservacion.setNomEstilista(rs.getString("estilista"));
            reservacion.setHorario(rs.getString("horario"));
            reservacion.setProductos(rs.get);
            // ... Resto de los campos de la reservación

            reservaciones.add(reservacion);
        }

        rs.close();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error al consultar reservaciones por email del cliente: " + ex.getMessage());
    }

    return reservaciones;
}

    
    public Reservacion consultarReservacion(String idReservacion) {
    PreparedStatement ps;
    Reservacion r = new Reservacion();
    String q = "SELECT c.nombre AS cliente, e.nombre AS estilista, rp.id, p.descripcion FROM reservaciones r INNER JOIN clientes c ON r.idCliente = c.id_c INNER JOIN estilistas e ON r.idEstilista = e.id_e INNER JOIN reservacion_productos rp ON r.id_r = rp.id_reservacion INNER JOIN productos p ON rp.id_producto = p.id_p WHERE r.id_r = ? AND p.id_p LIKE '1%';";
    ResultSet rs;
    
    try {
        ps = conexion.prepareStatement(q);
        ps.setInt(1, Integer.parseInt(idReservacion));
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int id = Integer.parseInt(idReservacion);
            String cliente = rs.getString("cliente");
            String estilista = rs.getString("estilista");
            String producto = rs.getString("descripcion");
            
            r.setId(id);
            r.setNomCliente(cliente);
            r.setNomEstilista(estilista);
            r.setProductos(producto);
        } else {
            // No se encontró ninguna reservación con el ID proporcionado
            r = null;
        }
        
        rs.close();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error en la consulta de la reservación: " + ex.getMessage());
        r = null;
    }
    
    return r;
}

    
    
   public ArrayList<Reservacion> consultarReservacionPorEmpleado(String email) {
    ArrayList<Reservacion> reservaciones = new ArrayList<>();
    PreparedStatement ps;
    String q = "SELECT r.id_r AS id_reservacion, c.nombre AS nombre_cliente, c.telefono, r.horario, p.descripcion AS productos FROM reservaciones r INNER JOIN clientes c ON r.cliente = c.email INNER JOIN reservacion_productos rp ON r.id_r = rp.id_reservacion INNER JOIN productos p ON rp.id_producto = p.id_p INNER JOIN estilistas e ON r.estilista = e.email WHERE e.email = ?;";
    ResultSet rs;
    
    try {
        ps = conexion.prepareStatement(q);
        ps.setString(1, email);
        rs = ps.executeQuery();

        while (rs.next()) {
            Reservacion res = new Reservacion();
            int idReservacion = rs.getInt("id_reservacion");
                String nombreCliente = rs.getString("nombre_cliente");
                String telefono = rs.getString("telefono");
                String horario = rs.getString("horario");
                String productos = rs.getString("productos");
                
                res.setId(idReservacion);
                res.setNomCliente(nombreCliente);
                res.setTelefono(telefono);
                res.setHorario(horario);
                res.setProductos(productos);
            reservaciones.add(res);
        }

        rs.close();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error al consultar estilistas: " + ex.getMessage());
    }

    return reservaciones;
}

   
 public String contarSexoClientes(String email){
    PreparedStatement ps;
    String q = "SELECT SUM(CASE WHEN c.sexo = 'Hombre' THEN 1 ELSE 0 END) AS hombres, SUM(CASE WHEN c.sexo = 'Mujer' THEN 1 ELSE 0 END) AS mujeres, SUM(CASE WHEN c.sexo NOT IN ('Hombre', 'Mujer') THEN 1 ELSE 0 END) AS otros FROM reservaciones r INNER JOIN clientes c ON r.cliente = c.email WHERE r.estilista = ?;";
    ResultSet rs;
    int hombres=0, mujeres=0, otros=0;
    try {
        ps = conexion.prepareStatement(q);
        ps.setString(1, email);
        rs = ps.executeQuery();

        while (rs.next()) {
             hombres = Integer.parseInt(rs.getString("hombres"));
             mujeres = Integer.parseInt(rs.getString("otros"));
             otros = Integer.parseInt(rs.getString("mujeres"));
        }

        rs.close();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error al consultar estilistas: " + ex.getMessage());
    }


       return "Hombres: "+hombres+" Mujeres: "+mujeres+" Otros: "+otros;
  }
 
public String selecProductoPop(String email){
    PreparedStatement ps;
    String q = "SELECT p.descripcion AS producto, COUNT(rp.id_producto) AS cantidad FROM reservaciones r INNER JOIN reservacion_productos rp ON r.id_r = rp.id_reservacion INNER JOIN productos p ON rp.id_producto = p.id_p INNER JOIN estilistas e ON r.estilista = e.email WHERE e.email = ? GROUP BY rp.id_producto ORDER BY COUNT(rp.id_producto) DESC LIMIT 1;";
    ResultSet rs;
    String servicio="";
    int cant=0;

    try {
        ps = conexion.prepareStatement(q);
        ps.setString(1, email);
        rs = ps.executeQuery();

        while (rs.next()) {
               servicio=rs.getString("producto");
               cant=Integer.parseInt(rs.getString("cantidad"));
        }

        rs.close();
        ps.close();
    } catch (SQLException ex) {
        System.out.println("Error al consultar estilistas: " + ex.getMessage());
    }


       return "El servicio mas pedido es: "+servicio+" con una cantidad de: "+cant;
     }  
    
    
    
}
