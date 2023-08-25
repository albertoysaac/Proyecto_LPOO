/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.util.ArrayList;

;

/**
 *
 * @author alber
 */
public class Reservacion {
    private int id;
    private Cliente cliente;
    private Estilista estilista;
    private String horario;
    private ArrayList<Producto> servicios;
    
    
    public Reservacion() {
    
    }

    public Reservacion(int id, Cliente cliente, Estilista estilista, ArrayList<Producto> servicios, String horario) {
        this.id = id;
        this.cliente = cliente;
        this.estilista = estilista;
        this.servicios = servicios;
        this.horario = horario;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
    
    public Cliente getCliente(){
        return cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public Estilista getEstilista() {
        return estilista;
    }

    public void setEstilista(Estilista estilista) {
        this.estilista = estilista;
    }

    public ArrayList<Producto> getServicios() {
        return servicios;
    }

    public void setServicios(ArrayList<Producto> servicios) {
        this.servicios = servicios;
    }

    public String getHorario() {
        return horario;
    }

    public String tiempoEstimado() {
        String tiempo = "";
        for (Producto servicio : servicios) {
            switch(servicio.getId()) {
                case 10:
                    tiempo += "01:00:00";
                    break;
                case 11:
                    tiempo += "00:30:00";
                    break;
                case 12:
                    tiempo += "00:30:00";
                    break;
                case 13:
                    tiempo += "00:30:00";
                    break;
                case 14:
                    tiempo += "02:30:00";
                    break;
                case 15:
                    tiempo += "01:00:00";
                    break;
                case 16:
                    tiempo += "02:30:00";
                    break;
                case 17:
                    tiempo += "01:00:00";
                    break; 
            }
        }
        return tiempo;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    @Override
    public String toString() {
        return "reservacion{" + "id=" + id + ", nomCliente=" + cliente.getNombre() + ", nomEstilista=" + estilista.getNombre() + ", productos=" + servicios + ", horario=" + horario + '}';
}

    
}
