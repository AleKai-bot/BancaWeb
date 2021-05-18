/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Logic.Cuentas;
import Logic.Usuarios;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class DaoUsuarios {

    CallableStatement cstmt = null;
    Connection conn = null;
    RelDatabase r = null;

    public DaoUsuarios() {
        r = RelDatabase.getInstance(); //Hacerlo Singleton
        conn = r.getConnection();
    }

    public void agregarUsuario(int ced, String nombre, String clave, int tel, int rol) {
        try {
            boolean resultado = false;
            String SQL = "{call insertarUsuario(?,?,?,?,?)}";
            cstmt = conn.prepareCall(SQL);

            cstmt.setInt(1, ced);
            cstmt.setString(2, nombre);
            cstmt.setString(3, clave);
            cstmt.setInt(4, tel);
            cstmt.setInt(5, rol);

            resultado = cstmt.execute();
            if (resultado == true) {
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Usuarios buscarUsuario(int cod) {
        try {
            boolean resultado = false;
            String SQL = "{call buscarUsuario(?)}";
            cstmt = conn.prepareCall(SQL);
            cstmt.setInt(1, cod);
            resultado = cstmt.execute();
            if (resultado == false) {
                throw new SQLException("No se encontro Usuario");
            }
            ResultSet rs = cstmt.getResultSet();
            if (rs.next()) {
                return usuario(rs);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Usuarios> listarUsers() {

        ArrayList<Usuarios> lista = new ArrayList<Usuarios>();

        try {
            String SQL = "{call listarUsers()}";
            cstmt = conn.prepareCall(SQL);
            cstmt.execute();
            ResultSet rs = cstmt.getResultSet();
            while (rs.next()) {
                lista.add(usuarioaUX(rs));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return lista;

    }

    private Usuarios usuarioaUX(ResultSet rs) {
        try {

            Usuarios p = new Usuarios();

            p.setId(rs.getInt("Cedula"));
            p.setNombre(rs.getString("nombre"));
            p.setClave(rs.getString("claveU"));
            p.setTel(rs.getInt("telefono"));

            return p;
        } catch (SQLException ex) {
            System.out.print("Error en la llamada de Usuario");
        }
        return null;
    }

    private Usuarios usuario(ResultSet rs) {
        try {

            Usuarios p = new Usuarios();

            p.setId(rs.getInt("Cedula"));
            p.setNombre(rs.getString("nombre"));
            p.setClave(rs.getString("claveU"));
            p.setTel(rs.getInt("telefono"));
            p.setRoleUs(rs.getInt("RoleU"));

            return p;
        } catch (SQLException ex) {
            System.out.print("Error en la llamada de Usuario");
        }
        return null;
    }

}
