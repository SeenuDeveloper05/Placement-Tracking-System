<%-- 
    Document   : companyDashboard
    Created on : 21-Dec-2025, 2:45:01 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Dashboard</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="company-bg">

<%
    String company = (String) session.getAttribute("companyname");
    if (company == null) {
        response.sendRedirect("companyLogin.jsp");
        return;
    }
%>

<div class="dashboard-container">

    <h2>Welcome, <span><%=company%></span></h2>

    <p class="dept">
        Min CGPA: <%= session.getAttribute("mincgpa") %>
    </p>

    <p class="dept">
        Max Arrears: <%= session.getAttribute("maxArrears") %>
    </p>

    <div class="dashboard-actions">
        <a href="companyLogin.jsp" class="btn logout">
            Logout
        </a>
    </div>

</div>

</body>
</html>
