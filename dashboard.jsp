<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession s = request.getSession(false);

    if(s == null || s.getAttribute("user") == null){
        response.sendRedirect("home.jsp");
        return;
    }

    String user = (String) s.getAttribute("user");
    String role = (String) s.getAttribute("role");

    // 🔥 Doctor should not access dashboard
    if("doctor".equals(role)){
        response.sendRedirect("viewPatients.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
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

<div class="dashboard-container">
    <h1>Dashboard</h1>

    <div class="cards">
        <a href="addPatient.jsp" class="card">
            <h3>Add Patient</h3>
        </a>

        <a href="viewPatients.jsp" class="card">
            <h3>View Patients</h3>
        </a>
    </div>
</div>

</body>
</html>