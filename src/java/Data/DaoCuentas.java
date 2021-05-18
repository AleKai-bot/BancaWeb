/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Logic.Cuentas;
import Logic.Monedas;
import Model.ModelMoneda;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alejandro-PC
 */
public class DaoCuentas {

    CallableStatement cstmt = null;
    Connection conn = null;
    RelDatabase r = null;

    public DaoCuentas() {
        r = RelDatabase.getInstance(); //Hacerlo Singleton
        conn = r.getConnection();
    }

    public void agregarCuenta(int dueño, float saldo, Monedas moneda) {
        try {
            boolean resultado = false;
            String SQL = "{call insertarCuenta(?,?,?)}";
            cstmt = conn.prepareCall(SQL);

            cstmt.setInt(1, dueño);
            cstmt.setFloat(2, saldo);
            cstmt.setInt(3, moneda.getCode());

            resultado = cstmt.execute();
            if (resultado == true) {
                throw new SQLException("No se realizo la inserción");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Cuentas> listarCuentas(int id) {

        ArrayList<Cuentas> lista = new ArrayList<>();
        boolean resultado = false;
        try {
            String SQL = "{call buscarCuentaPorDueño(?)}";
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

    public ArrayList<Cuentas> listarTCuentas() {
        ArrayList<Cuentas> lista = new ArrayList<Cuentas>();
        try {
            String SQL = "{call listarCuentas()}";
            cstmt = conn.prepareCall(SQL);
            cstmt.execute();
            ResultSet rs = cstmt.getResultSet();
            while (rs.next()) {
                lista.add(account(rs));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }

    private Cuentas account(ResultSet rs) {
        try {

            DaoMonedas mone = new DaoMonedas();
            Cuentas p = new Cuentas();

            p.setNumero(rs.getInt("Numero"));
            p.setDueño(rs.getInt("Cliente"));
            p.setSaldo(rs.getFloat("saldo"));
            p.setMoneda(mone.buscarMoneda(rs.getInt("Moneda")));

            return p;
        } catch (SQLException ex) {
            System.out.print("Error");
        }
        return null;
    }

    public void modificarSaldo(int cod, float monto) {
        try {
            String SQL = "{call modificarSaldo(?,?)}";
            cstmt = conn.prepareCall(SQL);
            cstmt.setInt(1, cod);
            cstmt.setFloat(2, monto);

            boolean resultado = cstmt.execute();
            if (resultado == true) {
                throw new SQLException("No se realizo la modificacion");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Cuentas buscarCuenta(int cod) {
        try {

            String SQL = "{call buscarCuenta(?)}";
            cstmt = conn.prepareCall(SQL);
            cstmt.setInt(1, cod);
            boolean resultado = cstmt.execute();
            if (resultado == false) {
                throw new SQLException("No se encontro activo");
            }
            ResultSet rs = cstmt.getResultSet();
            if (rs.next()) {
                return account(rs);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
