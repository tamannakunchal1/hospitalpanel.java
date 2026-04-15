<%@ page import="java.sql.*" %>
<%@ page import="com.project.dao.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession s = request.getSession(false);

    if(s == null || s.getAttribute("user") == null){
        response.sendRedirect("home.jsp");
        return;
    }

    String user = (String) s.getAttribute("user");
    String role = (String) s.getAttribute("role");

    int doctorId = 0;
    if("doctor".equals(role)){
        doctorId = (int) s.getAttribute("doctor_id");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Patients</title>
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
    <h2>Patients List</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Illness</th>
            <th>Room</th>
            <th>Admitted At</th>

            <% if("admin".equals(role)) { %>
                <th>Doctor</th>
                <th>Action</th>
            <% } %>
        </tr>

<%
    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps;

        if("doctor".equals(role)){
            ps = con.prepareStatement(
                "SELECT * FROM patients WHERE doctor_id=?"
            );
            ps.setInt(1, doctorId);
        } else {
            ps = con.prepareStatement(
                "SELECT p.*, d.name AS doctor_name FROM patients p JOIN doctor d ON p.doctor_id=d.id"
            );
        }

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
%>

        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("disease") %></td>
            <td><%= rs.getString("room_no") %></td>
            <td><%= rs.getTimestamp("admitted_at") %></td>

            <% if("admin".equals(role)) { %>
                <td><%= rs.getString("doctor_name") %></td>
                <td>
                    <a href="DeletePatientServlet?id=<%= rs.getInt("id") %>"
                       onclick="return confirm('Delete this patient?')"
                       style="color:red; font-weight:bold;">
                       Delete
                    </a>
                </td>
            <% } %>

        </tr>

<%
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

    </table>
</div>

</body>
</html>