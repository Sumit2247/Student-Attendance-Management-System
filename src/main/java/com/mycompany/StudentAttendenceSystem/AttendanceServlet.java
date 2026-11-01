
package com.mycompany.StudentAttendenceSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String studentIdText = request.getParameter("student_id");
        String dateText = request.getParameter("attendance_date");
        String status = request.getParameter("status");

        String message;

        try {
            int studentId = Integer.parseInt(studentIdText);
            Date attendanceDate = Date.valueOf(dateText);

            if (!"Present".equals(status) && !"Absent".equals(status)) {
                throw new IllegalArgumentException("Invalid attendance status.");
            }

            String sql = "INSERT INTO attendance "
                    + "(student_id, attendance_date, status) "
                    + "VALUES (?, ?, ?)";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, studentId);
                ps.setDate(2, attendanceDate);
                ps.setString(3, status);

                ps.executeUpdate();
                message = "Attendance saved successfully!";
            }

        } catch (IllegalArgumentException e) {
            message = "Please select a valid student, date, and status.";

        } catch (SQLException e) {
            getServletContext().log("Error saving attendance", e);

            if (e.getErrorCode() == 1062) {
                message = "Attendance for this student and date already exists.";
            } else {
                message = "Unable to save attendance. Check the database.";
            }
        }

        response.sendRedirect(
                "attendance.jsp?message="
                + java.net.URLEncoder.encode(
                        message, java.nio.charset.StandardCharsets.UTF_8)
        );
    }
}
