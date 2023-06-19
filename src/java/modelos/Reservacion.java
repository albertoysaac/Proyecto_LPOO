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
    private String horario;

    public Reservacion() {
       
    }

    public Reservacion(int id, String nomCliente, String nomEstilista, String servicio, String horario) {
        this.id = id;
        this.nomCliente = nomCliente;
        this.nomEstilista = nomEstilista;
        this.servicio = servicio;
        this.horario = horario;
    }
    
    
    
    public String getNomCliente() {
        return nomCliente;
    }

    public void setNomCliente(String nomCliente) {
        this.nomCliente = nomCliente;
    }

    public String getNomestilista() {
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

    public void setProductos(String productos) {
        this.servicio = productos;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    @Override
    public String toString() {
        return "reservacion{" + "id=" + id + ", nomCliente=" + nomCliente + ", nomEstilista=" + nomEstilista + ", productos=" + servicio + ", horario=" + horario + '}';
}
}
