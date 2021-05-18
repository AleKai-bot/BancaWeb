/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Data.DaoCajero;
import Logic.Cajero;

/**
 *
 * @author Alejandro-PC
 */
public class ModelCajero {

    private static DaoCajero data = new DaoCajero();

    public static Cajero buscarCajero(int cod) {
        return data.buscarCajero(cod);
    }

}
