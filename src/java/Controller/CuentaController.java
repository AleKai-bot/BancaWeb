/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Logic.Cuentas;
import Logic.Monedas;
import Logic.Movimientos;
import Logic.Usuarios;
import Model.ModelCuenta;
import Model.ModelMoneda;
import Model.ModelMovimiento;
import Model.ModelUsuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.function.Consumer;
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
@WebServlet(name = "CuentaController", urlPatterns = {"/CuentasC", "/CuentasU", "/interes"})
public class CuentaController extends HttpServlet {

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

            case "/CuentasC": {
                String cedCliente = request.getParameter("cedClient");
                String mone = request.getParameter("moneda");
                Usuarios u = ModelUsuario.buscarUsuario(Integer.parseInt(cedCliente));
                if (u != null) {
                    Monedas monedaSelec = ModelMoneda.buscarMoneda(Integer.parseInt(mone));
                    Cuentas account = new Cuentas(0, Integer.parseInt(cedCliente), 0, monedaSelec);
                    ModelCuenta.agregarCuenta(account);
                    response.sendRedirect(request.getContextPath() + "/cuentasCaje.jsp");

                } else {
                    //Si no encuntra el usuario que hace!!!!!!!!!!
                    response.sendRedirect(request.getContextPath() + "/cuentasCaje.jsp");
                    //Tirar modal!!!!!!!!!!
                }
                break;
            }

            case "/CuentasU": {
                Usuarios u = (Usuarios) request.getSession().getAttribute("usuario");
                ArrayList<Cuentas> p = ModelCuenta.listarCuentas(Integer.toString(u.getId()));
                session.setAttribute("listAccount", p);
                response.sendRedirect(request.getContextPath() + "/cuentasClient.jsp");
                break;
            }
            case "/interes": {
                ArrayList<Cuentas> p = ModelCuenta.listarTodasCuentas();
                acreditar(p);
                response.sendRedirect(request.getContextPath() + "/acreditarInteres.jsp");
            }
            default:
                break;
        }
    }

    void acreditar(ArrayList<Cuentas> p) {
        for (Cuentas de : p) {
            float monto = 0;
            switch (de.getMoneda().getNom()) {
                case "Colones":
                    monto = de.getSaldo() * (float) 0.08;
                    break;
                case "Dolares":
                    monto = de.getSaldo() * (float) 0.15;
                    break;
                case "Euros":
                    monto = de.getSaldo() * (float) 0.25;
                    break;
                default:
                    break;
            }
            ModelCuenta.modificarSaldo(de.getNumero(), de.getSaldo() + monto);
            Movimientos u = new Movimientos(0, "Deposito de " + monto + " Motivo: Acreditacion de Interes", de.getNumero(), de.getDueño());
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
