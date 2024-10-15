<%-- 
    Document   : profile
    Created on : Jul 4, 2024, 9:08:21 AM
    Author     : Dell
--%>

<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link href="profile.css" rel="StyleSheet">
    </head>
    <body>
        <%
            UserDTO list= (UserDTO)session.getAttribute("User_update");
            if(list == null){
                list = (UserDTO)session.getAttribute("LOGIN_USER");
            }
        %>
        <header class="page_head">
            <nav class="navbar">
                <ul class="nav-item">
                    <li><a href="user.jsp">HOME</a></li>
                    <li><a href="index.html">LOG OUT</a></li>
                </ul>
            </nav>
        </header>
        <main class="profile">
            <section class="profile-picture">
                <img src="image/profile.jpg" alt="Profile Picture">
            </section>
            <section class="detail">
                <form action="MainController" method="POST">
                    <input type="hidden" name="userID" value="<%= list.getUserID()%>">
                    <label for="userName" class="form-label">Name:</label>
                    <input type="text" name="userName" value="<%= list.getUserName() %>">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" value="<%= list.getPassword()%>"><br>
                    <label for="phoneNum" class="form-label">Phone Number:</label>
                    <input type="text" name="phoneNum" value="<%= list.getPhoneNum()%>"><br>
                    <label for="email" class="form-label">Email:</label>
                    <input type="text" name="email" value="<%= list.getEmail()%>"><br>
                    <button type="submit" name="action" value="UpdateInformation" style='background-color: #55209F ;color: white '><b>UPDATE INFORMATION</b></button>
                    <% 
                        String message = (String)request.getAttribute("message");
                        if(message== null) message= "";
                    %>
                    <h3 class="message"><%= message %></h3>
                </form>
            </section>
        </main>
        <footer id="contact">
           <p>Hoang Chi Trung - SE181597</p>
            <p>Workshop 2: Appointment Schedule - MVC2</p>
        </footer>
    </body>
</html>
