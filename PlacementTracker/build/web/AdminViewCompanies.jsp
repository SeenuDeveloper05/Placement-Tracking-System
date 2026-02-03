<%-- 
    Document   : AdminViewCompanies
    Created on : 21-Dec-2025, 8:35:07 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin View Companies</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="admin-bg">

<%
    // SAME session key – no change
    String admin = (String) session.getAttribute("adminuser");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<div class="dashboard-container wide">

    <h2>Admin - View Companies</h2>

    <table class="data-table">
        <tr>
            <th>ID</th>
            <th>Company Name</th>
            <th>Min CGPA</th>
            <th>Max Arrears</th>
            <th>Required Skills</th>
            <th>Eligible Students</th>
        </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/placement_tracker",
            "root",
            "root"
        );

        String query = "SELECT * FROM companies";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("company_id") %></td>
            <td><%= rs.getString("company_name") %></td>
            <td><%= rs.getFloat("min_cgpa") %></td>
            <td><%= rs.getInt("max_arrears") %></td>
            <td><%= rs.getString("required_skills") %></td>
            <td>
                <a href="AdminMatchStudents.jsp?company_id=<%=rs.getInt("company_id")%>"
                   class="btn secondary small">
                    View Eligible Students
                </a>
            </td>
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
