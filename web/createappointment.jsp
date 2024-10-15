<%-- 
    Document   : createappointment
    Created on : Jul 8, 2024, 8:19:57 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <link href="createappointment.css" rel="StyleSheet">
    </head>
    <body>
        <% 
            String message = (String)request.getAttribute("message");
            if(message== null) {
                message= "";
            }
        %>
        <header class="page_head">
            <nav class="navbar">
                <ul class="nav-item">
                    <li><a href="appointment.jsp">HOME</a></li>
                    <li><a href="DashBoardController">DASHBOARD</a></li>
                    <li><a href="ViewAppointmentController">VIEW AND EDIT</a></li>
                    <li><a href="HistoryController">HISTORY</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2 style="color: #55209F">Appointment Creating Information</h2>
            <section class="Register-form">
                <form action="MainController" method="POST">
                    <label for="Name" class="form-label">Appointment Name:</label>
                    <input type="text" name="Name" required placeholder="Please enter Appointment Name"><br>
                    <label for="AppointmentDate" class="form-label">Appointment Date:</label>
                    <label class="form-label">Click the icon for more details!</label>
                    <input type="date" name="AppointmentDate" required placeholder="Please enter Appointment Date"><br>
                    <label for="AppointmentTime" class="form-label">Appointment Time:</label>
                    <label class="form-label">Click the icon for more details!</label>
                    <input type="time" name="AppointmentTime" required placeholder="Please enter Appointment Time"><br>
                    <label for="purpose" class="form-label">Purpose:</label>
                    <input type="text" name="purpose" required placeholder="Please enter your purpose"><br>
                    <label for="status" class="form-label">Status:</label>
                    <select name="status" required>
                        <option value="">--Select Status--</option>
                        <option value="Ongoing">On-going</option>
                        <option value="NotStarted">Not Started</option>
                        <option value="Done">Done</option>
                    </select>
                    <br><br>
                    <input type="submit" name="action" value="Create" style='background-color: #55209F'>
                </form>
                <h1 class="message"><%= message %></h1>
            </section>
        </main>
        <footer id="contact">
           <p>Hoang Chi Trung - SE181597</p>
            <p>Workshop 2: Appointment Schedule - MVC2</p>
        </footer>
    </body>
</html>
