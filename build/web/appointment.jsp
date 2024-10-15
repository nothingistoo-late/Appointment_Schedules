<%-- 
    Document   : appointment
    Created on : Jul 7, 2024, 7:16:32 PM
    Author     : Dell
--%>

<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Page</title>
        <link href="appointmsent.css" rel="StyleSheet">
    </head>
    <body>
        <%
            UserDTO loginUser= (UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser== null){
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <header class="page_head">
            <nav class="navbar">
                <h3>Welcome: <%= loginUser.getUserName() %></h3>
                <ul class="nav-item">
                    <li><a href="user.jsp">HOME</a></li>
                    <li><a href="DashBoardController">DASHBOARD</a></li>
                    <li><a href="createappointment.jsp">CREATE</a></li>
                    <li><a href="ViewAppointmentController">VIEW AND EDIT</a></li>
                    <li><a href="HistoryController">HISTORY</a></li>
                    <li><a href="index.html">LOG OUT</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <div class="container">
                <form action="MainController" method="POST">
                    <button class="title-button" name="action" value="Create">Set Your Work Schedule</button>
                </form>
                <div class="calendar">
                    <div class="calendar-header">
                        <div>S</div>
                        <div>M</div>
                        <div>T</div>
                        <div>W</div>
                        <div>T</div>
                        <div>F</div>
                        <div>S</div>
                    </div>
                    <div class="calendar-days">
                        <div class="calendar-day red">S</div>
                        <div class="calendar-day">M</div>
                        <div class="calendar-day">T</div>
                        <div class="calendar-day">W</div>
                        <div class="calendar-day">T</div>
                        <div class="calendar-day">F</div>
                        <div class="calendar-day">S</div>
                    </div>
                </div>
            </div>
        </main>
        <footer id="contact">
           <p>Hoang Chi Trung - SE181597</p>
            <p>Workshop 2: Appointment Schedule - MVC2</p>
        </footer>
    </body>
</html>
