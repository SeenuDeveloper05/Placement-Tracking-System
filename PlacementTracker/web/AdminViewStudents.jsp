<%-- 
    Document   : AdminViewStudents
    Created on : 21-Dec-2025, 7:22:28 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin View Students</title>

    
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="admin-bg">

<%
    // admin session check
    String admin = (String) session.getAttribute("adminuser");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<div class="dashboard-container wide">

    <h2>Admin - View Students</h2>

    <table class="data-table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>CGPA</th>
            <th>Arrears</th>
            <th>Skills</th>
        </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/placement_tracker",
            "root",
            "root"
        );

        String query = "SELECT * FROM students";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("student_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getFloat("cgpa") %></td>
            <td><%= rs.getInt("arrears") %></td>
            <td><%= rs.getString("skills") %></td>
        </tr>
<%
        }

        con.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>

    </table>

    <br>

    <a href="adminDashboard.jsp" class="btn secondary">
        Back to Dashboard
    </a>

</div>

</body>
</html>
