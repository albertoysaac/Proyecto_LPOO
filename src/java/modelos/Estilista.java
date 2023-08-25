/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;


/**
 * Esta clase representa a un estilista de la barberia
 * @author alber
 */
public class Estilista {
    private String email;
    private String nombre;
    private String apellido;
    private String contraseña;
    private String estado;
    private String horarioEntrada;
    private String horarioSalida;

    /**
     * Crea una instancia de Estilista sin inicializar los atributos.
     */
    public Estilista() {
    }

    /**
     * Crea una instancia de Estilista con los atributos especificados.
     * 
     * @param email      El correo electrónico del estilista.
     * @param nombre     El nombre del estilista.
     * @param apellido   El apellido del estilista.
     * @param contraseña La contraseña del estilista.
     * @param estado     El estado del estilista (activo, inactivo, etc.).
     * @param horario    El horarioEntrada de trabajo del estilista.
     */
    public Estilista(String email, String nombre, String apellido, String contraseña, String estado, String horario) {
        this.email = email;
        this.nombre = nombre;
        this.apellido = apellido;
        this.contraseña = contraseña;
        this.estado = estado;
        this.horarioEntrada = horario;
    }

    /**
     * Obtiene el correo electrónico del estilista.
     * 
     * @return El correo electrónico del estilista.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Establece el correo electrónico del estilista.
     * 
     * @param email El correo electrónico del estilista.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Obtiene el apellido del estilista.
     * 
     * @return El apellido del estilista.
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * Establece el apellido del estilista.
     * 
     * @param apellido El apellido del estilista.
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * Obtiene la contraseña del estilista.
     * 
     * @return La contraseña del estilista.
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     * Establece la contraseña del estilista.
     * 
     * @param contraseña La contraseña del estilista.
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     * Obtiene el estado del estilista.
     * 
     * @return El estado del estilista.
     */
    public String getEstado() {
        return estado;
    }

    /**
     * Establece el estado del estilista.
     * 
     * @param estado El estado del estilista.
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * Obtiene el horarioEntrada de trabajo del estilista.
     * 
     * @return El horarioEntrada de trabajo del estilista.
     */
    public String getHorarioEntrada() {
        return horarioEntrada;
    }

    /**
     * Establece el horarioEntrada de trabajo del estilista.
     * 
     * @param horarioEntrada El horarioEntrada de trabajo del estilista.
     */
    public void setHorarioEntrada(String horarioEntrada) {
        this.horarioEntrada = horarioEntrada;
    }
    
    
    public String getHorarioSalida(){
        String salida;
        salida = this.getHorarioEntrada();
        salida += "08:00:00";
        return salida;
    } 

    /**
     * Obtiene el nombre del estilista.
     * 
     * @return El nombre del estilista.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Establece el nombre del estilista.
     * 
     * @param nombre El nombre del estilista.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
