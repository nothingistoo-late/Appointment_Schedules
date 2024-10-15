<%-- 
    Document   : register
    Created on : Jul 3, 2024, 9:29:19 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="register.css" rel="StyleSheet">
    </head>
    <body>
        <% 
            String message = (String)request.getAttribute("USER_ERROR");
            if(message== null) message= "";
        %>
        <header class="page_head">
            <nav class="navbar">
                <ul class="nav-item">
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="login.jsp">LOGIN</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>Register Information</h2>
            <section class="Register-form">
                <form action="MainController" method="POST">
                    <label for="userID" class="form-label">User ID:</label>
                    <input type="text" name="userID" required placeholder="Please enter User ID"><br> 
                    <label for="userName" class="form-label">User Name:</label>
                    <input type="text" name="userName" required placeholder="Please enter your Name"><br>
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" required placeholder="Please enter password"><br>
                    <label for="confirm" class="form-label">Confirm Password:</label>
                    <input type="password" name="confirm" required placeholder="Please re-enter password"><br>
                    <label for="phoneNum" class="form-label">Phone Number:</label>
                    <input type="text" name="phoneNum" required placeholder="Please enter your Phone Number"><br>
                    <label for="email" class="form-label">Email:</label>
                    <input type="text" name="email" required placeholder="Please enter your Email"><br>
                    <input type="submit" name="action" value="Register">
                </form>
            </section>
            <h1 class="message"><%= message %></h1>
        </main>
        <footer id="contact">
            <p>Hoang Chi Trung - SE181597</p>
            <p>Workshop 2: Appointment Schedule - MVC2</p>
        </footer>
    </body>
</html>
