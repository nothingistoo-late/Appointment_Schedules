<%-- 
    Document   : user
    Created on : Jul 2, 2024, 3:59:03 PM
    Author     : Dell
--%>

<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link href="user.css" rel="StyleSheet">
    </head>
    <body>
        <%
            UserDTO loginUser= (UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser== null){
                response.sendRedirect("login.jsp");
                return;
            }
            UserDTO list= (UserDTO)session.getAttribute("User_update");
            if(list == null){
                list = (UserDTO)session.getAttribute("LOGIN_USER");
            }
        %>
        <header class="page_head">
            <nav class="navbar">
                <h3>Welcome: <%= list.getUserName() %></h3>
                <ul class="nav-item">
                    <li><a href="user.jsp">HOME</a></li>
                    <li><a href="DashBoardController">DASHBOARD</a></li>
                    <li><a href="HistoryController">HISTORY</a></li>
                    <li><a href="profile.jsp">PROFILE</a></li>
                    <li><a href="index.html">LOG OUT</a></li>
                </ul>
            </nav>
            
        </header>
        <main>
            <section class="content-section">
                <div class="text-content">
                    <h1>Smatter way to schedule</h1>
                    <p>Save time scheduling meetings by combining multiple calendars into a single view. Additionally, you can help everyone stay informed with shared calendars.</p>
                    <form action="MainController" method="POST">
                        <button class="feature-button" name="action" value="Create">CREATE NOW</button>
                    </form>
                </div>
                <div class="image-content">
                    <img src="https://c7.alamy.com/comp/2CB9G5F/plan-and-schedule-calendar-with-marker-date-for-web-website-home-homepage-landing-page-template-banner-with-modern-flat-style-2CB9G5F.jpg" alt="Calendar example">
                </div>
            </section>
            <section class="content-section-2">
                <div>
                    <h1>Giải quyết các việc phải hoàn thành</h1>
                    <div class="task-section">
                        <div class="task-item">
                            <h2>My Tasks</h2>
                            <ul>
                                <li>Title</li>
                                <li>Details</li>
                                <li>Date/time</li>
                                <img src='https://as1.ftcdn.net/v2/jpg/01/88/31/62/1000_F_188316212_TUk88W7mwALEtwYjDlOEXnFERBc1Gtga.jpg'>
                            </ul>
                        </div>
                        <div class="task-item">
                            <h2>Đặt ngày đến hạn</h2>
                            <p>Chọn ngày hoặc thời gian mà bạn muốn hoàn thành việc cần làm.</p>
                            <img src="image/tl-schedule.jpg" alt="Calendar">
                        </div>
                        <div class="task-item">
                            <h2>Đánh dấu là hoàn thành</h2>
                            <p>Đánh dấu việc cần làm là hoàn thành để theo dõi những công việc bạn đã làm xong.</p>
                            <div class="tasks-done">
                                <p>TUE 27</p>
                                <ul>
                                    <li>Submit reimbursement</li>
                                    <li>Feedback request</li>
                                    <li>Invoice</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <footer id="contact">
            <p>Hoang Chi Trung - SE181597</p>
            <p>Workshop 2: Appointment Schedule - MVC2</p>
        </footer>
    </body>
</html>
