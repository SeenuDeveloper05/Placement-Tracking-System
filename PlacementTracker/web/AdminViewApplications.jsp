<%-- 
    Document   : AdminViewApplications
    Created on : 22-Dec-2025, 10:21:50 pm
    Author     : seenu_05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin View Applications</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="admin-bg">

<%
    // admin session check (same key)
    String admin = (String) session.getAttribute("adminuser");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/placement_tracker",
        "root",
        "root"
    );

    // Join applications + students + companies
    String query =
        "SELECT a.application_id, s.name AS student_name, s.department, " +
        "c.company_name, a.status " +
        "FROM applications a " +
        "JOIN students s ON a.student_id = s.student_id " +
        "JOIN companies c ON a.company_id = c.company_id " +
        "ORDER BY a.application_id DESC";

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(query);
%>
<div class="dashboard-container admin-applications">
<h2>Admin - View Applications</h2>
<div class="data-table ">
<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Application ID</th>
        <th>Student Name</th>
        <th>Department</th>
        <th>Company</th>
        <th>Status</th>
    </tr>

<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("application_id") %></td>
        <td><%= rs.getString("student_name") %></td>
        <td><%= rs.getString("department") %></td>
        <td><%= rs.getString("company_name") %></td>
        <td>
    <form action="<%=request.getContextPath()%>/UpdateApplicationStatusServlet" method="post">
        <input type="hidden" name="application_id"
               value="<%= rs.getInt("application_id") %>">

        <select name="status">
            <option value="Applied"
                <%= rs.getString("status").equals("Applied") ? "selected" : "" %>>
                Applied
            </option>
            <option value="Shortlisted"
                <%= rs.getString("status").equals("Shortlisted") ? "selected" : "" %>>
                Shortlisted 
            </option>
            <option value="Rejected"
                <%= rs.getString("status").equals("Rejected") ? "selected" : "" %>>
                Rejected
            </option>
        </select>

        <input type="submit" value="Update">
    </form>
</td>

    </tr>
<%
    }
    rs.close();
    st.close();
    con.close();
%>

</table>

<br>
<a href="adminDashboard.jsp" class="btn primary">Back to Dashboard</a>
</div>
</body>
</html>

