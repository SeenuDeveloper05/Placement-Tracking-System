<%-- 
    Document   : adminDashboard
    Created on : 21-Dec-2025, 7:12:10 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

  
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="admin-bg">

<%
    String admin = (String) session.getAttribute("adminuser");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<div class="dashboard-container">

    <h2>Welcome, <span><%=admin%></span></h2>
    <p class="dept">Admin Dashboard</p>

    <div class="dashboard-actions">
        <a href="AdminViewStudents.jsp" class="btn">
            View Students
        </a>

        <a href="AdminViewCompanies.jsp" class="btn">
            View Companies
        </a>

        <a href="AdminViewApplications.jsp" class="btn secondary">
            View Applications
        </a>

        <a href="<%=request.getContextPath()%>/AdminLogoutServelet"
           class="btn logout">
            Logout
        </a>
    </div>

</div>

</body>
</html>
