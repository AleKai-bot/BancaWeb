/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Logic.Monedas;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alejandro-PC
 */
public class DaoMonedas {

    CallableStatement cstmt = null;
    Connection conn = null;
    RelDatabase r = null;

    public DaoMonedas() {
        r = RelDatabase.getInstance(); //Hacerlo Singleton
        conn = r.getConnection();
    }

    public Monedas buscarMoneda(int cod) {
        try {
            boolean resultado = false;
            String SQL = "{call buscarMoneda(?)}";
            cstmt = conn.prepareCall(SQL);
            cstmt.setInt(1, cod);
            resultado = cstmt.execute();
            if (resultado == false) {
                throw new SQLException("No se encontro la Moneda");
            }
            ResultSet rs = cstmt.getResultSet();
            if (rs.next()) {
                return moneda(rs);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private Monedas moneda(ResultSet rs) {
        try {

            Monedas p = new Monedas();
            p.setNom(rs.getString("nombre"));
            p.setCode(rs.getInt("Codigo"));
            p.setCambio(rs.getInt("cambio"));
            p.setInteres(rs.getInt("interes"));

            return p;
        } catch (SQLException ex) {
            System.out.print("Error en la llamada de Moneda");
        }
        return null;
    }

}
