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
public class Cuentas {

    private int numero;
    private int dueño;
    private float saldo;
    private Monedas moneda;

    public Cuentas() {
        numero = 0;
        dueño = 0;
        saldo = 0;
        moneda = null;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getDueño() {
        return dueño;
    }

    public void setDueño(int user) {
        this.dueño = user;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public Monedas getMoneda() {
        return moneda;
    }

    public void setMoneda(Monedas moneda) {
        this.moneda = moneda;
    }

    public Cuentas(int numero, int dueño, float saldo, Monedas moneda) {
        this.numero = numero;
        this.dueño = dueño;
        this.saldo = saldo;
        this.moneda = moneda;
    }

}
