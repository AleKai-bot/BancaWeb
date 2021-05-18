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
public class Monedas {

    public Monedas(int code, float cambio, float interes, String nom) {
        this.code = code;
        this.cambio = cambio;
        this.interes = interes;
        this.nom = nom;
    }

    public Monedas() {
        code = 0;
        cambio = 0;
        interes = 0;
        nom = "";
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public float getCambio() {
        return cambio;
    }

    public void setCambio(float cambio) {
        this.cambio = cambio;
    }

    public float getInteres() {
        return interes;
    }

    public void setInteres(float interes) {
        this.interes = interes;
    }

    private int code;
    private float cambio;
    private float interes;
    private String nom;

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

}
