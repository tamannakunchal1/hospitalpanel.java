<!DOCTYPE html>
<html>
<head>
<title>Hospital System</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="home-container">

    <h1>Hospital Management System</h1>

    <div class="login-cards">

        <!-- ADMIN -->
        <div class="login-card">
            <h2>Admin Login</h2>
            <p>Manage patients, records and system settings</p>
            <a href="login.jsp?role=admin" class="login-btn">Login as Admin</a>
        </div>

        <!-- DOCTOR -->
        <div class="login-card">
            <h2>Doctor Login</h2>
            <p>View patients and manage medical records</p>
            <a href="login.jsp?role=doctor" class="login-btn">Login as Doctor</a>
        </div>

    </div>

</div>

</body>
</html>