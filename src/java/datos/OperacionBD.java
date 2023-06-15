
package datos;

import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Cliente;
import modelos.Estilista;

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
                System.out.println("conectado");
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Error1 "+ ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Error2 "+ ex.getMessage());
        }
        return estado;
    }
    
    
    public boolean desconectar(){
        boolean estado = false;
            try {
                conexion.close();
                estado=true;
            } catch (SQLException ex) {
                System.out.println("Error3 "+ ex.getMessage());
            }
        return estado;
    } 
    
    
/*Bloque de consultas a la tabla Cliente*/
    
    public boolean agregarCliente (Cliente cliente){
        boolean estado = false;
        PreparedStatement ps;
        String q="INSERT INTO clientes (nombre, telefono) VALUES(?,?)";
        
        try {
            ps=conexion.prepareStatement(q);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getTelefono());
            ps.executeUpdate();
            estado = true;
        } catch (SQLException ex) {
            System.out.println("Error5 "+ ex.getMessage());
        }
        return estado;
    }
    
    public ArrayList<Cliente> consultarCliente(){
        ArrayList<Cliente> clientes = new ArrayList<>();
        Statement st;
        String q = "SELECT * FROM clientes";
        try {
            st = conexion.createStatement();
            ResultSet rs = st.executeQuery(q);
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id_c"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setTelefono(rs.getString("telefono"));
                clientes.add(cliente);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OperacionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;
    }
    
    
/*Bloque de consultas a la tabla Estilista*/
    
    
    public ArrayList<Estilista> consultarEstilistas(){
        ArrayList<Estilista> estilistas = new ArrayList<>();
        Statement st;
        String q = "SELECT * FROM estilistas";
        try {
            st = conexion.createStatement();
            ResultSet rs = st.executeQuery(q);
            while(rs.next()){
                Estilista estilista = new Estilista();
                estilista.setId(rs.getInt("id_e"));
                estilista.setNombre(rs.getString("nombre"));
                estilista.setHorario(rs.getTime("horario"));
                estilistas.add(estilista);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OperacionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return estilistas;
    }
    
            
    public int reservacionp1 (Cliente cliente, Estilista estilista,Time horario){
        PreparedStatement ps;
        String q ="INSERT INTO reservaciones (idCliente, idEstilista, horario) Values(?,?,?)";
        int id_r = 0;
        try {
            ps = conexion.prepareStatement(q, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, cliente.getId());
            ps.setInt(2, estilista.getId());
            ps.setTime(3, horario);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()){
                id_r = rs.getInt(1);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OperacionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id_r;
    }
    
    public int reservacionp2 (int id_r, int id_p){
        PreparedStatement ps;
        String q = "INSERT INTO reservacion_productos (id, id_reservacion, id_producto) Values(?,?,?)";
        LocalDate fechaActual = LocalDate.now();
        String fecha = fechaActual.format(DateTimeFormatter.ofPattern("ddMMyy"));
        Random random = new Random();
        int numeroAleatorio = random.nextInt(9000) + 1000;
        int id = parseInt(fecha) + numeroAleatorio;
        try {
            ps = conexion.prepareStatement(q);
            ps.setInt(1,id);
            ps.setInt(2, id_r);
            ps.setInt(3, id_p);
        } catch (SQLException ex) {
            Logger.getLogger(OperacionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
                return id;
        
    }
    
    
}
