<%-- 
    Document   : history
    Created on : Jul 12, 2024, 2:32:46 AM
    Author     : Dell
--%>

<%@page import="user.UserDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="appointment.AppointmentDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
        <link href="history.css" rel="StyleSheet">
    </head>
    <body>
        <%
            UserDTO user= (UserDTO)session.getAttribute("User_update");
            if(user == null){
                user = (UserDTO)session.getAttribute("LOGIN_USER");
            }
            String message = (String)request.getAttribute("message");
                if(message== null) message= "";
        %>
        <header class="page_head">
            <nav class="navbar">
                <ul class="nav-item">
                    <li><a href="user.jsp">HOME</a></li>
                    <li><a href="DashBoardController">DASHBOARD</a></li>
                    <li><a href="ViewAppointmentController">VIEW AND EDIT</a></li>
                    <li><a href="createappointment.jsp">CREATE</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>History Schedule of <%= user.getUserName() %></h2>
            
            <table border="1">
                <tr>
                    <th>Name</th>            
                    <th>Date</th>
                    <th>Time</th>
                    <th>Purpose</th>
                    <th>Status</th>
                </tr>
                <%
                    List<AppointmentDTO> list = (List) session.getAttribute("Appointment_list");
                    LocalDate currentDate = LocalDate.now();
                    if (list != null) {
                        if (list.size() > 0) {
                            for (AppointmentDTO item : list) {
                                LocalDate inputDate = LocalDate.parse(item.getDate());
                                if(inputDate.isBefore(currentDate) || item.getStatus().equals("Done")){
                %>
                <tr>
                    <form action="MainController" method="post">
                        <td><%= item.getName()%></td>
                        <td><%= item.getDate()%></td>
                        <td><%= item.getTime()%></td>
                        <td><%= item.getPurpose()%></td> 
                        <td><%= item.getStatus()%></td>
                        
                        <input type="hidden" name="ID" value="<%= item.getID()%>" >
                        <input type="hidden" name="userID" value="<%= item.getUserID()%>" >
                    </form>
                </tr>
                <%
                                }
                            }
                        }
                    }
                %>
            </table>
            <h3><%= message %></h3>
        </main>
        <footer id="contact">
            <p>Hoang Chi Trung - SE181597</p>
            <p>Workshop 2: Appointment Schedule - MVC2</p>
        </footer>
    </body>
</html>
