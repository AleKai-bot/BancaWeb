/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Data.DaoUsuarios;
import Logic.Usuarios;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class ModelUsuario {

    private static DaoUsuarios data = new DaoUsuarios();

    public static void agregarUsuario(Usuarios u) {
        data.agregarUsuario(u.getId(), u.getNombre(), u.getClave(), u.getTel(), u.getRoleUs());
    }

    public static Usuarios buscarUsuario(int cod) {
        return data.buscarUsuario(cod);
    }

    public static ArrayList<Usuarios> listarUs() {
        return data.listarUsers();
    }

}
