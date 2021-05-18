/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Data.DaoMovimientos;
import Logic.Cuentas;
import Logic.Movimientos;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class ModelMovimiento {

    private static DaoMovimientos data = new DaoMovimientos();

    public static void agregarMovimiento(Movimientos u) {
        data.agregarMovimiento( u.getAccion(), u.getCuenta(), u.getUser() );
    }
    
       public static ArrayList<Movimientos> listarMovimientos(String nuCuent) {
        return data.listarMoves(Integer.parseInt(nuCuent));
    }

}
