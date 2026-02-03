<%-- 
    Document   : adminLogin
    Created on : 21-Dec-2025, 6:57:02 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="admin-bg">

<div class="dashboard-container">

    <h2>Admin Login</h2>

    <form action="<%=request.getContextPath()%>/AdminLoginServelet" method="post">

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <input type="submit" value="Login" class="btn">

    </form>

    <br>

    <a href="index.jsp" class="btn secondary">Back to Home</a>

</div>

</body>
</html>
