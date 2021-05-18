/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Logic.Vinculos;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class DaoVinculos {

    CallableStatement cstmt = null;
    Connection conn = null;
    RelDatabase r = null;

    public DaoVinculos() {
        r = RelDatabase.getInstance(); //Hacerlo Singleton
        conn = r.getConnection();
    }

    public void agregarVinculo(int user, int benefi) {
        try {
            boolean resultado = false;
            String SQL = "{call insertarVinculo(?,?)}";
            cstmt = conn.prepareCall(SQL);

            cstmt.setInt(1, user);
            cstmt.setInt(2, benefi);

            resultado = cstmt.execute();
            if (resultado == true) {
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Vinculos> buscarVinculos(int id) {

        ArrayList<Vinculos> lista = new ArrayList<Vinculos>();
        boolean resultado = false;
        try {
            String SQL = "{call buscaVinculos(?)}";
            cstmt = conn.prepareCall(SQL);
            cstmt.setInt(1, id);
            resultado = cstmt.execute();
            if (resultado == false) {
                throw new SQLException("No se encontro Usuario");
            }
            ResultSet rs = cstmt.getResultSet();
            while (rs.next()) {
                lista.add(account(rs));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }

    private Vinculos account(ResultSet rs) {
        try {

            Vinculos p = new Vinculos();

            p.setUser(rs.getInt("usuario"));
            p.setBeneficiario(rs.getInt("beneficiario"));
      
          

            return p;
        } catch (SQLException ex) {
            System.out.print("Error");
        }
        return null;
    }

}
