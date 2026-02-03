<%-- 
    Document   : AdminMatchStudents
    Created on : 22-Dec-2025, 10:24:30 am
    Author     : seenu_05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student-Company Matching</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="admin-bg">

<div class="dashboard-container admin-match">


<%
   String admin=(String) session.getAttribute("adminuser");
   if(admin == null){
     response.sendRedirect("adminLogin.jsp");
     return;
   }

   String companyid= request.getParameter("company_id");
   if(companyid == null){
     out.println("Company not Selected");
     return; 
   }

   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/placement_tracker",
        "root",
        "root"
   );

   String cquery="select * from companies where company_id= ?;";
   PreparedStatement cps=con.prepareStatement(cquery);
   cps.setInt(1, Integer.parseInt(companyid));
   ResultSet crs=cps.executeQuery();

   if(!crs.next()){
      out.println("Invalid company");
      con.close();
      return;
   }

   float mincgpa=crs.getFloat("min_cgpa");
   int maxArrears=crs.getInt("max_arrears");
   String reqSkills=crs.getString("required_skills").toLowerCase();
%>

<h2>Eligible Students</h2>
<p><b>Company:</b> <%=crs.getString("company_name")%></p>

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
   String squery="select * from students";
   Statement st = con.createStatement();
   ResultSet rs = st.executeQuery(squery);

   while(rs.next()){
      float cgpa=rs.getFloat("cgpa");
      int arrears=rs.getInt("arrears");
      String skills=rs.getString("skills").toLowerCase();

      boolean allMatch=true;
      for(String cs: reqSkills.split(",")){
         if(!skills.contains(cs.trim())){
            allMatch=false;
            break;
         }
      }

      boolean eligible =
            cgpa >= mincgpa &&
            arrears <= maxArrears &&
            allMatch;

      if(eligible){
%>
<tr>
    <td><%= rs.getInt("student_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("department") %></td>
    <td><%= cgpa %></td>
    <td><%= arrears %></td>
    <td><%= rs.getString("skills") %></td>
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
<a href="AdminViewCompanies.jsp" class="btn secondary">Back</a>

</div>
</body>
</html>
