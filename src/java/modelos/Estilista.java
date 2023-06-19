/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;


/**
 *
 * @author alber
 */
public class Estilista {
    
    private String email;
    private String nombre;
    private String apellido;
    private String contraseña;
    private String estado;
    private String horario;
    

    public Estilista() {
    }

    public Estilista(String email, String nombre, String apellido, String contraseña, String estado, String horario) {
        this.email = email;
        this.nombre = nombre;
        this.apellido = apellido;
        this.contraseña = contraseña;
        this.estado = estado;
        this.horario = horario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

   
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    
    
}
