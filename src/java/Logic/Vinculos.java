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
public class Vinculos {

    private int user;
    private int beneficiario;

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getBeneficiario() {
        return beneficiario;
    }

    public void setBeneficiario(int beneficiario) {
        this.beneficiario = beneficiario;
    }

    public Vinculos(int user, int beneficiario) {
        this.user = user;
        this.beneficiario = beneficiario;
    }

    public Vinculos() {
        user = 0;
        beneficiario = 0;

    }
}
