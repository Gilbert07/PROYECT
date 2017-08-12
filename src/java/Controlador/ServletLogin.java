/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Proyecto.Bean.BeanCliente;
import Proyecto.Dao.DaoCliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Administrador
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

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
        
         // String IdEmpleado = request.getParameter("txtIdEmpleado");
        String Doc_User = request.getParameter("textEmail");
        String Password = request.getParameter("textCodigo");
        

        // String Session = request.getParameter("txtSesion");
       BeanCliente BE =  new BeanCliente();
       DaoCliente DE = new DaoCliente(BE);

        HttpSession misession = request.getSession(true);
        BE = DE.Validar(Doc_User, Password);
        String IDROL =  BE.getRol();
        if(IDROL==null){
        IDROL="Holiii";
        }
        switch (IDROL){
            case "Administrador"://ADMINISTRADOR
                BE.setRol("Administrador");
                misession.setAttribute("User", BE);
                
                response.sendRedirect("AdminCatalogo.jsp");
                break;
            case "Cliente"://Vendedor
                BE.setRol("Cliente");
                misession.setAttribute("User", BE);
                response.sendRedirect("Catalogo.jsp");
                break;
            default:
                PrintWriter pw = response.getWriter();
//                pw.println("<script> alert('Usario o Contraseña Incorrecta')</script>");
                 pw.println( "<script> swal('¡Usario o Contraseña Incorrecta!', 'success'); </script>");
                response.sendRedirect("Login.jsp");
                pw.close();
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
