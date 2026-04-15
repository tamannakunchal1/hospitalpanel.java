package com.project.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import com.project.dao.DBConnection;

@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String disease = request.getParameter("disease");
        String contact = request.getParameter("contact");
        String roomNo = request.getParameter("room_no");

        int doctorId = Integer.parseInt(request.getParameter("doctor_id"));

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO patients(name, age, disease, contact, room_no, doctor_id) VALUES (?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, disease);
            ps.setString(4, contact);
            ps.setString(5, roomNo);
            ps.setInt(6, doctorId);

            ps.executeUpdate();

            response.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}