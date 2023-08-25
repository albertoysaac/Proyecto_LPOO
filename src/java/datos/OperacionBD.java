
package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

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
    
    
    /**
     * Metodo que permite conectar a la base de datos
     * @return true si la conexion fue exitosa, false en caso contrario
     */
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
    

    /**
     * Metodo que permite desconectarse de la base de datos
     * @return true si la desconexion fue exitosa, false en caso contrario
     */
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
    

    /**
     * Metodo que permite validar las credenciales de un cliente por su email y contraseña respecto a la base de datos
     * @param email email del cliente
     * @param contrasena contraseña del cliente
     * @return true si las credenciales son validas, false en caso contrario
     */
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
    
    
    /**
     * Metodo que permite validar las credenciales de un estilista por su email y contraseña respecto a la base de datos
     * @param email email del estilista
     * @param contrasena contraseña del estilista
     * @return true si las credenciales son validas, false en caso contrario
     */
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
    

    /**
     * Metodo que permite agregar un cliente a la base de datos
     * @param cliente cliente a agregar
     * @return true si el cliente fue agregado, false en caso contrario
     */
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
    

    /***
     * Metodo para consiltar todos los clientes de la base de datos
     * @return ArrayList de clientes de la base de datos
     */
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
    

    /**
     * Metodo para consultar un solo cliente por su email
     * @param email email del cliente a consultar
     * @return cliente consultado
     */
    public Cliente consultarCliente(String email) {
        Cliente cliente = new Cliente();
        PreparedStatement ps;
        String q = "SELECT * FROM clientes WHERE email = ? ;";
        ResultSet rs;
        
        try {
            ps = conexion.prepareStatement(q);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if(rs.next()){
                cliente.setEmail(rs.getString("email"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setSexo(rs.getString("sexo"));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al consultar clientes: " + ex.getMessage());
        }
        return cliente;
    }
    
    
    /*Bloque de consultas a la tabla Estilista*/
    
    /**
     * Metodo para consultar todos los estilistas de la base de datos
     * @return ArrayList de estilistas de la base de datos
     */
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
                estilista.setHorarioEntrada(rs.getString("horario"));
                estilistas.add(estilista);
            }

            rs.close();
            st.close();
        } catch (SQLException ex) {
            System.out.println("Error al consultar estilistas: " + ex.getMessage());
        }

        return estilistas;
    }


    /**
     * Metodo para consultar un solo estilista por su email
     * @param email email del estilista a consultar
     * @return estilista consultado
     */
    public Estilista consultarEstilista(String email) {
        Estilista estilista = new Estilista();
        PreparedStatement ps;
        String q = "SELECT * FROM estilistas WHERE email = ?;";
        ResultSet rs;
        
        try {
            ps = conexion.prepareStatement(q);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if(rs.next()){
                estilista.setEmail(rs.getString("email"));
                estilista.setNombre(rs.getString("nombre"));
                estilista.setApellido(rs.getString("apellido"));
                estilista.setEstado(rs.getString("estado"));
                estilista.setHorarioEntrada(rs.getString("horario"));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al consultar el estilista " + ex.getMessage());
        }
        return estilista;
    }

    
    /*Bloque de consultas a la tabla Productos */

    /**
     * Metodo para agregar un producto a la base de datos
     * @param producto producto a agregar
     * @return true si el producto fue agregado, false en caso contrario
     */
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

    public Producto consultarProducto(int id) {
        Producto producto = new Producto();
        PreparedStatement ps;
        ResultSet rs;
        String q="SELECT * FROM productos WHWERE id_p = ?";

        try {
            ps=conexion.prepareStatement(q);
            ps.setInt(1, id);
            rs  = ps.executeQuery();
            producto.setId(rs.getInt(1));
            producto.setDescripcion(rs.getString(2));
            producto.setPrecio(rs.getDouble(3));

        } catch (SQLException ex) {
            System.out.println("Error "+ ex.getMessage());
        }


        return producto;

    }
    

    /**
     * Metodo para consultar todos los productos de la base de datos
     * @return ArrayList de productos de la base de datos
     */
    public ArrayList<Producto> consultarProductos(){
        ArrayList<Producto> lista= new ArrayList<>();
        Statement st;
        ResultSet rs;
        String q="SELECT * FROM productos";

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

    
    /**
     * Metodo para hacer una reservacion en la base de datos
     * @param cliente cliente que hace la reservacion
     * @param estilista estilista que atendera la reservacion
     * @param horario horario de la reservacion
     * @param id_p id del servicio que se reservo
     * @return id de la reservacion
     */
    public int reservacion(String cliente, String estilista, String horario, ArrayList<Producto> id_p) {
        PreparedStatement ps;
        String q = "INSERT INTO reservaciones (cliente, estilista, horario, estado) VALUES (?, ?, ?, ?)";
        int id_r = 0;
        ResultSet rs;

        try {
            ps = conexion.prepareStatement(q, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cliente);
            ps.setString(2, estilista);
            ps.setString(3, horario);
            ps.setString(4, "Pendiente");
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            rs.close();
            if (rs.next()) {
                id_r = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("Error al agregar la reservación: " + ex.getMessage());
        }

        q = "INSERT INTO reservacion_productos (id_reservacion, id_producto) VALUES (?, ?)";
                try {
                    ps = conexion.prepareStatement(q);
                    if(id_p.size()>0){
                        for (Producto p : id_p){
                            ps.setInt(1, id_r);
                            ps.setInt(2, p.getId());
                            ps.executeUpdate();
                        }
                    }
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Error al agregar la reserva de productos: " + ex.getMessage());
                }
            
        
        
        
        return id_r;
    }


    
    public HashMap<String, ArrayList<String>> obtenerHorariosNoDisponibles(String emailEstilista, String fechaInicio, String fechaFin) {
    HashMap<String, ArrayList<String>> horariosNoDisponibles = new HashMap<>();

    String query = "SELECT COALESCE(r.horario, e.horario) AS horario_reservacion FROM estilistas e LEFT JOIN " +
            "reservaciones r ON e.email = r.estilista AND DATE(r.horario) BETWEEN ? AND ? WHERE e.email = ? ORDER BY horario_reservacion ASC;";

    try (PreparedStatement ps = conexion.prepareStatement(query)) {
        ps.setString(1, fechaInicio);
        ps.setString(2, fechaFin);
        ps.setString(3, emailEstilista);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String horarioReservacion = rs.getString("horario_reservacion");

            if (horarioReservacion != null) {
                String[] parts = horarioReservacion.split(" ");
                String day = parts[0]; // Obtener el día de la fecha
                String hour = parts[1]; // Obtener la hora de la fecha

                horariosNoDisponibles.computeIfAbsent(day, k -> new ArrayList<>()).add(hour);
            }
        }

        rs.close();
    } catch (SQLException ex) {
        System.out.println("Error al obtener horarios disponibles: " + ex.getMessage());
    }

    return horariosNoDisponibles;
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

    
    /*Consulta general de la reservacion */
    public ArrayList<Reservacion> consultarReservacionesPorEmailCliente(String emailCliente) {
        ArrayList<Reservacion> reservaciones = new ArrayList<>();
        PreparedStatement ps;
        String query = "SELECT r.id_r AS id_reservacion FROM reservaciones r INNER JOIN clientes c ON r.cliente = c.email WHERE c.email = ?;";
        ResultSet rs;
        
        try {
            ps = conexion.prepareStatement(query);
            ps.setString(1, emailCliente);
            rs = ps.executeQuery();

            while (rs.next()) {
                reservaciones.add(consultarReservacion(rs.getInt("id_reservacion")));
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al consultar reservaciones por email del cliente: " + ex.getMessage());
        }

        return reservaciones;
    } 

    
    public Reservacion consultarReservacion(int idReservacion) {
        PreparedStatement ps;
        Reservacion reservacion = new Reservacion();
        Cliente cliente = new Cliente();
        Estilista estilista = new Estilista();
        String q = "SELECT c.email AS correoC, c.nombre as nomC, c.apellido as apC, c.telefono, e.email AS correoE, e.nombre as nomE, e.apellido as apE, r.horario as horario, p.id_p, p.precio, p.descripcion FROM reservaciones r INNER JOIN clientes c ON r.cliente = c.email INNER JOIN estilistas e ON r.estilista = e.email INNER JOIN reservacion_productos rp ON r.id_r = rp.id_reservacion INNER JOIN productos p ON rp.id_producto = p.id_p WHERE r.id_r = ? AND p.id_p LIKE '1%';";
        ArrayList<Producto> productos = new ArrayList<>();
        ResultSet rs;
        
        try {
            ps = conexion.prepareStatement(q);
            ps.setInt(1, idReservacion);
            rs = ps.executeQuery();

            reservacion.setId(idReservacion);

            if (rs.next()) {
                if(cliente.getEmail() == null && estilista.getEmail() == null){
                    cliente.setEmail(rs.getString("correoC"));
                    cliente.setNombre(rs.getString("nomC"));
                    cliente.setApellido(rs.getString("apC"));
                    cliente.setTelefono(rs.getString("telefono"));
                    estilista.setEmail(rs.getString("correoE"));
                    estilista.setNombre(rs.getString("nomE"));
                    estilista.setApellido(rs.getString("apE"));
                    reservacion.setHorario(rs.getString("horario"));
                }
                
                productos.add(new Producto(rs.getInt("id_p"), rs.getString("descripcion"), rs.getDouble("precio")));
            } else {
                // No se encontró ninguna reservación con el ID proporcionado
            }
            reservacion.setCliente(cliente);
            reservacion.setEstilista(estilista);
            reservacion.setServicios(productos);
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error en la consulta de la reservación: " + ex.getMessage());
        }
        
        return reservacion;
    }

    
    public ArrayList<Reservacion> consultarReservacionPorEmpleado(String email) {
        ArrayList<Reservacion> reservaciones = new ArrayList<>();
        PreparedStatement ps;
        String q = "SELECT r.id_r AS id_reservacion FROM reservaciones r INNER JOIN estilistas e ON r.estilista = e.email WHERE e.email = ? order by r.horario asc;";
        ResultSet rs;
        
        try {
            ps = conexion.prepareStatement(q);
            ps.setString(1, email);
            rs = ps.executeQuery();

            while (rs.next()) {
                reservaciones.add(consultarReservacion(rs.getInt("id_reservacion")));
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
    
    
    public int obtenerUltimaReservacionId() {
    int idReservacion = -1;
    String query = "SELECT MAX(id_r) AS last_id FROM reservaciones";
    Statement st;
    ResultSet rs;
    try {
        
        
        st = conexion.createStatement();
        rs = st.executeQuery(query);
        
        if (rs.next()) {
            idReservacion = rs.getInt("last_id");
        }
        rs.close();
        st.close();
        conexion.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return idReservacion;
}
    
}
