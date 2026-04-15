package com.project.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import com.project.dao.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps;

            if ("doctor".equals(role)) {
                ps = con.prepareStatement(
                    "SELECT * FROM doctor WHERE username=? AND password=?"
                );
            } else {
                ps = con.prepareStatement(
                    "SELECT * FROM admin WHERE username=? AND password=?"
                );
            }

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                session.setAttribute("role", role);

                if ("doctor".equals(role)) {
                    session.setAttribute("doctor_id", rs.getInt("id"));

                    // 🔥 DOCTOR → DIRECT TABLE
                    response.sendRedirect("viewPatients.jsp");
                } else {
                    // 🔥 ADMIN → DASHBOARD
                    response.sendRedirect("dashboard.jsp");
                }

            } else {
                response.getWriter().println("Invalid Login");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}