/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Logic.Cuentas;
import Logic.Usuarios;
import Logic.Vinculos;
import Model.ModelCuenta;
import Model.ModelUsuario;
import Model.ModelVinculo;
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
@WebServlet(name = "VinculosController", urlPatterns = {"/veriVincu", "/creaVincu", "/iniTransfe"})
public class VinculosController extends HttpServlet {

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
            case "/iniTransfe": {
                Usuarios u = (Usuarios) request.getSession().getAttribute("usuario");
                ArrayList<Vinculos> p = ModelVinculo.buscarVinculos(u);
                session.setAttribute("listaVinculos", p);
                response.sendRedirect(request.getContextPath() + "/transferencia.jsp");

                break;
            }
            case "/veriVincu": {
                String acc = request.getParameter("accBen");
                Cuentas p = ModelCuenta.buscarCuenta(Integer.parseInt(acc));
                if (p != null) {
                    session.setAttribute("user", ModelUsuario.buscarUsuario(p.getDueño()));
                    session.setAttribute("acco", p);
                    response.sendRedirect(request.getContextPath() + "/infoBeneficiario.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/transferencia.jsp");
                }
                break;
            }
            case "/creaVincu": {
                Usuarios p = (Usuarios) request.getSession().getAttribute("usuario");
                String accBe = request.getParameter("cuenB");
                Vinculos u = new Vinculos(p.getId(), Integer.parseInt(accBe));
                ModelVinculo.agregarVinculo(u);
                response.sendRedirect(request.getContextPath() + "/iniTransfe");
                break;
            }

            default:
                break;
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
