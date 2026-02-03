<%-- 
    Document   : StudentEligibleCompanies
    Created on : 22-Dec-2025, 9:37:48 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eligible Companies</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="student-bg">

<%
    Integer studentId = (Integer) session.getAttribute("studentId");
    if (studentId == null) {
        response.sendRedirect("studentLogin.jsp");
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/placement_tracker",
        "root",
        "root"
    );

    PreparedStatement sps = con.prepareStatement(
        "SELECT cgpa, arrears, skills FROM students WHERE student_id=?"
    );
    sps.setInt(1, studentId);
    ResultSet srs = sps.executeQuery();
    srs.next();

    float cgpa = srs.getFloat("cgpa");
    int arrears = srs.getInt("arrears");
    String skills = srs.getString("skills").toLowerCase();
%>

<div class="dashboard-container wide">

    <h2>Eligible Companies</h2>

    <table class="data-table">
        <tr>
            <th>Company</th>
            <th>Min CGPA</th>
            <th>Max Arrears</th>
            <th>Skills</th>
            <th>Action</th>
        </tr>

<%
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM companies");

    while (rs.next()) {
        float minCgpa = rs.getFloat("min_cgpa");
        int maxArr = rs.getInt("max_arrears");
        String reqSkills = rs.getString("required_skills").toLowerCase();

        boolean skillMatch = true;
        for (String cs : reqSkills.split(",")) {
            if (!skills.contains(cs.trim())) {
                skillMatch = false;
                break;
            }
        }

        boolean eligible =
                cgpa >= minCgpa &&
                arrears <= maxArr &&
                skillMatch;

        if (eligible) {

            boolean alreadyApplied = false;
            PreparedStatement aps = con.prepareStatement(
                "SELECT 1 FROM applications WHERE student_id=? AND company_id=?"
            );
            aps.setInt(1, studentId);
            aps.setInt(2, rs.getInt("company_id"));
            ResultSet ars = aps.executeQuery();

            if (ars.next()) {
                alreadyApplied = true;
            }
            ars.close();
            aps.close();
%>

        <tr>
            <td><%= rs.getString("company_name") %></td>
            <td><%= minCgpa %></td>
            <td><%= maxArr %></td>
            <td><%= rs.getString("required_skills") %></td>
            <td>
                <%
                    if (alreadyApplied) {
                %>
                    <span class="status applied">Applied</span>
                <%
                    } else {
                %>
                    <form action="<%=request.getContextPath()%>/StudentApplyServelet" method="post">
                        <input type="hidden" name="company_id"
                               value="<%= rs.getInt("company_id") %>">
                        <input type="submit" value="Apply" class="btn">
                    </form>
                <%
                    }
                %>
            </td>
        </tr>

<%
        }
    }

    rs.close();
    st.close();
    con.close();
%>

    </table>

    <br>

    <a href="studentDashboard.jsp" class="btn secondary">Back to Dashboard</a>

</div>

</body>
</html>
