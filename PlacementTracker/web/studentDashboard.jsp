<%-- 
    Document   : studentDashboard
    Created on : 21-Dec-2025, 11:46:23 am
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>

    <!-- CSS link -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="student-bg">

<%
   String name = (String) session.getAttribute("studentname");
   String dept = (String) session.getAttribute("studentdept");
   if(name == null){
      response.sendRedirect("studentLogin.jsp");
      return;
   }
%>

<div class="dashboard-container">

    <h2>Welcome, <span><%=name%></span></h2>
    <p class="dept">Department: <%=dept%></p>

    <div class="dashboard-actions">
        <a href="StudentEligibleCompanies.jsp" class="btn">
            View Eligible Companies
        </a>

        <a href="StudentViewApplications.jsp" class="btn secondary">
            View Application Status
        </a>

        <a href="<%=request.getContextPath()%>/StudentLogoutServelet" class="btn logout">
            Logout
        </a>
    </div>

</div>

</body>
</html>
