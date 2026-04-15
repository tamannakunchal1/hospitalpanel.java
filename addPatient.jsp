<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession s = request.getSession(false);

    if(s == null || s.getAttribute("user") == null){
        response.sendRedirect("home.jsp");
        return;
    }

    String user = (String) s.getAttribute("user");
    String role = (String) s.getAttribute("role");

    if("doctor".equals(role)){
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Patient</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="navbar">
    <h2>Hospital Management</h2>
    <div class="nav-right">
        <span>Welcome, <%= user %></span>
        <a href="LogoutServlet" class="logout-btn">Logout</a>
    </div>
</div>

<div class="container">
    <h2>Add Patient</h2>

    <form action="AddPatientServlet" method="post">

        <input type="text" name="name" placeholder="Patient Name" required><br>

        <input type="number" name="age" placeholder="Age" required><br>

        <input type="text" name="disease" placeholder="Illness" required><br>

        <input type="text" name="room_no" placeholder="Room Number" required><br>

        <select name="doctor_id" required>
            <option value="">Assign Doctor</option>
            <option value="1">Dr. Rajesh Sharma</option>
            <option value="2">Dr. Priya Mehta</option>
            <option value="3">Dr. Amit Verma</option>
        </select><br>

        <input type="text" name="contact" placeholder="Contact" required><br>

        <button type="submit">Add Patient</button>

    </form>
</div>

</body>
</html>