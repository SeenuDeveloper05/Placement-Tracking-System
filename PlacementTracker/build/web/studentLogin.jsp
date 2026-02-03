<%-- 
    Document   : studentLogin
    Created on : 21-Dec-2025, 11:12:04 am
    Author     : seenu_05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>

    
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="student-bg">

<div class="dashboard-container">

    <h2>Student Login</h2>

    <form action="<%=request.getContextPath()%>/StudentLoginServlet" method="post">

        <div class="form-group">
            <label>Name:</label>
            <input type="text" name="name" required>
        </div>

        <input type="submit" value="Login" class="btn">

    </form>

    <br>

    <a href="index.jsp" class="btn secondary">Back to Home</a>

</div>

</body>
</html>
