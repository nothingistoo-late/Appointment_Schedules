<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="login.css" rel="stylesheet">
    </head>
    <body>
        <header class="page_head">
            <nav class="navbar">
                <ul class="nav-item">
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="register.jsp">REGISTER</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>Login Information</h2>
            <section class="Login-form">
                <form action="MainController" method="POST">
                    <input type="text" style="width: 400px" name="userID" required placeholder="Please enter User ID"><br> 
                    <input type="password" name="password" required placeholder="Please enter password"><br>
                    <%
                        String message = (String) request.getAttribute("ERROR");
                        if (message == null) {
                            message = "";
                        }
                    %>
                    <h1 class="message"><%= message%></h1>
                    <input type="submit" name="action" value="Login">
                </form>
            </section>
        </main>
        <footer id="contact">
            <p>Hoang Chi Trung - SE181597</p>
            <p>Workshop 2: Appointment Schedule - MVC2</p>
        </footer>
    </body>
</html>
