/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logic;

/**
 *
 * @author Alejandro-PC
 */
public class Cajero {

    private String nombre;
    private String id;
    private String clave;
    private int roleCa;

    public Cajero(String nombre, String user, String clave, int roleCa) {
        this.nombre = nombre;
        this.id = user;
        this.clave = clave;
        this.roleCa = roleCa;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getRoleCa() {
        return roleCa;
    }

    public void setRoleCa(int roleCa) {
        this.roleCa = roleCa;
    }

    public Cajero() {
        this.nombre = "";
        this.id = "";
        this.clave = "";
        this.roleCa = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
