/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Data.DaoCuentas;
import Logic.Cuentas;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class ModelCuenta {

    private static DaoCuentas data = new DaoCuentas();

    public static void agregarCuenta(Cuentas u) {
        data.agregarCuenta(u.getDueño(), u.getSaldo(), u.getMoneda());
    }

    public static ArrayList<Cuentas> listarCuentas(String idDueño) {

        int id = Integer.parseInt(idDueño);
        return data.listarCuentas(id);
    }

    public static ArrayList<Cuentas> listarTodasCuentas() {
        return data.listarTCuentas();
    }

    public static void modificarSaldo(int numAcc, float monto) {
        data.modificarSaldo(numAcc, monto);
    }

    public static Cuentas buscarCuenta(int num) {
        return data.buscarCuenta(num);
    }

}
