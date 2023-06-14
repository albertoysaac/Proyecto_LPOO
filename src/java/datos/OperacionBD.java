
package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
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
    
     /*Bloque de consultas a la tabla Cliente*/
    
    
    public ArrayList<Estilista> consultarEstilista(){
        ArrayList<Estilista> estilistas = new ArrayList<>();
        Statement st;
        String q = "SELECT * FROM estilistas";
        try {
            st = conexion.createStatement();
            ResultSet rs = st.executeQuery(q);
            while(rs.next()){
                Estilista estilista = new Estilista();
                estilista.setId(rs.getInt("id_c"));
                estilista.setNombre(rs.getString("nombre"));
                estilista.setHorario(rs.getTime("horario"));
                estilistas.add(estilista);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OperacionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return estilistas;
    }
    
            
    public boolean agregarC_E (Cliente cliente, Estilista estilista,Time horario){
        boolean estado = false;
        PreparedStatement ps;
        String q ="INSERT INTO reservaciones (idCliente, idEstilista, horario) Values(?,?,?)";
        try {
            ps = conexion.prepareStatement(q);
            ps.setInt(1, cliente.getId());
            ps.setInt(2, estilista.getId());
            ps.setTime(3, horario);
            ps.executeUpdate();
            estado = true;
        } catch (SQLException ex) {
            Logger.getLogger(OperacionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return estado;
    }
    
    public boolean agregarReservacion (){
        
    }
   
    
}
 
