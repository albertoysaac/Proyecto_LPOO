/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 * Esta clase representa a un cliente de la barberia.
 * @author alber
 */
public class Cliente {
    private String email;
    private String nombre;
    private String apellido;
    private String contraseña;
    private String direccion;
    private String telefono;
    private String sexo;

    /**
     * Crea una instancia de Cliente sin inicializar los atributos.
     */
    public Cliente() {
    }

    /**
     * Crea una instancia de Cliente con los atributos especificados.
     * 
     * @param email      El correo electrónico del cliente.
     * @param nombre     El nombre del cliente.
     * @param apellido   El apellido del cliente.
     * @param contraseña La contraseña del cliente.
     * @param direccion  La dirección del cliente.
     * @param telefono   El número de teléfono del cliente.
     * @param sexo       El sexo del cliente.
     */
    public Cliente(String email, String nombre, String apellido, String contraseña, String direccion, String telefono,
            String sexo) {
        this.email = email;
        this.nombre = nombre;
        this.apellido = apellido;
        this.contraseña = contraseña;
        this.direccion = direccion;
        this.telefono = telefono;
        this.sexo = sexo;
    }

    /**
     * Obtiene el correo electrónico del cliente.
     * 
     * @return El correo electrónico del cliente.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Establece el correo electrónico del cliente.
     * 
     * @param email El correo electrónico del cliente.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Obtiene el apellido del cliente.
     * 
     * @return El apellido del cliente.
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * Establece el apellido del cliente.
     * 
     * @param apellido El apellido del cliente.
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * Obtiene la contraseña del cliente.
     * 
     * @return La contraseña del cliente.
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     * Establece la contraseña del cliente.
     * 
     * @param contraseña La contraseña del cliente.
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     * Obtiene la dirección del cliente.
     * 
     * @return La dirección del cliente.
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * Establece la dirección del cliente.
     * 
     * @param direccion La dirección del cliente.
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * Obtiene el nombre del cliente.
     * 
     * @return El nombre del cliente.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Establece el nombre del cliente.
     * 
     * @param nombre El nombre del cliente.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Obtiene el número de teléfono del cliente.
     * 
     * @return El número de teléfono del cliente.
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Establece el número de teléfono del cliente.
     * 
     * @param telefono El número de teléfono del cliente.
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * Obtiene el sexo del cliente.
     * 
     * @return El sexo del cliente.
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * Establece el sexo del cliente.
     * 
     * @param sexo El sexo del cliente.
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
}
