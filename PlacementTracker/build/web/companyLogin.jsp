<%-- 
    Document   : companyLogin
    Created on : 21-Dec-2025, 1:14:10 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Login</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="company-bg">

<div class="dashboard-container">

    <h2>Company Login</h2>

    <form action="<%=request.getContextPath()%>/CompanyLoginServelet" method="post">

        <div class="form-group">
            <label>Company Name</label>
            <input type="text" name="company_name" required>
        </div>

        <input type="submit" value="Login" class="btn">

    </form>

    <br>

    <a href="index.jsp" class="btn secondary">Back to Home</a>

</div>

</body>
</html>
