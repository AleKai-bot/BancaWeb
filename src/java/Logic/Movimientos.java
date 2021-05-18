/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logic;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author Alejandro-PC
 */
public class Movimientos {

    private int id; //comprobante
    private String accion;
    private int cuenta;
    private int user;

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
    private Date fecha;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public int getCuenta() {
        return cuenta;
    }

    public void setCuenta(int cuenta) {
        this.cuenta = cuenta;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public Movimientos(int id, String accion, int cuenta, int user) {
        this.id = id;
        this.accion = accion;
        this.cuenta = cuenta;
        this.user = user;
    }

    public Movimientos() {
        id = 0;
        accion = "";
        cuenta = 0;
        user = 0;
    }

}
