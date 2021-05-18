/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Logic.Cajero;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alejandro-PC
 */
public class DaoCajero {

    CallableStatement cstmt = null;
    Connection conn = null;
    RelDatabase r = null;

    public DaoCajero() {
        r = RelDatabase.getInstance(); //Hacerlo Singleton
        conn = r.getConnection();
    }

    public Cajero buscarCajero(int cod) {
        try {
            boolean resultado = false;
            String SQL = "{call buscarCajero(?)}";
            cstmt = conn.prepareCall(SQL);
            cstmt.setInt(1, cod);
            resultado = cstmt.execute();
            if (resultado == false) {
                throw new SQLException("No se encontro Usuario");
            }
            ResultSet rs = cstmt.getResultSet();
            if (rs.next()) {
                return cajero(rs);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private Cajero cajero(ResultSet rs) {
        try {

            Cajero p = new Cajero();
            p.setNombre(rs.getString("nombre"));
            p.setClave(rs.getString("claveC"));
            p.setRoleCa(rs.getInt("RoleC"));
            return p;
        } catch (SQLException ex) {
            System.out.print("Error en la llamada de Usuario");
        }
        return null;
    }

}
