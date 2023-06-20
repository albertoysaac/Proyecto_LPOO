/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

;

/**
 *
 * @author alber
 */
public class Reservacion {
    private int id;
    private String nomCliente;
    private String nomEstilista;
    private String servicio;
    public String telefono;
    private String horario;
    
   
    
    public Reservacion() {
       
    }

    public Reservacion(int id, String nomCliente, String nomEstilista, String telefono, String servicio, String horario) {
        this.id = id;
        this.nomCliente = nomCliente;
        this.nomEstilista = nomEstilista;
        this.telefono = telefono;
        this.servicio = servicio;
        this.horario = horario;
        
        
    }
    
    
    
    public String getNomCliente() {
        return nomCliente;
    }

    public void setNomCliente(String nomCliente) {
        this.nomCliente = nomCliente;
    }

    public String getNomEstilista() {
        return nomEstilista;
    }

    public void setNomEstilista(String nomEstilista) {
        this.nomEstilista = nomEstilista;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getProductos() {
        return servicio;
    }

    public void setProductos(String servicio) {
        this.servicio = servicio;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }
    

    @Override
    public String toString() {
        return "reservacion{" + "id=" + id + ", nomCliente=" + nomCliente + ", nomEstilista=" + nomEstilista + ", productos=" + servicio + ", horario=" + horario + '}';
}
}
