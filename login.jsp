<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String role = request.getParameter("role");
    if(role == null) role = "admin";
%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">
    <h2><%= role.toUpperCase() %> Login</h2>

    <form action="LoginServlet" method="post">
        <input type="hidden" name="role" value="<%= role %>">

        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>