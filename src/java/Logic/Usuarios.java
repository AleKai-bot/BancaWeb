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
public class Usuarios {

    private String nombre;
    private int id;
    private String clave;
    private int roleUs;
    private int tel;



    public int getId() {
        return id;
    }

    public void setId(int ced) {
        this.id = ced;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getRoleUs() {
        return roleUs;
    }

    public void setRoleUs(int roleUs) {
        this.roleUs = roleUs;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public Usuarios() {
        id = 0;
        nombre = "";
        clave = "";
        roleUs = 0;
        tel = 0;
    }


    public Usuarios(String nombre, int id, String clave, int roleUs, int tel) {
        this.nombre = nombre;
        this.id = id;
        this.clave = clave;
        this.roleUs = roleUs;
        this.tel = tel;
 
    }

 
    

}
