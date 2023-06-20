
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

    try {
        st = conexion.createStatement();
        ResultSet rs = st.executeQuery(q);

        while (rs.next()) {
            Cliente cliente = new Cliente();
            cliente.setEmail(rs.getString("email"));
            cliente.setNombre(rs.getString("nombre"));
            cliente.setApellido(rs.getString("apellido"));
            cliente.setContraseña(rs.getString("contraseña"));
            cliente.setDireccion(rs.getString("direccion"));
            cliente.setTelefono(rs.getString("telefono"));
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

    try {
        st = conexion.createStatement();
        ResultSet rs = st.executeQuery(q);

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

    
    
    /*Consulta de servicios*/
    
    
    
}
