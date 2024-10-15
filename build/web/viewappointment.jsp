<%-- 
    Document   : viewAppointment
    Created on : Jul 8, 2024, 10:49:49 PM
    Author     : Dell
--%>

<%@page import="java.util.List"%>
<%@page import="appointment.AppointmentDTO"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Appointment Page</title>
        <link href="view.css" rel="StyleSheet">
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
                    <li><a href="dashboard.jsp">DASHBOARD</a></li>
                    <li><a href="createappointment.jsp">CREATE</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>Appointment Schedule for <%= user.getUserName() %></h2>
            
            <table border="1">
                <tr>
                    <th>Name</th>            
                    <th>Date</th>
                    <th>Time</th>
                    <th>Purpose</th>
                    <th>Status</th>
                    <th>Option</th>
                </tr>
                <%
                    List<AppointmentDTO> list = (List) session.getAttribute("Appointment_list");
                    if (list != null) {
                        if (list.size() > 0) {
                            for (AppointmentDTO item : list) {
                %>
                <tr>
                    <form action="MainController" method="post">
                        <td><input type="text" name="Name" value="<%= item.getName()%>"></td>
                        <td><input type="date" name="AppointmentDate" value="<%= item.getDate()%>"></td>
                        <td><input type="time" name="AppointmentTime" value="<%= item.getTime()%>"></td>
                        <td><input type="text" name="purpose" value="<%= item.getPurpose()%>"></td> 
                        <td><select name="status">
                            <option value="<%= item.getStatus()%>"><%= item.getStatus()%></option>
                            <option value="Ongoing">On-going</option>
                            <option value="NotStarted">Not Started</option>
                            <option value="Done">Done</option>
                    </select></td>
                        <td>
                            <input class="button-container" type="submit" name="action" value="Remove">
                            <input class="button-container" type="submit" name="action" value="Edit">
                        </td>
                        <input type="hidden" name="ID" value="<%= item.getID()%>" >
                        <input type="hidden" name="userID" value="<%= item.getUserID()%>" >
                    </form>
                </tr>
                <%
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
