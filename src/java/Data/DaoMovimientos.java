/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Logic.Movimientos;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class DaoMovimientos {

    CallableStatement cstmt = null;
    Connection conn = null;
    RelDatabase r = null;

    public DaoMovimientos() {
        r = RelDatabase.getInstance(); //Hacerlo Singleton
        conn = r.getConnection();
    }

    public void agregarMovimiento(String acci, int acco, int clien) {
        try {
            boolean resultado = false;
            String SQL = "{call insertarMovimiento(?,?,?)}";
            cstmt = conn.prepareCall(SQL);

            cstmt.setString(1, acci);
            cstmt.setInt(2, acco);
            cstmt.setInt(3, clien);

            resultado = cstmt.execute();
            if (resultado == true) {
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Movimientos> listarMoves(int id) {

        ArrayList<Movimientos> lista = new ArrayList<Movimientos>();
        boolean resultado = false;
        try {
            String SQL = "{call listarMoviemientosPorCuenta(?)}";
            cstmt = conn.prepareCall(SQL);
            cstmt.setInt(1, id);
            resultado = cstmt.execute();
            if (resultado == false) {
                throw new SQLException("No se encontraron movimientos");
            }
            ResultSet rs = cstmt.getResultSet();
            while (rs.next()) {
                lista.add(moves(rs));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lista;

    }

    private Movimientos moves(ResultSet rs) {
        try {

            Movimientos p = new Movimientos();

            p.setId(rs.getInt("id"));
            p.setFecha(rs.getDate("fecha"));
            p.setAccion(rs.getString("accion"));
            p.setCuenta(rs.getInt("Cuenta"));
            p.setUser(rs.getInt("Usuario"));
            
            return p;
        } catch (SQLException ex) {
            System.out.print("Error");
        }
        return null;
    }

}
