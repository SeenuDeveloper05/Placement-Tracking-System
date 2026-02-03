<%-- 
    Document   : StudentViewApplications
    Created on : 23-Dec-2025, 9:59:52 pm
    Author     : seenu_05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Applications</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="student-bg">

<%
   Integer studentId = (Integer) session.getAttribute("studentId");
      String name = (String) session.getAttribute("studentname");

    if (studentId == null) {
        response.sendRedirect("studentLogin.jsp");
        return;
    }
%>

<div class="dashboard-container">
    <h2>My Applications</h2>
    <p><b>Student:</b> <%=name%></p>

    <table class="data-table">
        <tr>
            <th>Company Name</th>
            <th>Status</th>
        </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/placement_tracker",
            "root",
            "root"
        );

        String query =
            "SELECT c.company_name, a.status " +
            "FROM applications a " +
            "JOIN companies c ON a.company_id = c.company_id " +
            "WHERE a.student_id = ?";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, studentId);
        ResultSet rs = ps.executeQuery();

        boolean hasData = false;

        while (rs.next()) {
            hasData = true;
%>
        <tr>
            <td><%= rs.getString("company_name") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
<%
        }

        if (!hasData) {
%>
        <tr>
            <td colspan="2">No applications submitted yet.</td>
        </tr>
<%
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
    </table>

    <br>

    <a href="studentDashboard.jsp" class="btn secondary">
        Back to Dashboard
    </a>
</div>

</body>
</html>
