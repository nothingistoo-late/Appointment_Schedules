/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import appointment.AppointmentDAO;
import appointment.AppointmentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDTO;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ViewAppointmentController", urlPatterns = {"/ViewAppointmentController"})
public class ViewAppointmentController extends HttpServlet {

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
        UserDTO user= (UserDTO)session.getAttribute("User_update");
        String choice = request.getParameter("link");
        if(user == null){
            user = (UserDTO)session.getAttribute("LOGIN_USER");
        }
        String userID = user.getUserID();
        AppointmentDAO dao = new AppointmentDAO();
        try{
            List<AppointmentDTO> list = dao.getAllProducts(userID);
            session.setAttribute("Appointment_list", list);
            if(list == null){
                request.setAttribute("Data_failure", "There is nothing here!");
                request.getRequestDispatcher("viewappointment.jsp").forward(request, response);
            }
            if(choice != null){
                response.sendRedirect("dashboard.jsp");
            }
            response.sendRedirect("viewappointment.jsp");
        }catch(Exception e){
            request.setAttribute("Data_failure", e.toString());
            request.getRequestDispatcher("viewappointment.jsp").forward(request, response);
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
