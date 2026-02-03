<%-- 
    Document   : companyRegister
    Created on : 21-Dec-2025, 12:38:30 pm
    Author     : seenu_05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Register</title>

   
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="company-bg">

<div class="dashboard-container">

    <h2>Company Registration</h2>

    <form action="<%=request.getContextPath()%>/CompanyRegisterServelet" method="post">

        <div class="form-group">
            <label>Company Name</label>
            <input type="text" name="company_name" required>
        </div>

        <div class="form-group">
            <label>Minimum CGPA</label>
            <input type="number" step="0.01" name="min_cgpa">
        </div>

        <div class="form-group">
            <label>Maximum Arrears</label>
            <input type="number" name="max_arrears">
        </div>

        <div class="form-group">
            <label>Required Skills</label>
            <input type="text" name="required_skills" placeholder="Java, SQL, HTML">
        </div>

        <input type="submit" value="Register Company" class="btn">

    </form>

    <br>

    <a href="index.jsp" class="btn secondary">Back to Home</a>

</div>

</body>
</html>
