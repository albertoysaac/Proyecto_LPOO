/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author alber
 */
public class reservacion {
    int id;
    Cliente cliente;
    Estilista estilista;
    ArrayList<Producto> productos;
    Time horario;

    public reservacion() {
       
    }

    public reservacion(int id, Cliente cliente, Estilista estilista, ArrayList<Producto> productos, Time horario) {
        this.id = id;
        this.cliente = cliente;
        this.estilista = estilista;
        this.productos = productos;
        this.horario = horario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
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

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }

    public Time getHorario() {
        return horario;
    }

    public void setHorario(Time horario) {
        this.horario = horario;
    }
    
    
}
