/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String WELCOME="index.html";
    private static final String LOGIN="Login";
    private static final String LOGIN_CONTROLLER="LoginController";
    private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER="LogoutController";
    private static final String REGISTER="Register";
    private static final String REGISTER_CONTROLLER="RegisterController";
    private static final String UPDATEINFOR="UpdateInformation";
    private static final String UPDATE_INFORMATION_CONTROLLER="UpdateInformationController";
    private static final String CREATEAPPOINTMENT="Create";
    private static final String CREATE_APPOINTMENT_CONTROLLER="CreateController";
    private static final String REMOVEAPPOINTMENT="Remove";
    private static final String REMOVE_APPOINTMENT_CONTROLLER="RemoveController";
    private static final String EDITAPPOINTMENT="Edit";
    private static final String EDIT_APPOINTMENT_CONTROLLER="EditController";
    private static final String REMINDER="Send Reminder";
    private static final String REMINDER_CONTROLLER="ReminderController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= WELCOME;
        try {
            String action= request.getParameter("action");
            if(action.equals(LOGIN)){
               url = LOGIN_CONTROLLER;
            }else if(action.equals(LOGOUT)){
               url = LOGOUT_CONTROLLER;
            }else if(action.equals(REGISTER)){
               url = REGISTER_CONTROLLER;
            }else if(action.equals(UPDATEINFOR)){
               url = UPDATE_INFORMATION_CONTROLLER;
            }else if(action.equals(CREATEAPPOINTMENT)){
               url = CREATE_APPOINTMENT_CONTROLLER;
            }else if(action.equals(REMOVEAPPOINTMENT)){
               url = REMOVE_APPOINTMENT_CONTROLLER;
            }else if(action.equals(EDITAPPOINTMENT)){
               url = EDIT_APPOINTMENT_CONTROLLER;
            }else if(action.equals(REMINDER)){
               url = REMINDER_CONTROLLER;
            }else{
                request.setAttribute("ERROR", "Your action not support");
            }

        } catch (Exception e) {
            log("error at MainController: "+ e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
