/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Data.DaoVinculos;
import Logic.Usuarios;
import Logic.Vinculos;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class ModelVinculo {

    private static DaoVinculos data = new DaoVinculos();

    public static void agregarVinculo(Vinculos u) {
        data.agregarVinculo(u.getUser(), u.getBeneficiario());
    }

    public static ArrayList<Vinculos> buscarVinculos(Usuarios u) {
        return data.buscarVinculos(u.getId());
    }

}
