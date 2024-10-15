<%-- 
    Document   : dashboard
    Created on : Jul 12, 2024, 1:43:05 AM
    Author     : Dell
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="appointment.AppointmentDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board Page</title>
        <link href="dashboard.css" rel="StyleSheet">
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
        <header class="page_head" >
            <nav class="navbar">
                <ul class="nav-item">
                    <li><a href="user.jsp">HOME</a></li>
                    <li><a href="ViewAppointmentController">VIEW AND EDIT</a></li>
                    <li><a href="createappointment.jsp">CREATE</a></li>
                    <li><a href="HistoryController">HISTORY</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>Upcoming Schedule for <%= user.getUserName() %></h2>
            
            <table border="1">
                <tr>
                    <th>Name</th>            
                    <th>Date</th>
                    <th>Time</th>
                    <th>Purpose</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                <%
                    List<AppointmentDTO> list = (List) session.getAttribute("Appointment_list");
                    LocalDate currentDate = LocalDate.now();
                    if (list != null) {
                        if (list.size() > 0) {
                            for (AppointmentDTO item : list) {
                                LocalDate inputDate = LocalDate.parse(item.getDate());
                                if(!inputDate.isBefore(currentDate) || !item.getStatus().equals("Done")){
                %>
                <tr>
                    <form action="MainController" method="post">
                        <td><%= item.getName()%></td>
                        <td><%= item.getDate()%></td>
                        <td><%= item.getTime()%></td>
                        <td><%= item.getPurpose()%></td> 
                        <td><%= item.getStatus()%></td>
                        <input type="hidden" name="Name" value="<%= item.getName()%>" >
                        <input type="hidden" name="purpose" value="<%= item.getPurpose()%>" >
                        <input type="hidden" name="date" value="<%= item.getDate()%>" >
                        <input type="hidden" name="time" value="<%= item.getTime()%>" >
                        <td><input type="submit" name="action" value="Send Reminder"></td>
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
        
    </body>
</html>
