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
import java.util.UUID;
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
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AppointmentDAO dao = new AppointmentDAO();
        HttpSession session= request.getSession();
        UserDTO user = (UserDTO)session.getAttribute("User_update");
        if(user == null){
            user = (UserDTO)session.getAttribute("LOGIN_USER");
        }
        try {
            String ID = UUID.randomUUID().toString();
            String Name = request.getParameter("Name");
            String Date = request.getParameter("AppointmentDate");
            String Time = request.getParameter("AppointmentTime");
            String purpose = request.getParameter("purpose"); 
            String status = request.getParameter("status");
            String userID = user.getUserID();
            if(Name != null){
                AppointmentDTO app = new AppointmentDTO(ID, Name, Date, Time, purpose, status, userID);
                boolean checkInsert= dao.create(app);
                if(checkInsert){
                    request.setAttribute("message", "Add successfully!");
                }else{
                    request.setAttribute("message", "Add Fail!");
                }
            }
        }catch (Exception e) {
            request.setAttribute("message", e.toString());
        }finally{
            request.getRequestDispatcher("createappointment.jsp").forward(request, response);
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
