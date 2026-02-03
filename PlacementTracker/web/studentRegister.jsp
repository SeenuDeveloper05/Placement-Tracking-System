<%-- 
    Document   : studentRegister
    Created on : 20-Dec-2025, 8:47:48 pm
    Author     : seenu_05
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>


    <link rel="stylesheet" href="css/style.css">
</head>

<body class="student-bg">

<div class="dashboard-container">

    <h2>Student Registration</h2>

    <form action="StudentRegisterServlet" method="post">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label>Department</label>
            <select name="department" required>
                <option value="">Select</option>
                <option value="CSE">CSE</option>   
                <option value="IT">IT</option> 
                <option value="ECE">ECE</option>
                <option value="EEE">EEE</option>
            </select>
        </div>

        <div class="form-group">
            <label>CGPA</label>
            <input type="number" step="0.01" name="cgpa" required>
        </div>

        <div class="form-group">
            <label>Arrears</label>
            <input type="number" name="arrears" required>
        </div>

        <div class="form-group">
            <label>Skills (comma separated)</label>
            <input type="text" name="skills" placeholder="Java, SQL, HTML" required>
        </div>

        <input type="submit" value="Register" class="btn">

    </form>

    <br>

    <a href="index.jsp" class="btn secondary">Back to Home</a>

</div>

</body>
</html>
