/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Logic.Cuentas;
import Logic.Movimientos;
import Model.ModelCuenta;
import Model.ModelMovimiento;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alejandro-PC
 */
@WebServlet(name = "MovimientosController", urlPatterns = {"/Utransferencia", "/Mtransferencia", "/transferenciaCajero", "/Deposito", "/depositoSaldo", "/Retiro", "/retiroSaldo", "/listaMoves"})
public class MovimientosController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        switch (request.getServletPath()) {
            case "/Deposito": {
                ArrayList<Cuentas> p = ModelCuenta.listarTodasCuentas();
                session.setAttribute("listarCuentas", p);
                response.sendRedirect(request.getContextPath() + "/deposito.jsp");
                break;
            }
            case "/Retiro": {
                ArrayList<Cuentas> p = ModelCuenta.listarTodasCuentas();
                session.setAttribute("listarCuentas", p);
                response.sendRedirect(request.getContextPath() + "/retiro.jsp");
                break;
            }
            case "/depositoSaldo": {
                String numAcc = request.getParameter("num");
                String monto = request.getParameter("monto");
                String motivo = request.getParameter("Motivo");
                depositar(numAcc, monto, motivo);
                response.sendRedirect(request.getContextPath() + "/Deposito");
                break;
            }
            case "/retiroSaldo": {
                String numAcc = request.getParameter("num");
                String monto = request.getParameter("monto");
                retirar(numAcc, monto);
                response.sendRedirect(request.getContextPath() + "/Retiro");
                break;
            }
            case "/listaMoves": {
                String num = request.getParameter("id");
                ArrayList<Movimientos> p = ModelMovimiento.listarMovimientos(num);
                session.setAttribute("listMove", p);
                response.sendRedirect(request.getContextPath() + "/movimientos.jsp");
                break;
            }
            case "/transferenciaCajero": {
                ArrayList<Cuentas> p = ModelCuenta.listarTodasCuentas();
                session.setAttribute("listarCuentasT", p);
                response.sendRedirect(request.getContextPath() + "/transferenciaCajero.jsp");
            }
            break;
            case "/Mtransferencia": {
                String origen = request.getParameter("ORI");
                String destino = request.getParameter("DES");
                String monto = request.getParameter("montoT");
                String motivo = request.getParameter("Motivo");
                transaccion(origen, destino, monto, motivo);
                response.sendRedirect(request.getContextPath() + "/transferenciaCajero");
            }
            break;
            case "/Utransferencia": {
                String origen = request.getParameter("ORI");
                String destino = request.getParameter("DES");
                String monto = request.getParameter("montoT");
                String motivo = request.getParameter("Motivo");
                transaccion(origen, destino, monto, motivo);
                response.sendRedirect(request.getContextPath() + "/iniTransfe");
            }
            break;
            default:
                break;
        }
    }

    void retirar(String numAcc, String monto) {
        Cuentas acc = ModelCuenta.buscarCuenta(Integer.parseInt(numAcc));
        if (acc != null) {
            if (acc.getSaldo() >= Integer.parseInt(monto)) {
                ModelCuenta.modificarSaldo(acc.getNumero(), acc.getSaldo() - Integer.parseInt(monto));
                Movimientos u = new Movimientos(0, "Retiro de " + monto, acc.getNumero(), acc.getDueño());
                ModelMovimiento.agregarMovimiento(u);
            }
        }
    }

    void transaccion(String origen, String destino, String monto, String motivo) {
        double montoConver = 0;

        Cuentas acc = ModelCuenta.buscarCuenta(Integer.parseInt(origen));

        if (acc.getSaldo() >= Integer.parseInt(monto)) {
            ModelCuenta.modificarSaldo(acc.getNumero(), acc.getSaldo() - Integer.parseInt(monto));
            Cuentas accDes = ModelCuenta.buscarCuenta(Integer.parseInt(destino));
            montoConver = conversor(acc, accDes, Integer.parseInt(monto));
            ModelCuenta.modificarSaldo(accDes.getNumero(), accDes.getSaldo() + (float)montoConver);
            
            Movimientos u = new Movimientos(0, "Traspaso de " + monto + " " + acc.getMoneda().getNom() + " a la cuenta " + accDes.getNumero() + " Motivo: " + motivo, acc.getNumero(), acc.getDueño());
            ModelMovimiento.agregarMovimiento(u);
            Movimientos p = new Movimientos(0, "Recibio " + montoConver + " " + accDes.getMoneda().getNom() + " de la cuenta " + acc.getNumero() + " Motivo: " + motivo, accDes.getNumero(), accDes.getDueño());
            ModelMovimiento.agregarMovimiento(p);
        }
    }

    double conversor(Cuentas a, Cuentas b, int monto) {
        double result = 0;
        switch (a.getMoneda().getNom()) {
            
            case "Colones": {
                switch (b.getMoneda().getNom()) {
                    case "Colones":
                        result = monto * 1;
                        break;
                    case "Dolares":
                        result = monto * 0.00174386;
                        break;
                    case "Euros":
                        result = monto * 0.00159586;
                        break;
                    default:
                        break;
                }
            }
            break;

            case "Dolares": {
                switch (b.getMoneda().getNom()) {
                    case "Colones":
                        result = monto * 573;
                        break;
                    case "Dolares":
                        result = monto * 1;
                        break;
                    case "Euros":
                        result = monto * 0.91;
                        break;
                    default:
                        break;
                }
            }
            break;
 
            case "Euros": {
                switch (b.getMoneda().getNom()) {
                    case "Colones":
                        result = monto * 627;
                        break;
                    case "Dolares":
                        result = monto * 1.09;
                        break;
                    case "Euros":
                        result = monto * 1;
                        break;
                    default:
                        break;
                }
            }
            break;

            default:
                break;
        }
        return result;
    }

    void depositar(String numAcc, String monto, String motivo) {
        Cuentas acc = ModelCuenta.buscarCuenta(Integer.parseInt(numAcc));
        if (acc != null) {
            ModelCuenta.modificarSaldo(acc.getNumero(), acc.getSaldo() + Integer.parseInt(monto));
            Movimientos u = new Movimientos(0, "Deposito de " + monto + " Motivo: " + motivo, acc.getNumero(), acc.getDueño());
            ModelMovimiento.agregarMovimiento(u);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
